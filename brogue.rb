require 'formula'

class Brogue < Formula
  homepage 'https://sites.google.com/site/broguegame/'

  # The OS X version doesn't contain a Makefile, so we
  # need to download the Linux version
  url 'https://sites.google.com/site/broguegame/brogue-linux-1.7.3.tar.gz'
  sha1 'acd9d3f107518cbbcd8ad974fa6c261d6439fb8d'

  def patches
    # put the highscores file in HOMEBREW_PREFIX/var/brogue/ instead of a
    # version-dependent location.
    DATA
  end

  def install
    mkdir_p "#{var}/brogue"

    cd 'brogue-1.7.3' do
      doc.install 'Readme.rtf' => 'README.rtf'
      doc.install 'agpl.txt' => 'COPYING'

      system "make", "clean"
      system "make", "curses"

      # The files are installed in libexec
      # and the provided `brogue` shell script,
      # which is just a convenient way to launch the game,
      # is placed in the `bin` directory.
      inreplace 'brogue', /`dirname \$0`\/bin$/, libexec
      bin.install 'brogue'
      libexec.install 'bin/brogue'
      libexec.install 'bin/keymap'
    end
  end

  def caveats; <<-EOS.undent
    If you are upgrading from 1.7.2, you need to copy your highscores file:
        cp #{HOMEBREW_PREFIX}/Cellar/#{name}/1.7.2/BrogueHighScores.txt #{var}/brogue/
    EOS
  end

  def test
    system "#{bin}/brogue", "--version"
  end
end
__END__
--- a/brogue-1.7.3/src/platform/platformdependent.c	2013-10-08 21:53:15.000000000 +0200
+++ b/brogue-1.7.3/src/platform/platformdependent.c	2013-10-08 21:55:22.000000000 +0200
@@ -75,7 +75,7 @@
 	short i;
 	FILE *scoresFile;
 	
-	scoresFile = fopen("BrogueHighScores.txt", "w");
+	scoresFile = fopen("HOMEBREW_PREFIX/var/brogue/BrogueHighScores.txt", "w");
 	for (i=0; i<HIGH_SCORES_COUNT; i++) {
 		fprintf(scoresFile, "%li\t%li\t%s", (long) 0, (long) 0, "(empty entry)\n");
 	}
@@ -128,11 +128,11 @@
 	time_t rawtime;
 	struct tm * timeinfo;
 	
-	scoresFile = fopen("BrogueHighScores.txt", "r");
+	scoresFile = fopen("HOMEBREW_PREFIX/var/brogue/BrogueHighScores.txt", "r");
 	
 	if (scoresFile == NULL) {
 		initScores();
-		scoresFile = fopen("BrogueHighScores.txt", "r");
+		scoresFile = fopen("HOMEBREW_PREFIX/var/brogue/BrogueHighScores.txt", "r");
 	}
 	
 	for (i=0; i<HIGH_SCORES_COUNT; i++) {
@@ -197,7 +197,7 @@
 	short i;
 	FILE *scoresFile;
 	
-	scoresFile = fopen("BrogueHighScores.txt", "w");
+	scoresFile = fopen("HOMEBREW_PREFIX/var/brogue/BrogueHighScores.txt", "w");
 	
 	for (i=0; i<HIGH_SCORES_COUNT; i++) {
 		// save the entry

