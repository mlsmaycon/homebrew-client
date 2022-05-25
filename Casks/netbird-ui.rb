


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.5.11"

  if Hardware::CPU.intel?
      url "https://github.com/mlsmaycon/netbird/releases/download/v0.5.11/netbird-ui_0.5.11_darwin_amd64_signed.zip"
      sha256 "527c1259dca218704cdfa940681cb72cb67099fab05d371c27aa760e82d55838"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/mlsmaycon/netbird/releases/download/v0.5.11/netbird-ui_0.5.11_darwin_arm64_signed.zip"
      sha256 "44f8bb8b942dca03a646b57270df65bf61180f77dc8b1906aa0b2d0aff034065"
      app "netbird_ui_darwin_arm64", target: "Netbird UI.app"
  end

  postflight do
    set_permissions "/Applications/netclient", '0755'
  end

  installer script: {
    executable: "#{staged_path}/netbird_ui_darwin_amd64/installer.sh",
    sudo: true,
    must_succeed: false,
  }

  uninstall script: {
    executable: "#{staged_path}/netbird_ui_darwin_amd64/uninstaller.sh",
  }

  name "Netbird UI"
  desc "Netbird UI Client"
  homepage "https://www.netbird.io/"
end