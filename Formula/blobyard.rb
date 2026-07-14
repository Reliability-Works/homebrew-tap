# typed: strict
# frozen_string_literal: true

# Blobyard native CLI formula. Generated from the signed release manifest.
class Blobyard < Formula
  desc "Secure artifact storage for developers"
  homepage "https://blobyard.com"
  version "0.1.8"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://releases.blobyard.com/v0.1.8/blobyard-0.1.8-aarch64-apple-darwin.tar.gz"
      sha256 "acda178e2b01673e27ea493c98652e292454685facb0df7a09a283de322d334e"
    end
    on_intel do
      url "https://releases.blobyard.com/v0.1.8/blobyard-0.1.8-x86_64-apple-darwin.tar.gz"
      sha256 "58fc23cdfbc1c2c3e1d26cfc1a66102d8ec657769feae5fa03b2020b32d7f886"
    end
  end
  on_linux do
    on_arm do
      url "https://releases.blobyard.com/v0.1.8/blobyard-0.1.8-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "394dd875199a7bd99c0b53a0f64507f828011c0d36ff7b0d51c464cbd7d16d33"
    end
    on_intel do
      url "https://releases.blobyard.com/v0.1.8/blobyard-0.1.8-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fec68c95f091d60737d92e27390ca9a2682f30effae01633a7f579f2aee422ae"
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
