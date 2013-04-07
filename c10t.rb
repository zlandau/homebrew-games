require 'formula'

class C10t < Formula
  homepage 'https://github.com/udoprog/c10t'
  url 'https://github.com/udoprog/c10t/archive/1.7.tar.gz'
  sha1 '1419b0abd42b05c82cde39d02b4ffce1e77265d1'

  depends_on 'cmake' => :build
  depends_on 'boost'

  # Needed to compile against newer boost
  # Can be removed for next version of c10t after 1.7
  # See: https://github.com/udoprog/c10t/pull/153
  def patches
    "https://github.com/udoprog/c10t/commit/4a392b9f06d08c70290f4c7591e84ecdbc73d902.diff"
  end

  def install
    inreplace 'CMakeLists.txt', 'boost_thread', 'boost_thread-mt'
    inreplace 'test/CMakeLists.txt', 'boost_unit_test_framework', 'boost_unit_test_framework-mt'
    system "cmake", ".", *std_cmake_args
    system "make"
    bin.install "c10t"
  end
end
