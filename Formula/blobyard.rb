# typed: strict
# frozen_string_literal: true

# Blobyard native CLI formula. Generated from the signed release manifest.
class Blobyard < Formula
  desc "Secure artifact storage for developers"
  homepage "https://blobyard.com"
  version "0.1.7"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://releases.blobyard.com/v0.1.7/blobyard-0.1.7-aarch64-apple-darwin.tar.gz"
      sha256 "8696a347894397d2d8e4eb8dce86a9e44d8131763ce72363415e70c21bbf62d1"
    end
    on_intel do
      url "https://releases.blobyard.com/v0.1.7/blobyard-0.1.7-x86_64-apple-darwin.tar.gz"
      sha256 "81d2e3270f770edc94da33842d0b4a485b4b99d8f36d14948d4c826cb2807f21"
    end
  end
  on_linux do
    on_arm do
      url "https://releases.blobyard.com/v0.1.7/blobyard-0.1.7-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b6f1f15a7e68479578e7e373cac021a7d9685f70be632a6de69ada87ae05ce8e"
    end
    on_intel do
      url "https://releases.blobyard.com/v0.1.7/blobyard-0.1.7-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d76b0de47921d4e0bbf35a49ea87f3140fd13b8ebf540bd95e9ea7e541b67a91"
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
