


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.5.10"

  if Hardware::CPU.intel?
      url "https://github.com/mlsmaycon/netbird/releases/download/v0.5.10/netbird-ui_0.5.10_darwin_amd64_signed.zip"
      sha256 "d1873227101675b4b98dfacbfc1c05e60dafbba77333e8787c365bc544ee890e"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/mlsmaycon/netbird/releases/download/v0.5.10/netbird-ui_0.5.10_darwin_arm64_signed.zip"
      sha256 "81789a72d4b976c27ad1de0286e023939c57277f941a9cea4e4255fb1a683288"
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