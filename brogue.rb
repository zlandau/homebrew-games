require 'formula'

class Brogue < Formula
  homepage 'https://sites.google.com/site/broguegame/'

  # The OS X version doesn't contain a Makefile, so we
  # need to download the Linux version
  url 'https://sites.google.com/site/broguegame/brogue-linux-1.7.2.tar.gz'
  sha1 '31bde0c5922cca803d4ce4b7fa916247ad444401'

  def install
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

  def test
    system "#{bin}/brogue", "--version"
  end
end
