class Lhi < Formula
  desc "Local history for your code — like IntelliJ's Local History, but for any editor"
  homepage "https://github.com/dnatag/lhi"
  version "1.0.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dnatag/lhi/releases/download/v#{version}/lhi-aarch64-apple-darwin.tar.gz"
      sha256 "170f388cca52a9024fdc166cc39082aa4268ad366ccf82f8ad08a02e0ef1acc5"
    else
      url "https://github.com/dnatag/lhi/releases/download/v#{version}/lhi-x86_64-apple-darwin.tar.gz"
      sha256 "4221eb273097b4801cbc7415e7a18032686ba35917f2e52218f4105aa7c62472"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dnatag/lhi/releases/download/v#{version}/lhi-aarch64-unknown-linux-musl.tar.gz"
      sha256 "5585cc29dfbd61dbd64473f333e69260969f70d669caf483df4f9d6ef3bbe2c2"
    else
      url "https://github.com/dnatag/lhi/releases/download/v#{version}/lhi-x86_64-unknown-linux-musl.tar.gz"
      sha256 "71e6be83baaf3ed0d96b968b1e837ec7adb5d0b3ac78cd8b379632028f75ab7f"
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
