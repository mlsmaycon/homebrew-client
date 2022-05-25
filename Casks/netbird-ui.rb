


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.5.12"

  if Hardware::CPU.intel?
      url "https://github.com/mlsmaycon/netbird/releases/download/v0.5.12/netbird-ui_0.5.12_darwin_amd64_signed.zip"
      sha256 "31187d7562c1e259c6f41afe5fcf9bb585bcfae1e688e51ef61617e72d833e60"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/mlsmaycon/netbird/releases/download/v0.5.12/netbird-ui_0.5.12_darwin_arm64_signed.zip"
      sha256 "5b92861adbcb6d571c4e43f9b82db1ec022e57afab04dca6702d36c65e98ec52"
      app "netbird_ui_darwin_arm64", target: "Netbird UI.app"
  end

  depends_on formula: "netbird"

  postflight do
    set_permissions "/Applications/Netbird UI.app/installer.sh", '0755'
    set_permissions "/Applications/Netbird UI.app/uninstaller.sh", '0755'
  end

  postflight do
    system_command "#{appdir}/Netbird UI.app/installer.sh",
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