require 'formula'

class Libtcod < Formula
  homepage 'http://doryen.eptalys.net/libtcod/'
  url 'https://bitbucket.org/jice/libtcod/get/1.5.1.tar.bz2'
  sha1 '4bf117f2d29b0ad851552c84e8745dcf3ae0af2a'

  depends_on 'cmake' => :build
  depends_on 'sdl'

  def install
    system "cmake", ".", *std_cmake_args
    system "make"

    # cmake produces an install target, but it installs nothing
    lib.install 'src/libtcod.dylib'
    lib.install 'src/libtcod-gui.dylib'
    include.install Dir['include/*']
    # don't yet know what this is for
    libexec.install 'data'
  end
end
