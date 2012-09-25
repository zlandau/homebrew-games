require 'formula'

class Opengfx < Formula
  url 'http://bundles.openttdcoop.org/opengfx/releases/0.4.4/opengfx-0.4.4.zip'
  sha1 'c68cdbb1ee8980a44feff320288e466d06efcd19'
end

class Opensfx < Formula
  url 'http://bundles.openttdcoop.org/opensfx/releases/0.2.3/opensfx-0.2.3.zip'
  sha1 'bfbfeddb91ff32a58a68488382636f38125c48f4'
end

class Openmsx < Formula
  url 'http://bundles.openttdcoop.org/openmsx/releases/0.3.1/openmsx-0.3.1.zip'
  sha1 'e9c4203923bb9c974ac67886bd00b7090658b961'
end

class Openttd < Formula
  homepage 'http://www.openttd.org/'
  url 'http://binaries.openttd.org/releases/1.2.2/openttd-1.2.2-source.tar.gz'
  sha1 '216e404489faa4f8ccc026a2c2b5f695494e7d4a'

  head 'git://git.openttd.org/openttd/trunk.git'

  depends_on 'lzo'
  depends_on 'xz'
  depends_on 'pkg-config' => :build

  def install
    system "./configure", "--prefix-dir=#{prefix}"
    system "make bundle"

    Opengfx.new.brew { (buildpath/'bundle/OpenTTD.app/Contents/Resources/data/opengfx').install Dir['*'] }
    Opensfx.new.brew { (buildpath/'bundle/OpenTTD.app/Contents/Resources/data/opensfx').install Dir['*'] }
    Openmsx.new.brew { (buildpath/'bundle/OpenTTD.app/Contents/Resources/gm/openmsx').install Dir['*'] }

    prefix.install 'bundle/OpenTTD.app'
  end

  def caveats; <<-EOS.undent
      OpenTTD.app installed to: #{prefix}
      If you have access to the sound and graphics files from the original
      Transport Tycoon Deluxe, you can install them by following the
      instructions in section 4.1 of #{prefix}/README
    EOS
  end
end
