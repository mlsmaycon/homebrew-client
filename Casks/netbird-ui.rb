


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.5.4"

  if Hardware::CPU.intel?
      url "https://github.com/mlsmaycon/netbird/releases/download/v0.5.4/netbird-ui_0.5.4_darwin_amd64_signed.zip"
      sha256 "ed69045874db44fb16506df360c9cdbac28b58926b301630ee088a16e2f4d578"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/mlsmaycon/netbird/releases/download/v0.5.4/netbird-ui_0.5.4_darwin_arm64_signed.zip"
      sha256 "26035d2070381a637a6c2accfd2e15263df04987e46c07eb3049e6209a196f1f"
      app "netbird_ui_darwin_arm64", target: "Netbird UI.app"
  end

  depends_on formula: "netbird"


  name "Netbird UI"
  desc "Netbird UI Client"
  homepage "https://www.netbird.io/"
end