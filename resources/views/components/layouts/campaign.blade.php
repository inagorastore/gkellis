<!doctype html>
<html lang="el">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>{{ $metaTitle ?? 'Γιώργος Κέλλης' }}</title>
    <meta name="description" content="{{ $metaDescription ?? 'Η Ξάνθη αξίζει πράξεις, όχι λόγια.' }}" />
    <meta property="og:type" content="article" />
    <meta property="og:title" content="{{ $metaTitle ?? 'Γιώργος Κέλλης' }}" />
    <meta property="og:description" content="{{ $metaDescription ?? 'Η Ξάνθη αξίζει πράξεις, όχι λόγια.' }}" />
    <meta property="og:url" content="{{ url()->current() }}" />
    <meta property="fb:app_id" content="937493685856349" />
    @if (!empty($metaImage))
        <meta property="og:image" content="{{ $metaImage }}" />
    @endif
    @if (filled(config('services.recaptcha.site_key')))
        <script src="https://www.google.com/recaptcha/api.js" async defer></script>
    @endif
    <link rel="icon" type="image/png" href="{{ asset('images/favicon.png') }}">
    <link rel="apple-touch-icon" href="{{ asset('images/favicon.png') }}">
    <style>
        :root{--bg:#0f1738;--bg-soft:#f6f7fb;--text:#1e2442;--muted:#5b638a;--primary:#f6483d;--primary-hover:#e7362a;--white:#fff;--radius:22px;--shadow:0 14px 32px rgba(0,0,0,.08);--max:1200px;}
        *{box-sizing:border-box} body{margin:0;font-family:Inter,system-ui,-apple-system,Segoe UI,Roboto,Arial,sans-serif;color:var(--text);background:#fff;line-height:1.6;}
        a{color:inherit;text-decoration:none} img{max-width:100%;display:block} .container{width:min(var(--max),92%);margin-inline:auto}
        .btn{display:inline-block;background:var(--primary);color:#fff;padding:.9rem 1.35rem;border-radius:12px;font-weight:600;transition:.2s;border:0;cursor:pointer}.btn:hover{background:var(--primary-hover)}
        .section{padding:80px 0}.section-title{font-size:clamp(1.7rem,2.6vw,2.8rem);line-height:1.2;margin:0 0 16px;font-weight:800;letter-spacing:-.02em}.section-subtitle{color:var(--muted);margin:0 0 32px;max-width:780px}
        .topbar{position:sticky;top:0;z-index:10;background:rgba(15,23,56,.92);backdrop-filter:blur(6px);border-bottom:1px solid rgba(255,255,255,.08)} .nav{display:flex;align-items:center;justify-content:space-between;min-height:74px}
        .logo{font-weight:800;color:#fff;font-size:1.05rem} .menu{display:flex;gap:20px;color:#d7ddff;font-weight:500}.menu a:hover{color:#fff}
        .menu-toggle{display:none;align-items:center;justify-content:center;width:42px;height:42px;border:1px solid rgba(255,255,255,.26);border-radius:10px;background:transparent;color:#fff;cursor:pointer}
        .mobile-menu{display:none;flex-direction:column;gap:8px;padding:0 0 14px}
        .mobile-menu a{display:block;color:#d7ddff;font-weight:500;padding:10px 12px;border-radius:10px}
        .mobile-menu a:hover{background:rgba(255,255,255,.08);color:#fff}
        .mobile-menu.is-open{display:flex}
        .hero{background:linear-gradient(120deg,#0d1533 0%,#1d2f72 65%,#324fb3 100%);color:#fff;overflow:hidden}
        .hero-grid{display:grid;grid-template-columns:1.1fr .9fr;align-items:center;gap:36px;min-height:82vh;padding:48px 0}
        .hero-kicker{color:#ff958f;text-transform:uppercase;letter-spacing:.12em;font-size:.78rem;font-weight:700;margin-bottom:12px}
        .hero h1{font-size:clamp(2.1rem,5vw,4.3rem);line-height:1.04;margin:0 0 18px;letter-spacing:-.03em;text-transform:uppercase}
        .hero p{margin:0 0 24px;color:#d2dcff;max-width:650px}.hero-card{background:rgba(255,255,255,.09);border:1px solid rgba(255,255,255,.14);border-radius:26px;padding:18px;box-shadow:var(--shadow)} .hero-card img{border-radius:18px}
        .split{display:grid;grid-template-columns:1fr 1fr;gap:28px;align-items:center}.img-wrap{border-radius:var(--radius);overflow:hidden;box-shadow:var(--shadow)}
        .timeline{display:grid;gap:18px;position:relative}.timeline-item{background:#fff;border:1px solid #edf0fb;border-radius:18px;padding:22px;box-shadow:var(--shadow)}
        .timeline-item .n{display:inline-flex;align-items:center;justify-content:center;width:34px;height:34px;border-radius:999px;background:#324fb3;color:#fff;font-weight:700;font-size:.9rem;margin-bottom:10px}
        .timeline-item h3,.timeline-item h4{margin:0 0 8px;font-size:1.18rem}.timeline-item p{margin:0;color:var(--muted)}
        .cta{background:linear-gradient(135deg,#f5f7ff 0%,#eef3ff 100%);border:1px solid #e4eafb;border-radius:26px;padding:34px;display:grid;gap:18px}
        .form{display:grid;grid-template-columns:repeat(2,minmax(0,1fr));gap:14px}.form .full{grid-column:1/-1}
        input,textarea{width:100%;border:1px solid #d9e1f5;background:#fff;border-radius:12px;font:inherit;padding:12px 14px;outline:none}
        textarea{min-height:130px;resize:vertical} input:focus,textarea:focus{border-color:#8ca3e9}.small{font-size:.88rem;color:var(--muted)}
        .card{background:#fff;border-radius:var(--radius);box-shadow:var(--shadow);padding:30px;border:1px solid #edf0fb}
        .content{color:var(--muted);font-size:1.05rem}.content p{margin:0 0 18px}
        footer{background:#0e1635;color:#d8def8;padding:34px 0;margin-top:70px}.foot{display:flex;justify-content:space-between;gap:18px;flex-wrap:wrap;font-size:.95rem}
        @media (max-width: 980px){.hero-grid,.split{grid-template-columns:1fr}.form{grid-template-columns:1fr}.menu{display:none}.menu-toggle{display:inline-flex}}
    </style>
</head>
<body>
    <header class="topbar">
        <div class="container nav">
            <a class="logo" href="{{ route('pages.home') }}">Γιώργος Κέλλης</a>
            <nav class="menu">
                <a href="{{ route('pages.home') }}">Αρχική</a>
                <a href="{{ route('pages.biography') }}">Βιογραφικό</a>
                <a href="{{ route('blog.index') }}">Άρθρα</a>
                <a href="{{ route('contact.index') }}">Επικοινωνία</a>
            </nav>
            <button class="menu-toggle" type="button" aria-label="Άνοιγμα μενού" aria-expanded="false" aria-controls="mobile-menu">
                <span aria-hidden="true">☰</span>
            </button>
        </div>
        <nav id="mobile-menu" class="container mobile-menu" aria-label="Κύριο μενού κινητού">
            <a href="{{ route('pages.home') }}">Αρχική</a>
            <a href="{{ route('pages.biography') }}">Βιογραφικό</a>
            <a href="{{ route('blog.index') }}">Άρθρα</a>
            <a href="{{ route('contact.index') }}">Επικοινωνία</a>
        </nav>
    </header>

    @if (session('status'))
        <div class="container" style="margin:10px;">
            <div style="border:1px solid #86efac;background:#f0fdf4;color:#166534;padding:12px 14px;border-radius:12px;">
                {{ session('status') }}
            </div>
        </div>
    @endif

    {{ $slot }}

    <footer>
        <div class="container foot">
            <div>Γιώργος Κέλλης</div>
            <div style="display:flex;gap:16px;flex-wrap:wrap;">
                <a href="{{ route('pages.privacy') }}">Privacy Policy</a>
                <a href="{{ route('pages.cookies') }}">Cookies Policy</a>
                <a href="{{ route('seo.sitemap') }}">Sitemap</a>
            </div>
        </div>
    </footer>
    <script>
        const menuToggleButton = document.querySelector('.menu-toggle');
        const mobileMenu = document.getElementById('mobile-menu');

        if (menuToggleButton && mobileMenu) {
            menuToggleButton.addEventListener('click', () => {
                const isExpanded = menuToggleButton.getAttribute('aria-expanded') === 'true';
                menuToggleButton.setAttribute('aria-expanded', String(!isExpanded));
                mobileMenu.classList.toggle('is-open', !isExpanded);
            });
        }
    </script>
</body>
</html>
