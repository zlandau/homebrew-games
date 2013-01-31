require 'formula'

class Scummvm < Formula
  url 'http://downloads.sourceforge.net/project/scummvm/scummvm/1.4.1/scummvm-1.4.1.tar.bz2'
  homepage 'http://www.scummvm.org/'
  sha1 'f43d1fce764d6e49a9e1d4c069507346212d9b36'

  depends_on 'sdl'
  depends_on :libpng
  depends_on 'flac' => :recommended
  depends_on 'libvorbis' => :recommended
  depends_on 'libogg' => :recommended
  depends_on 'fluid-synth' => :optional

  def install
    system "./configure", "--prefix=#{prefix}", "--disable-debug"
    system "make"
    system "make install"
    (share+'pixmaps').rmtree
  end
end
