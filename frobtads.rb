require 'formula'

class Frobtads < Formula
  homepage 'http://www.tads.org/frobtads.htm'
  url 'http://www.tads.org/frobtads/frobtads-1.2.2.tar.gz'
  sha1 'd3e66d17a36f2084b878cfa752d337ded013211b'
  head 'git://git.assembla.com/frobtads.git'

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end
end
