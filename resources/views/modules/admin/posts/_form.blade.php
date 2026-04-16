@csrf
<div class="space-y-4 rounded-lg bg-white p-6 shadow">
    <label class="block space-y-1 text-sm text-gray-700">
        <span>Category</span>
        <select name="category_id" class="w-full rounded border-gray-300">
            <option value="">Select existing category</option>
            @foreach (($categories ?? collect()) as $category)
                <option value="{{ $category->id }}" @selected((string) old('category_id', $post->category_id ?? '') === (string) $category->id)>
                    {{ $category->name }}
                </option>
            @endforeach
        </select>
        <input name="category_name" value="{{ old('category_name') }}" placeholder="Or create new category (e.g. Πολιτική)" class="mt-2 w-full rounded border-gray-300">
    </label>
    <label class="block space-y-1 text-sm text-gray-700">
        <span>Tags</span>
        <input id="post-tags" name="tags" list="existing-tags"
               value="{{ old('tags', isset($post) ? $post->tags->pluck('name')->implode(', ') : '') }}"
               placeholder="Comma separated, e.g. εκλογές, τοπική αυτοδιοίκηση"
               class="w-full rounded border-gray-300">
        <p class="text-xs text-gray-500">Ξεκίνα να γράφεις tag για προτάσεις από υπάρχοντα.</p>
    </label>
    <datalist id="existing-tags">
        @foreach (($existingTags ?? collect()) as $tagName)
            <option value="{{ $tagName }}"></option>
        @endforeach
    </datalist>
    <input id="post-title" name="title" value="{{ old('title', $post->title ?? '') }}" placeholder="Title" required class="w-full rounded border-gray-300">
    <input id="post-slug" name="slug" value="{{ old('slug', $post->slug ?? '') }}" placeholder="Slug" class="w-full rounded border-gray-300">
    <div class="block space-y-1 text-sm text-gray-700">
        <label for="excerpt-editor"><span>Excerpt</span></label>
        <input id="excerpt-editor" type="hidden" name="excerpt" value="{{ old('excerpt', $post->excerpt ?? '') }}">
        <trix-editor input="excerpt-editor" class="trix-content rounded border border-gray-300 bg-white"></trix-editor>
        <p class="text-xs text-gray-500">Αν το αφήσεις κενό, θα δημιουργηθεί αυτόματα από το body.</p>
    </div>
    <div class="block space-y-1 text-sm text-gray-700">
        <label for="body-editor"><span>Article body</span></label>
        <input id="body-editor" type="hidden" name="body" value="{{ old('body', $post->body ?? '') }}">
        <trix-editor input="body-editor" class="trix-content rounded border border-gray-300 bg-white"></trix-editor>
    </div>
    <label class="block space-y-1 text-sm text-gray-700">
        <span>Publication date</span>
        <input type="datetime-local"
               name="published_at"
               value="{{ old('published_at', isset($post) && $post->published_at ? $post->published_at->format('Y-m-d\TH:i') : '') }}"
               class="w-full rounded border-gray-300">
    </label>
    <label class="block space-y-1 text-sm text-gray-700">
        <span>Featured image</span>
        <input type="file" name="cover_image" accept="image/*" class="w-full rounded border-gray-300">
    </label>
    @if (!empty($post?->cover_image_path))
        <div class="space-y-2">
            <p class="text-xs uppercase tracking-wide text-gray-500">Current image</p>
            <img src="{{ \Illuminate\Support\Facades\Storage::url($post->cover_image_path) }}"
                 alt="Featured image preview"
                 class="h-40 w-full rounded object-cover md:w-80">
        </div>
    @endif
    <label class="block space-y-1 text-sm text-gray-700">
        <span>Meta title</span>
        <input id="meta-title" name="meta_title" value="{{ old('meta_title', $post->meta_title ?? '') }}" placeholder="Meta title" class="w-full rounded border-gray-300">
        <p id="meta-title-counter" class="text-xs text-gray-500">0/255</p>
    </label>
    <label class="block space-y-1 text-sm text-gray-700">
        <span>Meta description</span>
        <input id="meta-description" name="meta_description" value="{{ old('meta_description', $post->meta_description ?? '') }}" placeholder="Meta description" class="w-full rounded border-gray-300">
        <p id="meta-description-counter" class="text-xs text-gray-500">0/160</p>
    </label>
    <label class="block space-y-1 text-sm text-gray-700">
        <span>Open Graph image (Facebook)</span>
        <input
            id="og-image"
            name="og_image"
            type="url"
            value="{{ old('og_image', $post->og_image ?? '') }}"
            placeholder="https://example.com/path/to/image.jpg"
            class="w-full rounded border-gray-300"
        >
        <p class="text-xs text-gray-500">Προαιρετικό URL. Αν ανέβει αρχείο παρακάτω, θα έχει προτεραιότητα.</p>
    </label>
    <label class="block space-y-1 text-sm text-gray-700">
        <span>Open Graph image upload (Facebook)</span>
        <input type="file" name="og_image_upload" accept="image/*" class="w-full rounded border-gray-300">
        <p class="text-xs text-gray-500">Αν λείπουν και URL και upload, γίνεται fallback στη Featured image.</p>
    </label>
    @if (!empty($post?->og_image))
        @php
            $resolvedOgImage = str_starts_with($post->og_image, 'http://') || str_starts_with($post->og_image, 'https://')
                ? $post->og_image
                : \Illuminate\Support\Facades\Storage::url($post->og_image);
        @endphp
        <div class="space-y-2">
            <p class="text-xs uppercase tracking-wide text-gray-500">Current Open Graph image</p>
            <img src="{{ $resolvedOgImage }}"
                 alt="Open Graph image preview"
                 class="h-40 w-full rounded object-cover md:w-80">
        </div>
        <label class="inline-flex items-center gap-2 text-sm text-red-700">
            <input type="checkbox" name="remove_og_image" value="1" @checked(old('remove_og_image'))>
            Remove current Open Graph image on save
        </label>
    @endif
    @if (isset($post))
        @php
            $postPublicUrl = route('blog.show', ['post' => $post->slug]);
            $facebookDebuggerUrl = 'https://developers.facebook.com/tools/debug/?q=' . urlencode($postPublicUrl);
        @endphp
        <div class="rounded border border-blue-100 bg-blue-50 p-3 text-sm text-blue-900">
            <p class="font-medium">Facebook preview</p>
            <p class="mt-1 text-xs text-blue-800">Μετά το save, κάνε scrape στο debugger για να ανανεωθεί η προεπισκόπηση.</p>
            <div class="mt-2 flex flex-wrap gap-2">
                <a href="{{ $postPublicUrl }}" target="_blank" rel="noopener" class="rounded border border-blue-200 bg-white px-3 py-1.5 text-xs font-medium text-blue-900">Open public article</a>
                <a href="{{ $facebookDebuggerUrl }}" target="_blank" rel="noopener" class="rounded border border-blue-200 bg-white px-3 py-1.5 text-xs font-medium text-blue-900">Open Facebook Sharing Debugger</a>
            </div>
        </div>
    @endif
    <label class="inline-flex items-center gap-2 text-sm">
        <input type="checkbox" name="is_published" value="1" @checked(old('is_published', $post->is_published ?? false))>
        Publish
    </label>
    <div class="flex flex-wrap items-center gap-2">
        <button type="button" id="preview-post-button" class="rounded border border-gray-300 bg-white px-4 py-2 text-sm text-gray-700">
            Preview
        </button>
        <button class="rounded bg-blue-800 px-4 py-2 text-sm text-white">{{ $submitLabel }}</button>
    </div>
