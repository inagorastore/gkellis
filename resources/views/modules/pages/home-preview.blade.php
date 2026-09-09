<x-layouts.campaign
  meta-title="Γιώργος Κέλλης | Παρεμβάσεις για Ξάνθη και Θράκη"
  meta-description="Ο Γιώργος Κέλλης, Επίτιμος Υπαρχηγός ΓΕΣ: παρεμβάσεις για υποδομές, ανάπτυξη και τη Θράκη — με παρουσία στον τόπο και συγκεκριμένες προτάσεις."
  og-type="website"
  meta-image="https://gkellis.gr/images/gkellis-social-20260505.jpg?v=20260901a"
  meta-image-width="1200"
  meta-image-height="630"
>
  @php($heroImageVersion = '20260901a')
  <x-slot:head>
    <meta name="robots" content="noindex, nofollow">
    <link rel="canonical" href="{{ url('/preview') }}">
    <style>
      .hero-actions{display:flex;flex-wrap:wrap;gap:12px;align-items:center}
      .btn-secondary{display:inline-block;background:transparent;color:#fff;padding:.9rem 1.35rem;border-radius:12px;font-weight:600;border:1px solid rgba(255,255,255,.45);transition:.2s}
      .btn-secondary:hover{background:rgba(255,255,255,.1);border-color:#fff}
      .pillars{display:grid;grid-template-columns:repeat(3,minmax(0,1fr));gap:18px}
      .pillar-card{background:#fff;border:1px solid #edf0fb;border-radius:var(--radius);box-shadow:var(--shadow);padding:28px;display:grid;gap:12px}
      .pillar-card h3{margin:0;font-size:1.25rem}
      .pillar-card p{margin:0;color:var(--muted)}
      .pillar-card a{font-weight:600;color:var(--primary)}
      @media (max-width:980px){
        .pillars{grid-template-columns:1fr}
        .hero-actions .btn,.hero-actions .btn-secondary{width:100%;text-align:center}
      }
    </style>
  </x-slot:head>
  <x-slot:scripts>
    <script src="{{ asset('js/home-scrollers.js') }}" defer></script>
  </x-slot:scripts>

  <section class="hero">
    <div class="container hero-grid">
      <div>
        <div class="hero-kicker">Επίτιμος Υπαρχηγός ΓΕΣ · Ξάνθη · Θράκη</div>
        <h1>Παρουσία στον τόπο.<br/>Έργο με συνέχεια.</h1>
        <p>Παρεμβαίνω εκεί που υπάρχουν πραγματικά ζητήματα — υποδομές, ανάπτυξη, Θράκη — με δεδομένα, αυτοψία και συνέχεια.</p>
        <div class="hero-actions">
          <a class="btn" href="{{ route('blog.index') }}" style="padding-inline: 1.75rem;">Οι παρεμβάσεις μου</a>
          <a class="btn-secondary" href="#sthema">Στείλε ένα θέμα</a>
        </div>
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
      <h2 class="section-title">Με τι ασχολείται</h2>
      <p class="section-subtitle">Τρία πεδία με συγκεκριμένο έργο — όχι γενικές δηλώσεις.</p>
      <div class="pillars">
        <article class="pillar-card">
          <h3>Υποδομές</h3>
          <p>Έργα που αλλάζουν την καθημερινότητα: οδοποιία, σύνορα, αντιπλημμυρικά, κρίσιμες εγκαταστάσεις.</p>
          <a href="{{ route('blog.index') }}">Δείτε σχετικά →</a>
        </article>
        <article class="pillar-card">
          <h3>Ανάπτυξη</h3>
          <p>Οικονομία, πρωτογενής τομέας, επενδύσεις και προοπτική για την τοπική κοινωνία.</p>
          <a href="{{ route('blog.index') }}">Δείτε σχετικά →</a>
        </article>
        <article class="pillar-card">
          <h3>Θράκη</h3>
          <p>Ξάνθη, Έβρος, Ροδόπη, Σαμοθράκη — με έμφαση στην ανασυγκρότηση και τη συνοχή.</p>
          <a href="{{ route('blog.index') }}">Δείτε σχετικά →</a>
        </article>
      </div>
    </div>
  </section>

  @if ($featuredPosts->isNotEmpty())
    <section class="section">
      <div class="container">
        <h2 class="section-title">Πρόσφατες παρεμβάσεις</h2>
        <p class="section-subtitle">Από την αυτοψία και την καταγραφή, μέχρι την επόμενη κίνηση — με συγκεκριμένα στοιχεία.</p>
        <div style="display:flex;flex-wrap:wrap;gap:14px;align-items:center;justify-content:space-between;margin-bottom:20px;">
          <p class="small" style="margin:0;max-width:640px;">Επιλεγμένες πρόσφατες παρεμβάσεις από το αρχείο.</p>
          <a class="btn" href="{{ route('blog.index') }}">Όλες οι παρεμβάσεις</a>
        </div>
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

  <section class="section" style="background:var(--bg-soft);">
    <div class="container">
      <h2 class="section-title">Γιώργος Κέλλης</h2>
      <p class="section-subtitle">Επίτιμος Υπαρχηγός ΓΕΣ</p>
      <p style="max-width:780px;color:var(--muted);">
        Υπηρέτησα την πατρίδα με συνέπεια και καθήκον. Η εμπειρία σε θέσεις ευθύνης — από τις Ένοπλες Δυνάμεις έως τη δημόσια διοίκηση — με οδήγησε να συνεχίσω με παρουσία στον τόπο: να βλέπω από κοντά, να παρεμβαίνω και να ενημερώνω με στοιχεία.
      </p>
      <div class="timeline" style="margin-top:28px;">
        <article class="timeline-item">
          <span class="n">1</span>
          <h4>Υποδιοικητής στην ΕΥΠ</h4>
          <p>Φεβρουάριος 2023 έως Σεπτέμβριος 2024, σε θέση υψηλής ευθύνης.</p>
        </article>
        <article class="timeline-item">
          <span class="n">2</span>
          <h4>Υπαρχηγός ΓΕΣ</h4>
          <p>Μάρτιος 2021 έως Ιανουάριος 2023· τίτλος Επίτιμου Υπαρχηγού ΓΕΣ.</p>
        </article>
        <article class="timeline-item">
          <span class="n">3</span>
          <h4>Επί τω έργω</h4>
          <p>Διαχείριση κρίσεων και ανασυγκρότηση, με έμφαση στον Έβρο και τη Θράκη.</p>
        </article>
      </div>
      <div style="margin-top:28px;">
        <a class="btn" href="{{ route('pages.biography') }}">Πλήρες βιογραφικό</a>
      </div>
    </div>
  </section>

  <section class="section" aria-labelledby="tv-interviews-title">
    <div class="container">
      <h2 id="tv-interviews-title" class="section-title">Παρουσίες στα μέσα</h2>
      <p class="section-subtitle">Επιλεγμένες συνεντεύξεις και τηλεοπτικές εμφανίσεις.</p>
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
          <x-tv-interview-card :interview="$interview" :snap="true" />
        @endforeach
      </div>
    </div>
  </section>

  <section class="section" id="sthema" style="background:var(--bg-soft);">
    <div class="container">
      <div class="cta">
        <div>
          <h2 class="section-title" style="margin-bottom:8px;">Έχεις ένα θέμα στην περιοχή σου;</h2>
          <p class="section-subtitle" style="margin:0;">Γράψε μας τι συμβαίνει. Καταγράφουμε τα ζητήματα και απαντάμε όπου μπορούμε. Μπορείτε να αναφέρετε την περιοχή μέσα στο μήνυμα.</p>
        </div>
        <form class="form" method="POST" action="{{ route('contact.store') }}">
          @csrf
          <div>
            <label for="preview-contact-name" class="small">Ονοματεπώνυμο</label>
            <input id="preview-contact-name" type="text" name="name" value="{{ old('name') }}" required>
            @error('name') <p class="small" style="color:#dc2626;margin-top:6px;">{{ $message }}</p> @enderror
          </div>
          <div>
            <label for="preview-contact-email" class="small">Email</label>
            <input id="preview-contact-email" type="email" name="email" value="{{ old('email') }}" required>
            @error('email') <p class="small" style="color:#dc2626;margin-top:6px;">{{ $message }}</p> @enderror
          </div>
          <div class="full">
            <label for="preview-contact-subject" class="small">Θέμα</label>
            <input id="preview-contact-subject" type="text" name="subject" value="{{ old('subject') }}" required>
            @error('subject') <p class="small" style="color:#dc2626;margin-top:6px;">{{ $message }}</p> @enderror
          </div>
          <div class="full">
            <label for="preview-contact-message" class="small">Περιγραφή</label>
            <textarea id="preview-contact-message" class="full" name="message" rows="7" required placeholder="Περιγράψτε το ζήτημα και την περιοχή σας…">{{ old('message') }}</textarea>
            @error('message') <p class="small" style="color:#dc2626;margin-top:6px;">{{ $message }}</p> @enderror
          </div>
          <div class="full">
            <label for="preview-contact-privacy" class="small" style="display:flex;align-items:flex-start;gap:10px;">
              <input id="preview-contact-privacy" type="checkbox" name="privacy_policy_accepted" value="1" @checked(old('privacy_policy_accepted')) style="width:auto;margin-top:2px;" required>
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
          <div class="full"><button class="btn" type="submit">Αποστολή θέματος</button></div>
        </form>
      </div>
    </div>
  </section>
</x-layouts.campaign>
