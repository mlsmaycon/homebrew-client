# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Netbird < Formula
  desc "Netbird project."
  homepage "https://netbird.io/"
  version "0.5.10"
  license "BSD3"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/mlsmaycon/netbird/releases/download/v0.5.10/netbird_0.5.10_darwin_amd64.tar.gz", :using => CurlDownloadStrategy
      sha256 "1e9e48c214b333b7cebfea997aea8da603c1369011cb8f9b1801843a026b7e3b"

      def install
        bin.install "netbird"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/mlsmaycon/netbird/releases/download/v0.5.10/netbird_0.5.10_darwin_arm64.tar.gz", :using => CurlDownloadStrategy
      sha256 "e185555b75cf94273ff5fcbdba9bb2906539c4f1a48fca6bcfbc27ea196283bf"

      def install
        bin.install "netbird"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://github.com/mlsmaycon/netbird/releases/download/v0.5.10/netbird_0.5.10_linux_armv6.tar.gz", :using => CurlDownloadStrategy
      sha256 "950babae4f85e6acaa6c758d5a468f20291741e9d31deadbd9edc2ea5b1ade99"

      def install
        bin.install "netbird"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/mlsmaycon/netbird/releases/download/v0.5.10/netbird_0.5.10_linux_amd64.tar.gz", :using => CurlDownloadStrategy
      sha256 "3aa21951ddaf59940c9a9fc1db427133122d94a376ef0b7d824d029e4c4e3108"

      def install
        bin.install "netbird"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/mlsmaycon/netbird/releases/download/v0.5.10/netbird_0.5.10_linux_arm64.tar.gz", :using => CurlDownloadStrategy
      sha256 "4ccfacce0fca356866e077a9b23ea643c0d267ce3d3e74e0fc416b81a6bfab5a"

      def install
        bin.install "netbird"
      end
    end
  end

  test do
    system "#{bin}/netbird -h"
  end
end
