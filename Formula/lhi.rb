class Lhi < Formula
  desc "Local history for your code — like IntelliJ's Local History, but for any editor"
  homepage "https://github.com/dnatag/lhi"
  version "1.0.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dnatag/lhi/releases/download/v#{version}/lhi-aarch64-apple-darwin.tar.gz"
      sha256 "012b364303d569ae8693501a6a728959291a0bbd3fa4128e0e8b8ca9d58f0708"
    else
      url "https://github.com/dnatag/lhi/releases/download/v#{version}/lhi-x86_64-apple-darwin.tar.gz"
      sha256 "c1026d5e41b6fdaab5a048f44cb493e95ac33a8d0665050aecdbe411c26d7054"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dnatag/lhi/releases/download/v#{version}/lhi-aarch64-unknown-linux-musl.tar.g"
      sha256 "e23e04ab4d2f9a2b488132377f44135c38180b2288cf349b21169b25c7f02dc8"
    else
      url "https://github.com/dnatag/lhi/releases/download/v#{version}/lhi-x86_64-unknown-linux-musl.tar.gzz"
      sha256 "381089e383b149d4215cd3ca9c99b5ad8cb2a027aad6c609db6cef6fec9c6dae"
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
