class Sakabar < Formula
  desc "Follow and drive your Herdr coding agents from a browser or your phone"
  homepage "https://github.com/yuji-luigi/homebrew-sakabar"
  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/yuji-luigi/homebrew-sakabar/releases/download/v0.3.1/sakabar-darwin-arm64.tar.gz"
    sha256 "24f8fb55a46e5f0c4f96c8d2d12076a71a0b202615398b0a89eedc66c7034f0b"
  else
    url "https://github.com/yuji-luigi/homebrew-sakabar/releases/download/v0.3.1/sakabar-darwin-x86_64.tar.gz"
    sha256 "b00a7766bcdd69db57e9b34a7fceb84ad5e4a20fb14d316ad827b2456ab78ab3"
  end

  def install
    libexec.install "sakabar"
    bin.install_symlink libexec/"sakabar"
  end

  def caveats
    <<~EOS
      Start the gateway now and at every login (a LaunchAgent on http://127.0.0.1:4112/):
        sakabar up
      Then pair a browser or your phone:
        sakabar pair

      After brew upgrade sakabar, run sakabar up again so the service runs the new version.
      Before brew uninstall sakabar, remove the service:
        sakabar down

      Coming from 0.3.0 (the earlier gateway, service dev.sakabar.daemon on port 4199)? Remove its service first:
        launchctl bootout gui/$(id -u)/dev.sakabar.daemon; rm -f ~/Library/LaunchAgents/dev.sakabar.daemon.plist
      Its data in ~/.sakabar-gateway isn't carried over: pair your devices again with sakabar pair.
    EOS
  end

  test do
    assert_match "sakabar gateway #{version}, web #{version} (binary", shell_output("#{bin}/sakabar --version")
  end
end
