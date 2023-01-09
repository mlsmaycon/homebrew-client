


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.11.15"

  if Hardware::CPU.intel?
      url "https://github.com/mlsmaycon/homebrew-client/releases/download/v0.11.15/netbird-ui_0.11.15_darwin_amd64_signed.zip"
      sha256 "cda1d2c6a20383fa2f9aa5fd230a3d240c266ebfb3904c99b7c265ec76c568fb"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/mlsmaycon/homebrew-client/releases/download/v0.11.15/netbird-ui_0.11.15_darwin_arm64_signed.zip"
      sha256 "fcf7a5aa26f449ca17cb14d5404e0e2928fe642911030de165a938a8e6fbccfe"
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