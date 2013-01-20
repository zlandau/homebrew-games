require 'formula'

class Mednafen < Formula
  homepage 'http://mednafen.sourceforge.net/'
  url 'http://forum.fobby.net/index.php?t=getfile&id=450'
  sha1 '6948b0f06d72f8056690d229581e94408d40c918'
  version '0.9.28-WIP'

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
