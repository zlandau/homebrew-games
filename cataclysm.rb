require 'formula'

class Cataclysm < Formula
  homepage 'http://www.cataclysmdda.com/'
  url 'https://github.com/TheDarklingWolf/Cataclysm-DDA/archive/0.5.zip'
  sha1 '91250b0855cc59e1f4f93e59871a1a12bdfa1024'

  def install
    system "make", "NATIVE=osx", "CXX=#{ENV.cxx}", "LD=#{ENV.cxx}",
      "CXXFLAGS=#{ENV.cxxflags}"

    # no make install, so we have to do it ourselves
    libexec.install "cataclysm", "data"
    inreplace "cataclysm-launcher" do |s|
      s.change_make_var! 'DIR', libexec
    end
    bin.install "cataclysm-launcher" => "cataclysm"
  end
end
