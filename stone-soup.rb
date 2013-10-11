require 'formula'

class StoneSoup < Formula
  homepage 'http://crawl.develz.org/'
  url 'http://sourceforge.net/projects/crawl-ref/files/Stone%20Soup/0.12.3/stone_soup-0.12.3.tar.xz'
  sha1 'ef8d3d9dec9e4866acee8f04880c6466e1bf5099'

  depends_on 'xz' => :build

  def install
    cd "source" do
      system "make", "prefix=#{prefix}", "DATADIR=data/", "install"
    end
  end
end
