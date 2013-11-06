require 'formula'

class StoneSoup < Formula
  homepage 'http://crawl.develz.org/'
  url 'http://sourceforge.net/projects/crawl-ref/files/Stone%20Soup/0.12.3/stone_soup-0.12.3.tar.xz'
  sha1 'ef8d3d9dec9e4866acee8f04880c6466e1bf5099'

  depends_on 'xz' => :build

  def install
    # Numerous template issues building under libc++
    ENV.libstdcxx

    cd "source" do
      # The makefile has trouble locating the developer tools for
      # CLT-only systems, so we set these manually. Reported upstream:
      # https://crawl.develz.org/mantis/view.php?id=7625
      #
      # On 10.9, stone-soup will try to use xcrun and fail due to an empty
      # DEVELOPER_DIR
      devdir = MacOS::Xcode.prefix.to_s
      devdir += '/' if MacOS.version >= :mavericks && !MacOS::Xcode.installed?

      system "make", "install", "prefix=#{prefix}", "DATADIR=data/",
        "DEVELOPER_DIR=#{devdir}", "SDKROOT=#{MacOS.sdk_path}",
        "SDK_VER=#{MacOS.version}"
    end
  end
end
