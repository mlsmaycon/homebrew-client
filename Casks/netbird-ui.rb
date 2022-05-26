


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.5.13"

  if Hardware::CPU.intel?
      url "https://github.com/mlsmaycon/netbird/releases/download/v0.5.13/netbird-ui_0.5.13_darwin_amd64_signed.zip"
      sha256 "cab38a7089cf894ef7c1116569400c597c55c49855fc3c4af459d747fe1d3fb1"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/mlsmaycon/netbird/releases/download/v0.5.13/netbird-ui_0.5.13_darwin_arm64_signed.zip"
      sha256 "99ecdee0f0d939e69c087f66904888539c02d919f48005d0dec77604cd54ed15"
      app "netbird_ui_darwin_arm64", target: "Netbird UI.app"
  end

  depends_on formula: "netbird"

  postflight do
    set_permissions "/Applications/Netbird UI.app/installer.sh", '0755'
    set_permissions "/Applications/Netbird UI.app/uninstaller.sh", '0755'
  end

  postflight do
    system_command "#{appdir}/Netbird UI.app/installer.sh",
                   args: ["#{version}"],
                   sudo: true
  end

  uninstall_preflight do
    system_command "#{appdir}/Netbird UI.app/uninstaller.sh",
                   sudo: false
  end

  name "Netbird UI"
  desc "Netbird UI Client"
  homepage "https://www.netbird.io/"
end