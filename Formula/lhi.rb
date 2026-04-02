class Lhi < Formula
  desc "Local history for your code — like IntelliJ's Local History, but for any editor"
  homepage "https://github.com/dnatag/lhi"
  version "1.0.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dnatag/lhi/releases/download/v#{version}/lhi-aarch64-apple-darwin.tar.gz"
      sha256 "93a90f58bf8e60efa54eebb5e48e975ad28e5f33822876cf4b4a7026d27a903c"
    else
      url "https://github.com/dnatag/lhi/releases/download/v#{version}/lhi-x86_64-apple-darwin.tar.gz"
      sha256 "0786ee893f7e66eae32913af85ed9c4b7301c7871b0b43e81f903b9e84cc5a5e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dnatag/lhi/releases/download/v#{version}/lhi-aarch64-unknown-linux-musl.tar.gz"
      sha256 "c6eea16521b6fa57f7a0a4494508c2131e42280d6c88857f839a365dc640298b"
    else
      url "https://github.com/dnatag/lhi/releases/download/v#{version}/lhi-x86_64-unknown-linux-musl.tar.gz"
      sha256 "3753180e4cff22e06155c5346cae86b2164d29eb94866e46a62f7d72a359499d"
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
