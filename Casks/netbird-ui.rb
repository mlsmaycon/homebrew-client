


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.11.14"

  if Hardware::CPU.intel?
      url "https://github.com/mlsmaycon/homebrew-client/releases/download/v0.11.14/netbird-ui_0.11.14_darwin_amd64_signed.zip"
      sha256 "cba42b9f6778bd93c06f282ef663e2e6fed9a035f32e49833adaeca00ea51010"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/mlsmaycon/homebrew-client/releases/download/v0.11.14/netbird-ui_0.11.14_darwin_arm64_signed.zip"
      sha256 "06a81da26b6b49db5295cb303033f92d0dd22e633fd66799288b25af3929078f"
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