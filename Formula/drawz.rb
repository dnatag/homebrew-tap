class Drawz < Formula
  desc "Rendering guarantee layer between AI agents and terminal display"
  homepage "https://github.com/dnatag/drawz"
  version "1.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dnatag/drawz/releases/download/v#{version}/drawz-aarch64-apple-darwin.tar.gz"
      sha256 "31b8e5709f44eb1e56c48f5f1f177a8375dca8993404d23fce31554877bacbfc"
    else
      url "https://github.com/dnatag/drawz/releases/download/v#{version}/drawz-x86_64-apple-darwin.tar.gz"
      sha256 "51b2de3db239469ca775dd136f3c3759ac85e1f110f0f08229f3a80a82cc218b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dnatag/drawz/releases/download/v#{version}/drawz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d3ccd0f5399812424af94c9822e8454135090167e9b7c332a0422d69f4580188"
    else
      url "https://github.com/dnatag/drawz/releases/download/v#{version}/drawz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c09ba2765c2a3a507926d36e7df496e087e3b57ec80bb027a4b60fae17bf4f1c"
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
