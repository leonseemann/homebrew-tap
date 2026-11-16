# leonseemann/homebrew-tap

Homebrew casks for [OpenSeries](https://github.com/leonseemann/openseries).

```bash
brew install --cask leonseemann/tap/openseries
```

Apple Silicon, macOS 14.4 or later. The app updates itself (Settings → Updates); `brew upgrade`
is not needed. `brew uninstall openseries` also removes the virtual-mic driver (asks for the
administrator password, audio pauses for about a second); `brew uninstall --zap openseries`
removes the settings as well.

## Updating the cask after a release

```bash
brew bump-cask-pr --version X.Y.Z leonseemann/tap/openseries
```

or by hand: set `version` and `sha256` (`shasum -a 256 OpenSeries-X.Y.Z-macos-arm64.zip`).
