<x-layouts.campaign
  meta-title="Γιώργος Κέλλης | Αρχική"
  meta-description="Η Ξάνθη αξίζει πράξεις, όχι λόγια. Με σχέδιο, πειθαρχία και αγάπη."
>
  <section class="hero">
    <div class="container hero-grid">
      <div>
        <div class="hero-kicker">Αντιστράτηγος ε.α. - Επίτιμος Υπαρχηγός ΓΕΣ - Πρώην Υποδιοικήτης ΕΥΠ</div>
        <h1>Με σχέδιο,<br/>πειθαρχία και αγάπη</h1>
        <p>Υπηρέτησα την πατρίδα με συνέπεια και καθήκον. Σήμερα συνεχίζω να προσφέρω με ενότητα, ευθύνη και σεβασμό σε κάθε πολίτη.</p>
        <a class="btn" href="{{ route('blog.index') }}" style="padding-inline: 1.75rem;">Άρθρα</a>
      </div>
      <div class="hero-card">
        <img src="{{ asset('images/kellis-hero.png') }}" alt="Γιώργος Κέλλης">
      </div>
    </div>
  </section>

  <section class="section" style="background:var(--bg-soft);">
    <div class="container split">
      <div class="img-wrap"><img src="{{ asset('images/giorgos-kellis-home.png') }}" alt="Γιώργος Κέλλης"></div>
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
        <article class="timeline-item"><span class="n">3</span><h4>Επί το έργο</h4><p>Εμπειρία σε διαχείριση κρίσεων και ανασυγκρότηση, με έμφαση στον Έβρο.</p></article>
      </div>
    </div>
  </section>

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
