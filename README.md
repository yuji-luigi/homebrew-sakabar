# homebrew-sakabar

The [Homebrew](https://brew.sh) tap for the Sakabar gateway: it runs on your Mac next to Herdr and lets you follow and
drive your coding agents from a browser or the Sakabar Sessions app on your phone.

```sh
brew install yuji-luigi/sakabar/sakabar
sakabar service install   # start it now and at every login, on http://127.0.0.1:4199/
sakabar pair              # pair a browser or your phone
```

After `brew upgrade sakabar`, restart the service so it runs the new version:

```sh
launchctl kickstart -k gui/$(id -u)/dev.sakabar.daemon
```

Before `brew uninstall sakabar`, run `sakabar service uninstall`. Your data stays in `~/.sakabar-gateway`.

`Formula/sakabar.rb` installs the release tarballs of
[yuji-luigi/sakabar_gateway](https://github.com/yuji-luigi/sakabar_gateway) (checked against their SHA-256). It's
generated: the gateway's `scripts/release.sh` renders it from each release's `SHA256SUMS` and pushes it here, so
change `scripts/homebrew-formula.sh` there, not this file. Setup, Tailscale and pairing:
[docs/install.md](https://github.com/yuji-luigi/sakabar_gateway/blob/main/docs/install.md).
