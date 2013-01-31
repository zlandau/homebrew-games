require 'formula'

class Pioneers < Formula
  url 'https://downloads.sourceforge.net/project/pio/Source/pioneers-0.12.5.tar.gz'
  homepage 'http://pio.sourceforge.net/'
  sha1 'bade508cb2f1a59ea1d0bcdd9cd7a93e77f4b95c'

  fails_with :clang do
    build 318
    cause "'#line directive requires a positive integer' argument in generated file"
  end

  depends_on 'intltool' # for NLS
  depends_on 'gettext'
  depends_on 'gtk+'
  depends_on 'librsvg' # svg images for gdk-pixbuf

  def install
    # fix usage of echo options not supported by sh
    inreplace "Makefile.in", /\becho/, "/bin/echo"
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end
end
