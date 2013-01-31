require 'formula'

class Angband < Formula
  url 'http://rephial.org/downloads/3.0/angband-3.0.9b-src.tar.gz'
  sha1 '28debdaf1f840ed15dc76e375da64517320a9c17'
  homepage 'http://rephial.org/'

  def install
    system "./configure", "--prefix=#{prefix}",
                          "--enable-curses",
                          "--disable-x11",
                          "--disable-sdl",
                          "--disable-sdl-mixer",
                          "--with-libpath=#{libexec}"
    system "make"
    # Install manually; 'make install' doesn't work.
    bin.install "src/angband"
    libexec.install Dir['lib/*']
  end
end
