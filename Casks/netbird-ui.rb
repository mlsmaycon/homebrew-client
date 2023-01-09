


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.11.6"

  if Hardware::CPU.intel?
      url "https://github.com/mlsmaycon/homebrew-client/releases/download/v0.11.6/netbird-ui_0.11.6_darwin_amd64_signed.zip"
      sha256 "8d4f0690f819405a221798bab76a2fceabfed9c8a99250f140c9021cd80dd271"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/mlsmaycon/homebrew-client/releases/download/v0.11.6/netbird-ui_0.11.6_darwin_arm64_signed.zip"
      sha256 "616c477e7dd764eb614c9d4e42a58d2c39e5bc967ce01964319a3c982bdd7d88"
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