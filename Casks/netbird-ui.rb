


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.6.1"

  if Hardware::CPU.intel?
      url "https://github.com/mlsmaycon/homebrew-client/releases/download/v0.6.1/netbird-ui_0.6.1_darwin_amd64_signed.zip"
      sha256 "f61c2aef0f800d0362ee592ac74b4e7ec591de5097e4584ec8748968a8f59cad"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/mlsmaycon/homebrew-client/releases/download/v0.6.1/netbird-ui_0.6.1_darwin_arm64_signed.zip"
      sha256 "0d927c99081fa74e378e84746d47bf24f0bf96f18784acef2720ffc1f5f16acf"
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