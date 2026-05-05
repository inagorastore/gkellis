<x-layouts.campaign
  meta-title="Γιώργος Κέλλης | Ξάνθη | Επίτιμος Υπαρχηγός ΓΕΣ"
  meta-description="Γνωρίστε τον Γιώργο Κέλλη, Επίτιμο Υπαρχηγό ΓΕΣ, την πορεία προσφοράς του και τις προτάσεις του για την ανάπτυξη της Ξάνθης και της Θράκης."
  og-type="website"
  meta-image="https://gkellis.gr/images/gkellis-social-20260505.jpg?v=20260505b"
  meta-image-width="1200"
  meta-image-height="630"
>
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
          <source srcset="{{ asset('images/gkellis-hero-20260505.webp') }}" type="image/webp">
          <img src="{{ asset('images/gkellis-hero-20260505.jpg') }}" alt="Γιώργος Κέλλης" width="638" height="900" loading="eager" fetchpriority="high" decoding="async">
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
