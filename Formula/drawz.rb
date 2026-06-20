class Drawz < Formula
  desc "Rendering guarantee layer between AI agents and terminal display"
  homepage "https://github.com/dnatag/drawz"
  version "1.0.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dnatag/drawz/releases/download/v#{version}/drawz-aarch64-apple-darwin.tar.gz"
      sha256 "03e617a096c26e1a95610094ab44a28974a00d0d927071c588d056fdf925eef1"
    else
      url "https://github.com/dnatag/drawz/releases/download/v#{version}/drawz-x86_64-apple-darwin.tar.gz"
      sha256 "608f01c63c689e9503eb88dc3b4015697b7e8c702d2f7e02f47f0aa88895209d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dnatag/drawz/releases/download/v#{version}/drawz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "32ce1439b1cd3c4f8db86018b5965b0bdcb6768252478f37daef53a0a517f558"
    else
      url "https://github.com/dnatag/drawz/releases/download/v#{version}/drawz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8403017c20c35c6b1b189705491bfc0d22e6f89e8552fe6b48958c1e1b14c2b3"
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
