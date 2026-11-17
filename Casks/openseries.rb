cask "openseries" do
  version "0.4.0"
  sha256 "1fc4b1278e4dbfd42131a0e29de4a865350ac4c216c7ad66689dd52727c63887"

  url "https://github.com/leonseemann/openseries/releases/download/v#{version}/OpenSeries-#{version}-macos-arm64.zip"
  name "OpenSeries"
  desc "Open-source SteelSeries GG alternative with Sonar-style AudioMix"
  homepage "https://github.com/leonseemann/openseries"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "OpenSeries.app"

  uninstall launchctl: "dev.openseries.app",
            quit:      "dev.openseries.app",
            delete:    "/Library/Audio/Plug-Ins/HAL/OpenSeriesMic.driver",
            script:    {
              executable: "/usr/bin/killall",
              args:       ["coreaudiod"],
              sudo:       true,
            }

  zap trash: [
    "~/Library/Application Support/OpenSeries",
    "~/Library/LaunchAgents/dev.openseries.app.plist",
  ]
end
