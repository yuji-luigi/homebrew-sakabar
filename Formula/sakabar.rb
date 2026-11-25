class Sakabar < Formula
  desc "Follow and drive your Herdr coding agents from a browser or your phone"
  homepage "https://github.com/yuji-luigi/homebrew-sakabar"
  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/yuji-luigi/homebrew-sakabar/releases/download/v0.3.0/sakabar-darwin-arm64.tar.gz"
    sha256 "aa168750343d03b0476a8744d25333873f64e146cb37ef95214458e3f1369d70"
  else
    url "https://github.com/yuji-luigi/homebrew-sakabar/releases/download/v0.3.0/sakabar-darwin-x86_64.tar.gz"
    sha256 "2ffc3c4f224a6d617bd3bf5c95465ea529a7ce56945b915f6502e11d7ed0da35"
  end

  def install
    libexec.install "sakabar", "web"
    bin.install_symlink libexec/"sakabar"
  end

  def caveats
    <<~EOS
      Start the gateway now and at every login (a LaunchAgent on http://127.0.0.1:4199/):
        sakabar service install
      Then pair a browser or your phone:
        sakabar pair

      After brew upgrade sakabar, restart the service so it runs the new version:
        launchctl kickstart -k gui/$(id -u)/dev.sakabar.daemon
      Before brew uninstall sakabar, remove the service:
        sakabar service uninstall
    EOS
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/sakabar --version").strip
  end
end
