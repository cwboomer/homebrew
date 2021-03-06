class Fizsh < Formula
  homepage "https://github.com/zsh-users/fizsh"

  stable do
    url "https://downloads.sourceforge.net/project/fizsh/fizsh-1.0.8.tar.gz"
    sha1 "515f8828c8bd9f2da1e2716bb3d60727e2f26e90"
  end

  head "https://github.com/zsh-users/fizsh", :using => :git

  bottle do
    cellar :any
    sha1 "31962775bf8fde4d57fa03bb2a9c1c7ae2449afb" => :yosemite
    sha1 "e95ca1c85aae0e07d8fe99f631a3eb00ae6bc708" => :mavericks
    sha1 "b1ce95c0da21159a36c8153064fcb82ed708c8f7" => :mountain_lion
  end

  depends_on "zsh"

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    assert_equal "hello", shell_output("#{bin}/fizsh -c \"echo hello\"").strip
  end
end
