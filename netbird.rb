# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Netbird < Formula
  desc "Netbird project."
  homepage "https://netbird.io/"
  version "0.5.13"
  license "BSD3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mlsmaycon/netbird/releases/download/v0.5.13/netbird_0.5.13_darwin_arm64.tar.gz", :using => CurlDownloadStrategy
      sha256 "eec6a06965c9eea366859af348d50cdfb38ea58eb2bf3a4df9aef6b5ff2d7878"

      def install
        bin.install "netbird"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/mlsmaycon/netbird/releases/download/v0.5.13/netbird_0.5.13_darwin_amd64.tar.gz", :using => CurlDownloadStrategy
      sha256 "bb8bcd6404f82d3491aaeed3dcb5686c1284aa3df35ae46194646886bd09386c"

      def install
        bin.install "netbird"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://github.com/mlsmaycon/netbird/releases/download/v0.5.13/netbird_0.5.13_linux_armv6.tar.gz", :using => CurlDownloadStrategy
      sha256 "8f7664f9053430fed007f4f5ca949a9ca3248237ca418055611e5df04545452f"

      def install
        bin.install "netbird"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/mlsmaycon/netbird/releases/download/v0.5.13/netbird_0.5.13_linux_amd64.tar.gz", :using => CurlDownloadStrategy
      sha256 "12b1e6b839e889be59faf1b84c0dc2dfb457888d9ce5076b56aae0da2907d7f1"

      def install
        bin.install "netbird"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/mlsmaycon/netbird/releases/download/v0.5.13/netbird_0.5.13_linux_arm64.tar.gz", :using => CurlDownloadStrategy
      sha256 "2b036203c0315961ced185f1d4801b35a09df6df8d507ed1c27048f395bcd883"

      def install
        bin.install "netbird"
      end
    end
  end

  conflicts_with "wiretrustee"

  test do
    system "#{bin}/netbird version"
  end
end
