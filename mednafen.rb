require 'formula'

class Mednafen < Formula
  homepage 'http://mednafen.sourceforge.net/'
  url 'http://forum.fobby.net/index.php?t=getfile&id=380'
  sha1 'bc0d867a3fa255f01d04ee6f028acab18849f16d'
  version '0.9.24-WIP'

  fails_with :clang do
    build 421
    cause <<-EOS.undent
    The SNES module fails to build with clang; in addition, the mednafen
    binary segfaults when a game launches if compiled without SNES support.
    EOS
  end

  depends_on 'pkg-config' => :build
  depends_on 'sdl'
  depends_on 'libcdio'
  depends_on 'libsndfile'

  def install
    system "./configure", "--prefix=#{prefix}", "--disable-dependency-tracking"
    system "make install"
  end
end
