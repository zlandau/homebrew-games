require 'formula'

class Ski < Formula
  url 'http://catb.org/~esr/ski/ski-6.5.tar.gz'
  homepage 'http://catb.org/~esr/ski/'
  sha1 'd6cc1a86b841884c5b19dffbed1f472970c7468c'

  def install
    bin.install "ski"
    man6.install "ski.6"
  end
end
