require 'formula'

class Xboard < Formula
  url 'http://ftpmirror.gnu.org/xboard/xboard-4.7.1.tar.gz'
  mirror 'http://ftp.gnu.org/gnu/xboard/xboard-4.7.1.tar.gz'
  homepage 'http://www.gnu.org/software/xboard/'
  sha1 '0f23e01561fedb1c05a72734f37fd3fce5a7c5aa'

  depends_on 'pkg-config' => :build
  depends_on 'fairymax' => :recommended
  depends_on 'gettext'
  depends_on 'cairo'
  depends_on 'librsvg'
  depends_on :x11

  def install
    args = ["--prefix=#{prefix}",
            "--x-include=#{MacOS::X11.include}",
            "--x-lib=#{MacOS::X11.lib}",
            "--disable-zippy"]

    system "./configure", *args
    system "make"
    system "make install"
  end
end
