<x-layouts.campaign
  meta-title="Γιώργος Κέλλης | Ξάνθη | Επίτιμος Υπαρχηγός ΓΕΣ"
  meta-description="Γνωρίστε τον Γιώργο Κέλλη, Επίτιμο Υπαρχηγό ΓΕΣ, την πορεία προσφοράς του και τις προτάσεις του για την ανάπτυξη της Ξάνθης και της Θράκης."
  og-type="website"
  meta-image="https://gkellis.gr/images/gkellis-social-20260505.jpg?v=20260506a"
  meta-image-width="1200"
  meta-image-height="630"
>
  @php($heroImageVersion = '20260506b')
  <x-slot:head>
    <link rel="canonical" href="https://gkellis.gr/">
    <script type="application/ld+json">
      {
        "@context": "https://schema.org",
        "@graph": [
          {
            "@type": "WebSite",
            "@id": "https://gkellis.gr/#website",
            "url": "https://gkellis.gr/",
            "name": "Γιώργος Κέλλης"
          },
          {
            "@type": "Person",
            "@id": "https://gkellis.gr/#person",
            "name": "Γιώργος Κέλλης",
            "url": "https://gkellis.gr/",
            "image": "https://gkellis.gr/images/gkellis-social-20260505.jpg",
            "jobTitle": "Επίτιμος Υπαρχηγός ΓΕΣ",
            "sameAs": [
              "https://gkellis.gr/",
              "https://gkellis.gr/giorgos-kellis-biography",
              "https://gkellis.gr/contact"
            ]
          }
        ]
      }
    </script>
  </x-slot:head>

  <section class="hero">
    <div class="container hero-grid">
      <div>
        <div class="hero-kicker">Αντιστράτηγος ε.α. - Επίτιμος Υπαρχηγός ΓΕΣ</div>
        <h1>Με σχέδιο,<br/>πειθαρχία και αγάπη</h1>
        <p>Υπηρέτησα την πατρίδα με συνέπεια και καθήκον. Σήμερα συνεχίζω να προσφέρω με ενότητα, ευθύνη και σεβασμό σε κάθε πολίτη.</p>
        <a class="btn" href="{{ route('blog.index') }}" style="padding-inline: 1.75rem;">Άρθρα</a>
      </div>
      <div class="hero-card">
        <picture>
          <source srcset="{{ asset('images/gkellis-hero-20260505.webp') }}?v={{ $heroImageVersion }}" type="image/webp">
          <img src="{{ asset('images/gkellis-hero-20260505.jpg') }}?v={{ $heroImageVersion }}" alt="Γιώργος Κέλλης" width="628" height="900" loading="eager" fetchpriority="high" decoding="async">
        </picture>
      </div>
    </div>
  </section>

  <section class="section" style="background:var(--bg-soft);">
    <div class="container">
      <div>
        <h2 class="section-title">Γιώργος Κέλλης</h2>
        <p class="section-subtitle">Επίτιμος Υπαρχηγός ΓΕΣ</p>
        <p>Υπηρέτησα την πατρίδα με αφοσίωση και πίστη στις αξίες της ευθύνης και του καθήκοντος. Η διαδρομή αυτή με γέμισε εμπειρίες, αλλά κυρίως με ένα βαθύ αίσθημα ευθύνης και υπερηφάνειας για την τιμή να προσφέρω στην Ελλάδα και στους συμπολίτες μου.</p>
        <a class="btn" href="{{ route('pages.biography') }}">Πλήρες βιογραφικό</a>
      </div>
    </div>
  </section>

  <section class="section">
    <div class="container">
      <h2 class="section-title">Εμπειρία ευθύνης, προσφορά με προοπτική</h2>
      <div class="timeline">
        <article class="timeline-item"><span class="n">1</span><h4>Υποδιοικητής στην ΕΥΠ</h4><p>Υπηρέτησα από Φεβρουάριο 2023 έως Σεπτέμβριο 2024 σε νευραλγική θέση ευθύνης.</p></article>
        <article class="timeline-item"><span class="n">2</span><h4>Υπαρχηγός ΓΕΣ</h4><p>Από Μάρτιο 2021 έως Ιανουάριο 2023, με απονομή τίτλου Επίτιμου Υπαρχηγού ΓΕΣ.</p></article>
        <article class="timeline-item"><span class="n">3</span><h4>Επί τω έργω</h4><p>Εμπειρία σε διαχείριση κρίσεων και ανασυγκρότηση, με έμφαση στον Έβρο.</p></article>
      </div>
    </div>
  </section>

  <section class="section" style="background:var(--bg-soft);" aria-labelledby="tv-interviews-title">
    <div class="container">
      <h2 id="tv-interviews-title" class="section-title">TV συνεντεύξεις &amp; παρουσίες</h2>
      <p class="section-subtitle">Επιλεγμένες τηλεοπτικές εμφανίσεις και συνεντεύξεις — ανοίγουν σε νέα καρτέλα (YouTube).</p>
      <div style="display:flex;flex-wrap:wrap;gap:14px;align-items:center;justify-content:space-between;margin-bottom:28px;">
        <p class="small" style="margin:0;max-width:640px;">Δείτε το πλήρες αρχείο μέσων και παρουσιών στον σχετικό κατάλογο.</p>
        <a class="btn" href="{{ route('media.index') }}">Όλο το αρχείο media</a>
      </div>
      <div style="display:flex;justify-content:flex-end;gap:10px;margin-bottom:12px;">
        <button type="button" id="media-scroll-left" aria-label="Προηγούμενα media" style="border:1px solid #cbd5e1;background:#fff;color:#0f172a;padding:8px 12px;border-radius:10px;cursor:pointer;">&#8592;</button>
        <button type="button" id="media-scroll-right" aria-label="Επόμενα media" style="border:1px solid #cbd5e1;background:#fff;color:#0f172a;padding:8px 12px;border-radius:10px;cursor:pointer;">&#8594;</button>
      </div>
      <p id="media-swipe-hint" class="small" style="display:none;margin:0 0 10px;color:var(--muted);">
        Σύρε οριζόντια για να δεις περισσότερα media.
      </p>
      <div id="media-row" style="display:grid;grid-auto-flow:column;grid-auto-columns:minmax(290px, 32%);gap:18px;overflow-x:auto;padding-bottom:8px;scroll-snap-type:x mandatory;scroll-behavior:smooth;">
        @foreach ($tvInterviews as $interview)
          <article class="card" style="display:grid;grid-template-rows:auto 1fr auto;gap:12px;padding:0;overflow:hidden;scroll-snap-align:start;">
            <a href="{{ $interview['url'] }}" target="_blank" rel="noopener noreferrer" style="display:block;line-height:0;background:#0f1738;">
              @if (filled($interview['thumbnail']))
                <img
                  src="{{ $interview['thumbnail'] }}"
                  alt="Προεπισκόπηση βίντεο — {{ \Illuminate\Support\Str::limit($interview['description'], 120) }}"
                  width="480"
                  height="360"
                  loading="lazy"
                  decoding="async"
                  style="width:100%;aspect-ratio:16/9;object-fit:cover;"
                >
              @else
                <div style="aspect-ratio:16/9;background:#1d2f72;display:flex;align-items:center;justify-content:center;color:#d2dcff;font-size:.9rem;padding:12px;text-align:center;">
                  Δείτε το βίντεο
                </div>
              @endif
            </a>
            <div style="padding:0 22px;">
              <p class="small" style="margin:0 0 6px;">
                <time datetime="{{ $interview['occurred_at']->toDateString() }}">{{ $interview['occurred_at']->format('d/m/Y') }}</time>
                <span style="display:inline-block;margin-left:8px;padding:2px 10px;border-radius:999px;background:#eef3ff;color:#324fb3;font-size:.78rem;font-weight:600;">{{ $interview['channel'] }}</span>
              </p>
              <p style="margin:0;font-size:1rem;line-height:1.45;color:var(--text);">{{ $interview['description'] }}</p>
            </div>
            <div style="padding:0 22px 22px;">
              <a class="btn" href="{{ $interview['url'] }}" target="_blank" rel="noopener noreferrer" style="width:100%;text-align:center;display:block;">Δες το απόσπασμα</a>
            </div>
          </article>
        @endforeach
      </div>
    </div>
  </section>

  <script>
    (() => {
      const mediaRow = document.getElementById('media-row');
      const scrollLeftButton = document.getElementById('media-scroll-left');
      const scrollRightButton = document.getElementById('media-scroll-right');
      const swipeHint = document.getElementById('media-swipe-hint');

      if (!mediaRow || !scrollLeftButton || !scrollRightButton) {
        return;
      }

      const syncMobileUi = () => {
        const isMobile = window.matchMedia('(max-width: 980px)').matches;
        if (swipeHint) {
          swipeHint.style.display = isMobile ? 'block' : 'none';
        }
        scrollLeftButton.style.display = isMobile ? 'none' : 'inline-block';
        scrollRightButton.style.display = isMobile ? 'none' : 'inline-block';
      };

      const scrollStep = () => Math.max(320, Math.round(mediaRow.clientWidth * 0.85));
      mediaRow.style.cursor = 'grab';

      let isDragging = false;
      let dragStartX = 0;
      let dragStartScrollLeft = 0;

      mediaRow.addEventListener('mousedown', (event) => {
        isDragging = true;
        dragStartX = event.pageX;
        dragStartScrollLeft = mediaRow.scrollLeft;
        mediaRow.style.cursor = 'grabbing';
      });

      mediaRow.addEventListener('mousemove', (event) => {
        if (!isDragging) {
          return;
        }

        event.preventDefault();
        const delta = event.pageX - dragStartX;
        mediaRow.scrollLeft = dragStartScrollLeft - delta;
      });

      const stopDragging = () => {
        if (!isDragging) {
          return;
        }

        isDragging = false;
        mediaRow.style.cursor = 'grab';
      };

      mediaRow.addEventListener('mouseleave', stopDragging);
      mediaRow.addEventListener('mouseup', stopDragging);

      scrollLeftButton.addEventListener('click', () => {
        mediaRow.scrollBy({ left: -scrollStep(), behavior: 'smooth' });
      });

      scrollRightButton.addEventListener('click', () => {
        mediaRow.scrollBy({ left: scrollStep(), behavior: 'smooth' });
      });

      syncMobileUi();
      window.addEventListener('resize', syncMobileUi);
    })();
  </script>

  @if ($featuredPosts->isNotEmpty())
    <section class="section" style="background:var(--bg-soft);">
      <div class="container">
        <h2 class="section-title">Τελευταία άρθρα</h2>
        <p class="section-subtitle">Ενημέρωση για θέματα τοπικής ανάπτυξης, κοινωνικής συνοχής και δημόσιας ευθύνης.</p>
        <div style="display:grid;grid-template-columns:repeat(auto-fit,minmax(260px,1fr));gap:18px;">
          @foreach ($featuredPosts as $post)
            <article class="card" style="display:grid;gap:10px;">
              <h3 style="margin:0;font-size:1.2rem;line-height:1.35;">
                <a href="{{ route('blog.show', $post) }}" style="text-decoration:underline;">{{ $post->title }}</a>
              </h3>
              @if (filled($post->excerpt))
                <p class="small" style="margin:0;">{{ \Illuminate\Support\Str::limit($post->excerpt, 135) }}</p>
              @endif
              @if ($post->published_at)
                <p class="small" style="margin:0;">
                  Δημοσίευση:
                  <time datetime="{{ $post->published_at->toDateString() }}">{{ $post->published_at->format('d/m/Y') }}</time>
                </p>
              @endif
            </article>
          @endforeach
        </div>
      </div>
    </section>
  @endif

  <section class="section" id="support">
    <div class="container">
      <div class="cta">
        <div>
          <h2 class="section-title" style="margin-bottom:8px;">Στείλτε μήνυμα</h2>
          <p class="section-subtitle" style="margin:0;">Θα επικοινωνήσουμε μαζί σας το συντομότερο δυνατό.</p>
        </div>
        <form class="form" method="POST" action="{{ route('contact.store') }}">
          @csrf
          <div>
            <label for="home-contact-name" class="small">Ονοματεπώνυμο</label>
            <input id="home-contact-name" type="text" name="name" value="{{ old('name') }}" required>
            @error('name') <p class="small" style="color:#dc2626;margin-top:6px;">{{ $message }}</p> @enderror
          </div>
          <div>
            <label for="home-contact-email" class="small">Email</label>
            <input id="home-contact-email" type="email" name="email" value="{{ old('email') }}" required>
            @error('email') <p class="small" style="color:#dc2626;margin-top:6px;">{{ $message }}</p> @enderror
          </div>
          <div class="full">
            <label for="home-contact-subject" class="small">Θέμα</label>
            <input id="home-contact-subject" type="text" name="subject" value="{{ old('subject') }}" required>
            @error('subject') <p class="small" style="color:#dc2626;margin-top:6px;">{{ $message }}</p> @enderror
          </div>
          <div class="full">
            <label for="home-contact-message" class="small">Μήνυμα</label>
            <textarea id="home-contact-message" class="full" name="message" rows="7" required>{{ old('message') }}</textarea>
            @error('message') <p class="small" style="color:#dc2626;margin-top:6px;">{{ $message }}</p> @enderror
          </div>
          <div class="full">
            <label for="home-contact-privacy" class="small" style="display:flex;align-items:flex-start;gap:10px;">
              <input id="home-contact-privacy" type="checkbox" name="privacy_policy_accepted" value="1" @checked(old('privacy_policy_accepted')) style="width:auto;margin-top:2px;" required>
              <span>
                Συμφωνώ με την
                <a href="{{ route('pages.privacy') }}" style="text-decoration:underline;">πολιτική απορρήτου</a>.
              </span>
            </label>
            @error('privacy_policy_accepted') <p class="small" style="color:#dc2626;margin-top:6px;">{{ $message }}</p> @enderror
          </div>
          @if (filled(config('services.recaptcha.site_key')))
            <div class="full">
              <div class="g-recaptcha" data-sitekey="{{ config('services.recaptcha.site_key') }}"></div>
              @error('g-recaptcha-response') <p class="small" style="color:#dc2626;margin-top:6px;">{{ $message }}</p> @enderror
            </div>
          @endif
          <div class="full"><button class="btn" type="submit">Αποστολή</button></div>
        </form>
      </div>
    </div>
  </section>
</x-layouts.campaign>
