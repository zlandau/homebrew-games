require 'formula'

class Roll < Formula
  homepage 'http://matteocorti.ch/software/roll.html'
  url 'http://matteocorti.ch/software/roll/roll-2.0.1.tar.gz'
  sha1 'a05174453e06bfbf250788c7e78dc44b29d3e6a6'

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end

  test do
    system "#{bin}/roll", "1d6"
  end
end
