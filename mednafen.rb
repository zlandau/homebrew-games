require 'formula'

class Mednafen < Formula
  homepage 'http://mednafen.sourceforge.net/'
  url 'http://forum.fobby.net/index.php?t=getfile&id=405'
  sha1 'f5e7b029cdae6a9d9f02a0f719e9f33e4ec96348'
  version '0.9.25-WIP'

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
