


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.5.10"

  if Hardware::CPU.intel?
      url "https://github.com/mlsmaycon/netbird/releases/download/v0.5.10/netbird-ui_0.5.10_darwin_amd64_signed.zip"
      sha256 "8c1d80dce350096364cf0d32dba2ac66251a16972ad31816f706c2fe93e4371b"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/mlsmaycon/netbird/releases/download/v0.5.10/netbird-ui_0.5.10_darwin_arm64_signed.zip"
      sha256 "9ba34e715d2c2bd6ba617ce9657a087de2f11592708ce59d28d909368cae44fd"
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