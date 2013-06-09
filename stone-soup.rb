require 'formula'

class StoneSoup < Formula
  homepage 'http://crawl.develz.org/'
  url 'http://sourceforge.net/projects/crawl-ref/files/Stone%20Soup/0.12.2/stone_soup-0.12.2.tar.xz'
  sha1 'e70e7274896f9c78620f91d12bb85010c051766b'

  depends_on 'xz' => :build

  def install
    cd "source" do
      system "make", "prefix=#{prefix}", "DATADIR=data/", "install"
    end
  end
end
