class Lhi < Formula
  desc "Local history for your code — like IntelliJ's Local History, but for any editor"
  homepage "https://github.com/dnatag/lhi"
  version "1.0.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dnatag/lhi/releases/download/v#{version}/lhi-aarch64-apple-darwin.tar.gz"
      sha256 "1a93a93c5339667e420beb0112e1b249b216710197f314a87e28f573e8e5db9c"
    else
      url "https://github.com/dnatag/lhi/releases/download/v#{version}/lhi-x86_64-apple-darwin.tar.gz"
      sha256 "8781fae456d88dca3c403e0bef84f86048604dbd245188e5c523ffb202aaefca"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dnatag/lhi/releases/download/v#{version}/lhi-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "beec9779eded2807406827eccff9971bde6de33c71fc04fdfe231a96b49d2e99"
    else
      url "https://github.com/dnatag/lhi/releases/download/v#{version}/lhi-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1921b7d35df569ea34befcda5daf9c81ec61d47bab60a0de23caf5c2119275c7"
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
