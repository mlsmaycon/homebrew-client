


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.11.6"

  if Hardware::CPU.intel?
      url "https://github.com/mlsmaycon/homebrew-client/releases/download/v0.11.6/netbird-ui_0.11.6_darwin_amd64_signed.zip"
      sha256 "48d7dca3534ec6369a82899867253332bb1749c7532d98e1936e0eb9cef88766"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/mlsmaycon/homebrew-client/releases/download/v0.11.6/netbird-ui_0.11.6_darwin_arm64_signed.zip"
      sha256 "486d57826d9eaa0b81b748c2d6a4a575a83c89b91867a012077d5c7d436bbdd3"
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