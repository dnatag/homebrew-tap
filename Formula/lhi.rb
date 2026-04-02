class Lhi < Formula
  desc "Local history for your code — like IntelliJ's Local History, but for any editor"
  homepage "https://github.com/dnatag/lhi"
  version "1.0.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dnatag/lhi/releases/download/v#{version}/lhi-aarch64-apple-darwin.tar.gz"
      sha256 "608fd42e2ffdef2f260de67bf01d1054c977d23bd034aeb0fd82d48d677d8d44"
    else
      url "https://github.com/dnatag/lhi/releases/download/v#{version}/lhi-x86_64-apple-darwin.tar.gz"
      sha256 "076414bba6c28a6dc6978105b03774b8f86661c1661571d7ebc3798fb1a0fa66"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dnatag/lhi/releases/download/v#{version}/lhi-aarch64-unknown-linux-musl.tar.g"
      sha256 "fab677b315922b1e1058ef4ab5716b60ee91c85e586969520da76f79e512fe47"
    else
      url "https://github.com/dnatag/lhi/releases/download/v#{version}/lhi-x86_64-unknown-linux-musl.tar.gzz"
      sha256 "ac03fddad5d5e7e513088cc48dbb34114ef54f4dddc59e33e5b06e7fc773474d"
    end
  end

  def install
    bin.install "lhi"
  end

  test do
    system bin/"lhi", "init"
    assert_path_exists testpath/".lhi"
  end
end
