<x-layouts.campaign meta-title="Επικοινωνία | Γιώργος Κέλλης" meta-description="Επικοινωνήστε με την ομάδα του Γιώργου Κέλλη για προτάσεις, συνεργασίες και δημόσιες παρεμβάσεις.">
    <section class="hero" style="padding:72px 0 56px;">
        <div class="container">
            <div class="hero-kicker">Επικοινωνία</div>
            <h1>Μείνετε σε άμεση επαφή</h1>
            <p>Για θέματα τοπικής αυτοδιοίκησης, δημόσιες προτάσεις, συμμετοχή πολιτών και συνεργασίες.</p>
        </div>
    </section>

    <section class="section">
        <div class="container">
            <div class="cta" style="max-width:860px;margin:0 auto;">
                <div>
                    <h2 class="section-title" style="margin-bottom:8px;">Στείλτε μήνυμα</h2>
                    <p class="section-subtitle" style="margin-bottom:0;">Θα επικοινωνήσουμε μαζί σας το συντομότερο δυνατό.</p>
                </div>
                <form method="POST" action="{{ route('contact.store') }}" class="form">
                    @csrf
                    <div>
                        <label for="name" class="small">Ονοματεπώνυμο</label>
                        <input id="name" name="name" value="{{ old('name') }}" required>
                        @error('name') <p class="small" style="color:#dc2626;margin-top:6px;">{{ $message }}</p> @enderror
                    </div>
                    <div>
                        <label for="email" class="small">Email</label>
                        <input id="email" type="email" name="email" value="{{ old('email') }}" required>
                        @error('email') <p class="small" style="color:#dc2626;margin-top:6px;">{{ $message }}</p> @enderror
                    </div>
                    <div class="full">
                        <label for="subject" class="small">Θέμα</label>
                        <input id="subject" name="subject" value="{{ old('subject') }}" required>
                        @error('subject') <p class="small" style="color:#dc2626;margin-top:6px;">{{ $message }}</p> @enderror
                    </div>
                    <div class="full">
                        <label for="message" class="small">Μήνυμα</label>
                        <textarea id="message" name="message" rows="7" required>{{ old('message') }}</textarea>
                        @error('message') <p class="small" style="color:#dc2626;margin-top:6px;">{{ $message }}</p> @enderror
                    </div>
                    <div class="full">
                        <label for="privacy_policy_accepted" class="small" style="display:flex;align-items:flex-start;gap:10px;">
                            <input id="privacy_policy_accepted"
                                   type="checkbox"
                                   name="privacy_policy_accepted"
                                   value="1"
                                   @checked(old('privacy_policy_accepted'))
                                   style="width:auto;margin-top:2px;">
                            <span>
                                Συμφωνώ με την
                                <a href="{{ route('pages.privacy') }}" style="text-decoration:underline;">πολιτική απορρήτου</a>.
                            </span>
                        </label>
                        @error('privacy_policy_accepted') <p class="small" style="color:#dc2626;margin-top:6px;">{{ $message }}</p> @enderror
                    </div>
                    <div class="full">
                        <button type="submit" class="btn">Αποστολή μηνύματος</button>
                    </div>
                </form>
            </div>
        </div>
    </section>
</x-layouts.campaign>
