class Lhi < Formula
  desc "Local history for your code — like IntelliJ's Local History, but for any editor"
  homepage "https://github.com/dnatag/lhi"
  version "1.0.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dnatag/lhi/releases/download/v#{version}/lhi-aarch64-apple-darwin.tar.gz"
      sha256 "b142f7ead9f8fd1d4c728255455173ed5c2c71bc7068b9f514542308a0eb5c63"
    else
      url "https://github.com/dnatag/lhi/releases/download/v#{version}/lhi-x86_64-apple-darwin.tar.gz"
      sha256 "84949c0989662f6d01624691d38c8ce49815519edb787831c5cb8ab14a44bca9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dnatag/lhi/releases/download/v#{version}/lhi-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c1fea9cb917a22288aab8d545308162ba5a11ac53df2fbcf9360d81191523e10"
    else
      url "https://github.com/dnatag/lhi/releases/download/v#{version}/lhi-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ab591e1549f3a679f0b58eebd16620dcf2b3e94e61c15a9fe1ed7151561a7892"
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
