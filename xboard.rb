require 'formula'

class Xboard < Formula
  url 'http://ftpmirror.gnu.org/xboard/xboard-4.6.0.tar.gz'
  mirror 'http://ftp.gnu.org/gnu/xboard/xboard-4.6.0.tar.gz'
  homepage 'http://www.gnu.org/software/xboard/'
  sha1 '3adf6112193a656d745859b64918243d619c287c'

  depends_on 'pkg-config' => :build
  depends_on 'gettext'
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
