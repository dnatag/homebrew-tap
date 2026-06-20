class Drawz < Formula
  desc "Rendering guarantee layer between AI agents and terminal display"
  homepage "https://github.com/dnatag/drawz"
  version "1.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dnatag/drawz/releases/download/v#{version}/drawz-aarch64-apple-darwin.tar.gz"
      sha256 "PLACEHOLDER"
    else
      url "https://github.com/dnatag/drawz/releases/download/v#{version}/drawz-x86_64-apple-darwin.tar.gz"
      sha256 "PLACEHOLDER"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dnatag/drawz/releases/download/v#{version}/drawz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "PLACEHOLDER"
    else
      url "https://github.com/dnatag/drawz/releases/download/v#{version}/drawz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "PLACEHOLDER"
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
