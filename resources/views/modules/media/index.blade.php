<x-layouts.campaign
  meta-title="Media Archive | Γιώργος Κέλλης"
  meta-description="Αρχείο τηλεοπτικών εμφανίσεων και συνεντεύξεων του Γιώργου Κέλλη."
>
  <x-slot:head>
    <link rel="canonical" href="https://gkellis.gr/media-archive">
  </x-slot:head>

  <section class="hero" style="padding:72px 0 56px;">
    <div class="container">
      <div class="hero-kicker">Media Archive</div>
      <h1>TV συνεντεύξεις &amp; παρουσίες</h1>
      <p>Όλες οι τηλεοπτικές εμφανίσεις σε ένα σημείο, με χρονολογική σειρά.</p>
    </div>
  </section>

  <section class="section">
    <div class="container">
      <h2 class="section-title">Όλο το αρχείο media</h2>
      <p class="section-subtitle">Επιλέξτε ένα απόσπασμα για να ανοίξει στο YouTube σε νέα καρτέλα.</p>

      <div style="display:grid;grid-template-columns:repeat(auto-fit,minmax(280px,1fr));gap:18px;">
        @foreach ($tvInterviews as $interview)
          <x-tv-interview-card :interview="$interview" />
        @endforeach
      </div>
    </div>
  </section>
</x-layouts.campaign>
