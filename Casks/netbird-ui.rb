


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.5.3"

  if Hardware::CPU.intel?
      url "https://github.com/mlsmaycon/netbird/releases/download/v0.5.3/netbird-ui_0.5.3_darwin_amd64_signed.zip"
      sha256 "79b26f905af408f68f88103ae0b3c7b98b950d1f5cfc2fe063b2d47207fead13"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/mlsmaycon/netbird/releases/download/v0.5.3/netbird-ui_0.5.3_darwin_arm64_signed.zip"
      sha256 "bece47d478463cfd9b5042158879d8fc561247937804191ddc52516ae183eb1c"
      app "netbird_ui_darwin_arm64", target: "Netbird UI.app"
  end

  name "Netbird UI"
  desc "Netbird UI Client"
  homepage "https://www.netbird.io/"
end