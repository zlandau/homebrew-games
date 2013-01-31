require 'formula'

class DwarfFortress < Formula
  homepage 'http://www.bay12games.com/dwarves/'
  url 'http://www.bay12games.com/dwarves/df_34_11_osx.tar.bz2'
  version '0.34.11'
  sha1 'ea6d69f8241d4e06b1454ae3757186af69d00fe4'

  def install
    (bin+'dwarffortress').write <<-EOS.undent
      #!/bin/sh
      exec #{libexec}/df
    EOS
    rm_rf 'sdl' # only contains a readme
    libexec.install Dir['*']
  end
end
