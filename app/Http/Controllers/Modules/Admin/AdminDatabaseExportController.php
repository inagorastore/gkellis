<?php

namespace App\Http\Controllers\Modules\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;
use Symfony\Component\HttpFoundation\StreamedResponse;

class AdminDatabaseExportController extends Controller
{
    public function __invoke(): StreamedResponse
    {
        $connection = DB::connection();

        if (! in_array($connection->getDriverName(), ['mysql', 'mariadb'], true)) {
            abort(Response::HTTP_UNPROCESSABLE_ENTITY, 'Database export supports only MySQL/MariaDB.');
        }

        $databaseName = $connection->getDatabaseName() ?? 'database';
        $safeDatabaseName = preg_replace('/[^a-zA-Z0-9_\-]+/', '-', $databaseName) ?: 'database';
        $timestamp = now()->format('Ymd-His');
        $filename = sprintf('%s-backup-%s.sql', $safeDatabaseName, $timestamp);

        return response()->streamDownload(function () use ($connection, $databaseName): void {
            $pdo = $connection->getPdo();
            $tables = $connection->select('SHOW TABLES');

            echo sprintf("-- Exported from %s at %s\n", $databaseName, now()->toDateTimeString());
            echo "SET FOREIGN_KEY_CHECKS=0;\n";
            echo "SET SQL_MODE = 'NO_AUTO_VALUE_ON_ZERO';\n";
            echo "SET NAMES utf8mb4;\n\n";

            foreach ($tables as $tableObject) {
                $table = (string) array_values((array) $tableObject)[0];
                $safeTable = str_replace('`', '``', $table);
                $createRow = (array) $connection->selectOne(sprintf('SHOW CREATE TABLE `%s`', $safeTable));
                $createStatement = (string) ($createRow['Create Table'] ?? array_values($createRow)[1] ?? '');

                echo sprintf("--\n-- Table structure for `%s`\n--\n\n", $table);
                echo sprintf("DROP TABLE IF EXISTS `%s`;\n", $safeTable);
                echo $createStatement.";\n\n";

                $columns = Schema::connection($connection->getName())->getColumnListing($table);

                if (empty($columns)) {
                    continue;
                }

                $escapedColumns = implode(
                    ', ',
                    array_map(
                        static fn (string $column): string => sprintf('`%s`', str_replace('`', '``', $column)),
                        $columns
                    )
                );

                echo sprintf("--\n-- Data for `%s`\n--\n\n", $table);

                foreach ($connection->table($table)->cursor() as $row) {
                    $rowValues = (array) $row;
                    $preparedValues = [];

                    foreach ($columns as $column) {
                        $value = $rowValues[$column] ?? null;
                        $preparedValues[] = $this->toSqlValue($value, $pdo);
                    }

                    echo sprintf(
                        "INSERT INTO `%s` (%s) VALUES (%s);\n",
                        $safeTable,
                        $escapedColumns,
                        implode(', ', $preparedValues)
                    );
                }

                echo "\n";
            }

            echo "SET FOREIGN_KEY_CHECKS=1;\n";
        }, $filename, [
            'Content-Type' => 'application/sql; charset=UTF-8',
        ]);
    }

    private function toSqlValue(mixed $value, \PDO $pdo): string
    {
        if ($value === null) {
            return 'NULL';
        }

        if (is_bool($value)) {
            return $value ? '1' : '0';
        }

        if (is_int($value) || is_float($value)) {
            return (string) $value;
        }

        return $pdo->quote((string) $value);
    }
}
