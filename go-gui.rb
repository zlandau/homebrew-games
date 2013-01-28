require 'formula'

class GoGui < Formula
  homepage 'http://gogui.sourceforge.net'
  url 'http://downloads.sourceforge.net/project/gogui/gogui/1.4.6/gogui-1.4.6.zip'
  sha1 'a18cb93ee5268ce1f9e79d887538eb7e644ae0c1'

  def install
    inreplace "build.xml", "/Developer/Tools/SetFile", "/usr/bin/SetFile"
    system "ant", "gogui.app", "-Ddoc-uptodate=true"
    prefix.install 'build/GoGui.app'
  end

  def caveats; <<-EOS.undent
    GoGui.app installed to:
      #{prefix}
    Use `brew linkapps` to symlink into ~/Applications.
    EOS
  end
end
