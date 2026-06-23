class Drawz < Formula
  desc "Rendering guarantee layer between AI agents and terminal display"
  homepage "https://github.com/dnatag/drawz"
  version "1.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dnatag/drawz/releases/download/v#{version}/drawz-aarch64-apple-darwin.tar.gz"
      sha256 "400f19eb679d8563f7ac790d26e4ff3c064e2dafe239f8ab4111b12d84acb835"
    else
      url "https://github.com/dnatag/drawz/releases/download/v#{version}/drawz-x86_64-apple-darwin.tar.gz"
      sha256 "4fde44501964a1f315478050044615b290f4fad0e6a2e8c9ea46f1060eaf4c73"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dnatag/drawz/releases/download/v#{version}/drawz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3ddacfe186c7fe3c522e9743696eee8e0d265f2621777f8eea126b5e97621747"
    else
      url "https://github.com/dnatag/drawz/releases/download/v#{version}/drawz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bf51ccf1fbbadfb50cda2396af76dd9d8a5882d131c8262bce50437618434340"
    end
  end

  def install
    bin.install "drawz"
  end

  test do
    output = shell_output("echo '{\"type\":\"flow\",\"steps\":[\"A\",\"B\"]}' | #{bin}/drawz")
    assert_match "A", output
  end
end
