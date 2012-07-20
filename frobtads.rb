require 'formula'

class Frobtads < Formula
  homepage 'http://www.tads.org/frobtads.htm'
  url 'http://www.tads.org/frobtads/frobtads-1.2.tar.gz'
  sha1 '986e3a886ec6f2df73c298f51f9ed36153a68c2f'
  head 'git://git.assembla.com/frobtads.git'

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end
end
