


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.11.15"

  if Hardware::CPU.intel?
      url "https://github.com/mlsmaycon/homebrew-client/releases/download/v0.11.15/netbird-ui_0.11.15_darwin_amd64_signed.zip"
      sha256 "36e8b8664495512a829e8d5b6e8005c175f93639131a3f77b45a829fd90406b3"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/mlsmaycon/homebrew-client/releases/download/v0.11.15/netbird-ui_0.11.15_darwin_arm64_signed.zip"
      sha256 "f999e04f99f5b66123d824c5b4468e6dab9c7d17c865ef33dabf3a710fa3587f"
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