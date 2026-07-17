# typed: strict
# frozen_string_literal: true

# Blobyard native CLI formula. Generated from the signed release manifest.
class Blobyard < Formula
  desc "Secure artifact storage for developers"
  homepage "https://blobyard.com"
  version "0.1.11"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://releases.blobyard.com/v0.1.11/blobyard-0.1.11-aarch64-apple-darwin.tar.gz"
      sha256 "15994e1b3271591e1d651a3d99bdbb2fb6cb13df9eb3155c6647dacc6b09c4cb"
    end
    on_intel do
      url "https://releases.blobyard.com/v0.1.11/blobyard-0.1.11-x86_64-apple-darwin.tar.gz"
      sha256 "53d561b671e4b90c79f1d44a045bd14c793c2e3787a50fca0b4b2771dbce182a"
    end
  end
  on_linux do
    on_arm do
      url "https://releases.blobyard.com/v0.1.11/blobyard-0.1.11-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5df3122da0739d64a2dba919869d5143e262094d018ce5a7938ed3ff2e075ea6"
    end
    on_intel do
      url "https://releases.blobyard.com/v0.1.11/blobyard-0.1.11-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "eaccd0aca9e1db4c2e6edc23ad446aea1fad7e725ae5861c408152feafe9d660"
    end
  end

  def install
    bin.install "blobyard"
  end

  test do
    system "/usr/bin/codesign", "--verify", "--deep", "--strict", bin/"blobyard" if OS.mac?
    assert_match version.to_s, shell_output("#{bin}/blobyard --version")
  end
end
