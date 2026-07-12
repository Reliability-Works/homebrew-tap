# typed: strict
# frozen_string_literal: true

# Blobyard native CLI formula. Generated from the signed release manifest.
class Blobyard < Formula
  desc "Secure artifact storage for developers"
  homepage "https://blobyard.com"
  version "0.1.4"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://releases.blobyard.com/v0.1.4/blobyard-0.1.4-aarch64-apple-darwin.tar.gz"
      sha256 "8b1353fc3d1afd527c967351012ba8c0363d7471c79e995db67f230b2553dc28"
    end
    on_intel do
      url "https://releases.blobyard.com/v0.1.4/blobyard-0.1.4-x86_64-apple-darwin.tar.gz"
      sha256 "01db59f95eb65672ec16039255b59c87680802b9599a1355e845bd5a1629f35a"
    end
  end
  on_linux do
    on_arm do
      url "https://releases.blobyard.com/v0.1.4/blobyard-0.1.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e3c3d0aecbf488af7708e39b20cdfbc08427985883bcdea8087e755e4226ac7e"
    end
    on_intel do
      url "https://releases.blobyard.com/v0.1.4/blobyard-0.1.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "efd9d4accc8d41ece4d97998f5fd0f80c1dbd7bf07b8ab9d329fda17af31fe2d"
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
