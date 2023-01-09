


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.11.12"

  if Hardware::CPU.intel?
      url "https://github.com/mlsmaycon/homebrew-client/releases/download/v0.11.12/netbird-ui_0.11.12_darwin_amd64_signed.zip"
      sha256 "d38142ffb087683af187009c7bb1838c555a188835378111a68095cad3397c8a"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/mlsmaycon/homebrew-client/releases/download/v0.11.12/netbird-ui_0.11.12_darwin_arm64_signed.zip"
      sha256 "1535c7110bd1b9ca4119a28f98357824965b6202d0ea0c7196bee126a0c686d7"
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