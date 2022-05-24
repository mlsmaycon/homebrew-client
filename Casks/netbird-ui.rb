


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.5.10"

  if Hardware::CPU.intel?
      url "https://github.com/mlsmaycon/netbird/releases/download/v0.5.10/netbird-ui_0.5.10_darwin_amd64_signed.zip"
      sha256 "2bfe32746d155cd8fa1a058bd5ecaad4a327860bfd6a57f1bcd55207650f15b7"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/mlsmaycon/netbird/releases/download/v0.5.10/netbird-ui_0.5.10_darwin_arm64_signed.zip"
      sha256 "a2567d7d41119eca239cf95fb9e8e18504ab7543886a2bc74f4bc2c5c3cdafdb"
      app "netbird_ui_darwin_arm64", target: "Netbird UI.app"
  end

  depends_on formula: "netbird"

  installer script: {
    executable: "installer.sh",
    sudo: true,
    must_succeed: false,
  }

  uninstall script: {
    executable: "uninstaller.sh",
    args: ["service","stop"],
  }

  name "Netbird UI"
  desc "Netbird UI Client"
  homepage "https://www.netbird.io/"
end