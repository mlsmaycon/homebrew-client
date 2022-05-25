


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.5.10"

  if Hardware::CPU.intel?
      url "https://github.com/mlsmaycon/netbird/releases/download/v0.5.10/netbird-ui_0.5.10_darwin_amd64_signed.zip"
      sha256 "e3dc29dd120b0cb5a2b05dab25f0b7e28cac0b96a22a578e1c3c2511c497e548"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/mlsmaycon/netbird/releases/download/v0.5.10/netbird-ui_0.5.10_darwin_arm64_signed.zip"
      sha256 "ebc319255069c30dfd89b7d2fde10ddfabc34d9c488d2366744c00f7f0963b1c"
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