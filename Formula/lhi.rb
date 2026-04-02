class Lhi < Formula
  desc "Local history for your code — like IntelliJ's Local History, but for any editor"
  homepage "https://github.com/dnatag/lhi"
  version "1.0.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dnatag/lhi/releases/download/v#{version}/lhi-aarch64-apple-darwin.tar.gz"
      sha256 "2a8c4dace6142302b0300059daae324024b51a7deed26f983036ebfc10ab8669"
    else
      url "https://github.com/dnatag/lhi/releases/download/v#{version}/lhi-x86_64-apple-darwin.tar.gz"
      sha256 "bd7c1cef965b25b97732dd4ee96f6c16620874cd9dcc3fa36831d696bc28f5c6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dnatag/lhi/releases/download/v#{version}/lhi-aarch64-unknown-linux-musl.tar.gz"
      sha256 "5de290d659fa50d085e1d6de32543fa66f1c5396048bb8d73e4d4136111246d3"
    else
      url "https://github.com/dnatag/lhi/releases/download/v#{version}/lhi-x86_64-unknown-linux-musl.tar.gz"
      sha256 "d5cbb082d9ddcdb410a6d4caec6a9ddd0f2802da290cb7df8c66329adf80203a"
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
