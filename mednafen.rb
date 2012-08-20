require 'formula'

class Mednafen < Formula
  homepage 'http://mednafen.sourceforge.net/'
  url 'http://forum.fobby.net/index.php?t=getfile&id=380'
  sha1 'bc0d867a3fa255f01d04ee6f028acab18849f16d'
  version '0.9.24-WIP'

  # as of xcode 4.4, building with clang still fails
  fails_with :clang do
    build 421
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
