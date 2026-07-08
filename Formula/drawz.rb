class Drawz < Formula
  desc "Rendering guarantee layer between AI agents and terminal display"
  homepage "https://github.com/dnatag/drawz"
  version "1.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dnatag/drawz/releases/download/v#{version}/drawz-aarch64-apple-darwin.tar.gz"
      sha256 "a0929f685149a35761f731342e35bdd633b838057ec567b4e8d623d41c002793"
    else
      url "https://github.com/dnatag/drawz/releases/download/v#{version}/drawz-x86_64-apple-darwin.tar.gz"
      sha256 "4befee0f59aa199c86f3c57cd6e76a96cc37206c1bdb9f3834e2cfa1eada7f38"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dnatag/drawz/releases/download/v#{version}/drawz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "23df65fd558727ba9b6e610cbd2a5b2c24f9f5a8be1fc84f4a171e35b2eec3cc"
    else
      url "https://github.com/dnatag/drawz/releases/download/v#{version}/drawz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0a3732a0090500eda4db8ba13e98f8df2cc25f061ed6c64b7b8bfe4a4bee37c0"
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