</div>

<div id="post-preview" class="mt-6 hidden rounded-lg bg-white p-6 shadow">
    <p class="text-xs uppercase tracking-wide text-blue-700" id="preview-date"></p>
    <h2 class="mt-2 text-2xl font-bold text-slate-900" id="preview-title"></h2>
    <img id="preview-cover" src="" alt="Preview cover image" class="mt-4 hidden h-56 w-full rounded object-cover md:w-3/4">
    <div class="prose mt-4 max-w-none text-slate-700" id="preview-excerpt"></div>
    <hr class="my-6 border-slate-200">
    <div class="prose max-w-none text-slate-700" id="preview-body"></div>
</div>

<script>
    (() => {
        const titleInput = document.querySelector('input[name="title"]');
        const slugInput = document.getElementById('post-slug');
        const metaTitleInput = document.getElementById('meta-title');
        const metaDescriptionInput = document.getElementById('meta-description');
        const dateInput = document.querySelector('input[name="published_at"]');
        const tagsInput = document.getElementById('post-tags');
        const coverInput = document.querySelector('input[name="cover_image"]');
        const excerptInput = document.getElementById('excerpt-editor');
        const bodyInput = document.getElementById('body-editor');
        const previewButton = document.getElementById('preview-post-button');
        const previewBox = document.getElementById('post-preview');
        const metaTitleCounter = document.getElementById('meta-title-counter');
        const metaDescriptionCounter = document.getElementById('meta-description-counter');
        const existingTags = @json(($existingTags ?? collect())->values());

        if (!previewButton || !previewBox || !titleInput || !excerptInput || !bodyInput) {
            return;
        }

        const previewTitle = document.getElementById('preview-title');
        const previewDate = document.getElementById('preview-date');
        const previewExcerpt = document.getElementById('preview-excerpt');
        const previewBody = document.getElementById('preview-body');
        const previewCover = document.getElementById('preview-cover');
        const fallbackCover = @json(isset($post) && $post->cover_image_path ? \Illuminate\Support\Facades\Storage::url($post->cover_image_path) : null);
        let slugTouched = Boolean(slugInput?.value);

        const transliterateGreek = (value) => {
            let normalized = (value || '').toLowerCase().trim();
            const digraphs = {
                'αι': 'ai', 'ει': 'ei', 'οι': 'oi', 'ου': 'ou', 'ευ': 'eu', 'αυ': 'au',
                'γγ': 'ng', 'γκ': 'gk', 'ντ': 'nt', 'μπ': 'mp', 'τσ': 'ts', 'τζ': 'tz',
            };
            const letters = {
                'ά': 'a', 'α': 'a', 'β': 'v', 'γ': 'g', 'δ': 'd', 'έ': 'e', 'ε': 'e',
                'ζ': 'z', 'ή': 'i', 'η': 'i', 'ί': 'i', 'ϊ': 'i', 'ΐ': 'i', 'ι': 'i',
                'κ': 'k', 'λ': 'l', 'μ': 'm', 'ν': 'n', 'ξ': 'x', 'ό': 'o', 'ο': 'o',
                'π': 'p', 'ρ': 'r', 'σ': 's', 'ς': 's', 'τ': 't', 'ύ': 'y', 'ϋ': 'y',
                'ΰ': 'y', 'υ': 'y', 'φ': 'f', 'χ': 'ch', 'ψ': 'ps', 'ώ': 'o', 'ω': 'o',
            };

            Object.entries(digraphs).forEach(([from, to]) => {
                normalized = normalized.replaceAll(from, to);
            });
            Object.entries(letters).forEach(([from, to]) => {
                normalized = normalized.replaceAll(from, to);
            });

            return normalized;
        };

        const slugify = (value) => transliterateGreek(value)
            .normalize('NFD')
            .replace(/[\u0300-\u036f]/g, '')
            .replace(/[^a-z0-9\s-]/g, '')
            .replace(/\s+/g, '-')
            .replace(/-+/g, '-')
            .replace(/^-|-$/g, '');

        const updateCounter = (input, counter, limit) => {
            if (!input || !counter) {
                return;
            }

            const length = input.value.length;
            counter.textContent = `${length}/${limit}`;
            counter.className = length > limit ? 'text-xs text-red-600' : 'text-xs text-gray-500';
        };

        titleInput.addEventListener('input', () => {
            if (slugInput && !slugTouched) {
                slugInput.value = slugify(titleInput.value);
            }
        });

        slugInput?.addEventListener('input', () => {
            slugTouched = slugInput.value.length > 0;
        });

        metaTitleInput?.addEventListener('input', () => updateCounter(metaTitleInput, metaTitleCounter, 255));
        metaDescriptionInput?.addEventListener('input', () => updateCounter(metaDescriptionInput, metaDescriptionCounter, 160));
        updateCounter(metaTitleInput, metaTitleCounter, 255);
        updateCounter(metaDescriptionInput, metaDescriptionCounter, 160);

        tagsInput?.addEventListener('keydown', (event) => {
            if (event.key !== 'Tab') {
                return;
            }

            const parts = tagsInput.value.split(',');
            const lastPart = (parts[parts.length - 1] ?? '').trim().toLowerCase();

            if (!lastPart) {
                return;
            }

            const suggestion = existingTags.find((tag) => tag.toLowerCase().startsWith(lastPart));

            if (!suggestion) {
                return;
            }

            event.preventDefault();
            parts[parts.length - 1] = ` ${suggestion}`;
            tagsInput.value = parts
                .map((part, index) => (index === 0 ? part.trimStart() : part))
                .join(',')
                .replace(/^,/, '')
                .trimStart();
        });

        const formatDate = (value) => {
            if (!value) {
                return '';
            }

            const date = new Date(value);

            if (Number.isNaN(date.getTime())) {
                return '';
            }

            return date.toLocaleString('el-GR', {
                year: 'numeric',
                month: '2-digit',
                day: '2-digit',
                hour: '2-digit',
                minute: '2-digit',
            });
        };

        previewButton.addEventListener('click', () => {
            previewTitle.textContent = titleInput.value || 'Χωρίς τίτλο';
            previewDate.textContent = formatDate(dateInput?.value ?? '') || 'Χωρίς ημερομηνία δημοσίευσης';
            previewExcerpt.innerHTML = excerptInput.value || '<p><em>Δεν έχει οριστεί excerpt (θα δημιουργηθεί αυτόματα).</em></p>';
            previewBody.innerHTML = bodyInput.value || '<p><em>Δεν έχει οριστεί περιεχόμενο.</em></p>';

            if (coverInput?.files?.length) {
                const reader = new FileReader();
                reader.onload = (event) => {
                    previewCover.src = event.target?.result ?? '';
                    previewCover.classList.remove('hidden');
                };
                reader.readAsDataURL(coverInput.files[0]);
            } else if (fallbackCover) {
                previewCover.src = fallbackCover;
                previewCover.classList.remove('hidden');
            } else {
                previewCover.src = '';
                previewCover.classList.add('hidden');
            }

            previewBox.classList.remove('hidden');
            previewBox.scrollIntoView({ behavior: 'smooth', block: 'start' });
        });
    })();
</script>
