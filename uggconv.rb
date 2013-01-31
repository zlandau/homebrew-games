require 'formula'

class Uggconv < Formula
  url 'http://wyrmcorp.com/software/uggconv/uggconv-1.0.tar.gz'
  homepage 'http://wyrmcorp.com/software/uggconv/index.shtml'
  sha1 '8e6dd530f7f950c5e0fafc26e63287f24b6409d0'

  def install
    system "make"
    bin.install 'uggconv'
    man1.install 'uggconv.1'
  end
end
