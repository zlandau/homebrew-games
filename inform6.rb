require 'formula'

class Inform6 < Formula
  homepage 'http://www.inform-fiction.org/inform6.html'
  url 'http://ifarchive.flavorplex.com/if-archive/infocom/compilers/inform6/source/inform-6.32.1.tar.gz'
  sha1 '251cf057ddbf750a286802d2cfbccf5e80e25295'

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end
end
