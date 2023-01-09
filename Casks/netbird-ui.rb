


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.11.6"

  if Hardware::CPU.intel?
      url "https://github.com/mlsmaycon/homebrew-client/releases/download/v0.11.6/netbird-ui_0.11.6_darwin_amd64_signed.zip"
      sha256 "d8ba026a645d49bd8ad8dde80601ec370224cc03b86407b01d4cdb8957afe486"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/mlsmaycon/homebrew-client/releases/download/v0.11.6/netbird-ui_0.11.6_darwin_arm64_signed.zip"
      sha256 "f591e22ba8dc0044cbca40e4af21c30a6fba6e939794fc17b79e8886fee90da9"
      app "netbird_ui_darwin_arm64", target: "Netbird UI.app"
  end

  #depends_on formula: "netbird"

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