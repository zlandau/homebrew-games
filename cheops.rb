require 'formula'

class Cheops < Formula
  homepage 'http://en.nothingisreal.com/wiki/CHEOPS'
  url 'http://files.nothingisreal.com/software/cheops/cheops-1.1.tar.bz2'
  sha1 'c2d2fd271134ca12cacf31ccd95aa5bce4c279b8'

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--mandir=#{man}"
    system "make install"
  end
end
