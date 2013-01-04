require 'formula'

class Mupen64plus < Formula
  url 'http://mupen64plus.googlecode.com/files/mupen64plus-bundle-src-1.99.5.tar.gz'
  homepage 'http://code.google.com/p/mupen64plus/'
  sha1 'ca80ae446c9591e272e3ec93f0a2a8b01cfcd34e'

  option 'disable-osd', 'Disables the On Screen Display'
  option 'enable-new-dynarec', 'Replace dynamic recompiler with Ari64\'s experimental dynarec'
  option 'with-src', 'Build with libsamplerate'
  option 'with-speex', 'Build with libspeexdsp'

  depends_on 'pkg-config' => :build
  depends_on :libpng
  depends_on 'sdl'
  depends_on :freetype unless build.include? 'disable-osd'
  depends_on 'libsamplerate' if build.include? 'with-src'
  depends_on 'speex' if build.include? 'with-speex'

  def patches
    [
      # Current versions of mupen64plus do not compile on OSX with Xcode 4.3+
      # due to Xcode 4.3 storing the SDKs in a different location.
      # Already merged in the source tree, and will be fixed in the next version.
      "https://gist.github.com/raw/4445512/0123c67cc020aba34aa5f2b256c848123f83549e/mupen64plus-1.99.5-osx-makefiles-patch.diff",
      # Fixes improper inclusion of SDL and OpenGL.
      # Already merged in the source tree, and will be fixed in the next version.
      "https://gist.github.com/raw/4445589/e084b3465a66d58b974df3fd47e760521dd2bcad/mupen64plus-1.99.5-osx-uiconsole-sdlfix.diff",
      # Fixup for the mupen64plus-core Makefile to use the system zlib
      # For more see: http://code.google.com/p/mupen64plus/issues/detail?id=540
      "https://gist.github.com/raw/4581659/8cab69edda633dac4a1e9fe520f7203c0b65ede1/mupen64plus-1.99.5-osx-zlib-fix.diff"
    ]
  end

  def install
    commonArgs = ["install", "PREFIX=#{prefix}", "INSTALL_STRIP_FLAG=-S"]

    cd "source/mupen64plus-core/projects/unix" do
      args = commonArgs.dup
      args << "OSD=0" if build.include? 'disable-osd'
      args << "NEW_DYNAREC=1" if build.include? 'enable-new-dynarec'
      system "make", *args
    end

    cd "source/mupen64plus-audio-sdl/projects/unix" do
      args = commonArgs.dup
      args << "NO_SRC=1" unless build.include? 'with-src'
      args << "NO_SPEEX=1" unless build.include? 'with-speex'
      system "make", *args
    end

    cd "source/mupen64plus-input-sdl/projects/unix" do
      system "make", *commonArgs
    end

    cd "source/mupen64plus-rsp-hle/projects/unix" do
      system "make", *commonArgs
    end

    cd "source/mupen64plus-video-rice/projects/unix" do
      system "make", *commonArgs
    end

    cd "source/mupen64plus-ui-console/projects/unix" do
      system "make", *commonArgs
    end
  end
end
