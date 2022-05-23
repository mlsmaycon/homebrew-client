


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.5.6"

  if Hardware::CPU.intel?
      url "https://github.com/mlsmaycon/netbird/releases/download/v0.5.6/netbird-ui_0.5.6_darwin_amd64_signed.zip"
      sha256 "e6144d063fbfa838f61383179ca2b2692beaeabf5c2874e612fac058dadb6081"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/mlsmaycon/netbird/releases/download/v0.5.6/netbird-ui_0.5.6_darwin_arm64_signed.zip"
      sha256 "2d9f07a5d6f2e6a354977e121d7528af6c5b772d1b9f7509837233bfa58e3374"
      app "netbird_ui_darwin_arm64", target: "Netbird UI.app"
  end

  depends_on formula: "netbird"


  name "Netbird UI"
  desc "Netbird UI Client"
  homepage "https://www.netbird.io/"
end