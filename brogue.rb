require 'formula'

class Brogue < Formula
  homepage 'https://sites.google.com/site/broguegame/'

  # The OS X version doesn't contain a Makefile, so we
  # need to download the Linux version
  url 'https://sites.google.com/site/broguegame/brogue-linux-1.7.3.tar.gz'
  sha1 'acd9d3f107518cbbcd8ad974fa6c261d6439fb8d'

  def install
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

  def test
    system "#{bin}/brogue", "--version"
  end
end
