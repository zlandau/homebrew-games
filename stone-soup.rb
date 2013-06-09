require 'formula'

class StoneSoup < Formula
  homepage 'http://crawl.develz.org/'
  url 'http://sourceforge.net/projects/crawl-ref/files/Stone%20Soup/0.12.1/stone_soup-0.12.1.tar.xz'
  sha1 '1c627b970711f9e8639835720fd7b01654777e12'

  depends_on 'xz' => :build

  def install
    cd "source" do
      system "make", "prefix=#{prefix}", "DATADIR=data/", "install"
    end
  end
end
