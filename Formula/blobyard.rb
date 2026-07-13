# typed: strict
# frozen_string_literal: true

# Blobyard native CLI formula. Generated from the signed release manifest.
class Blobyard < Formula
  desc "Secure artifact storage for developers"
  homepage "https://blobyard.com"
  version "0.1.6"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://releases.blobyard.com/v0.1.6/blobyard-0.1.6-aarch64-apple-darwin.tar.gz"
      sha256 "c104f16abbb9146adc3a9a396b4ab2c04d27c7e35a0912d660617dbcd7a9a084"
    end
    on_intel do
      url "https://releases.blobyard.com/v0.1.6/blobyard-0.1.6-x86_64-apple-darwin.tar.gz"
      sha256 "3fb1a2e500146032770409b6085ec71077fdf79403a86a87562d3cb3ae35dcab"
    end
  end
  on_linux do
    on_arm do
      url "https://releases.blobyard.com/v0.1.6/blobyard-0.1.6-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4ba71637ef867088de5014e3445df066547ea9b1ab833cf4b87a8df178a8f9b3"
    end
    on_intel do
      url "https://releases.blobyard.com/v0.1.6/blobyard-0.1.6-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f316cb12d4043c451035484236d365967c659180b4059fe6cf5a6bae3b07116a"
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
