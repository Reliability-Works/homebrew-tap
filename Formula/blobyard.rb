# typed: strict
# frozen_string_literal: true

# Blobyard native CLI formula. Generated from the signed release manifest.
class Blobyard < Formula
  desc "Secure artifact storage for developers"
  homepage "https://blobyard.com"
  version "0.1.9"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://releases.blobyard.com/v0.1.9/blobyard-0.1.9-aarch64-apple-darwin.tar.gz"
      sha256 "1b3ef32a7bfa2754a770942541aa53cb7b14331238bdcfe777f3ab72d8e31702"
    end
    on_intel do
      url "https://releases.blobyard.com/v0.1.9/blobyard-0.1.9-x86_64-apple-darwin.tar.gz"
      sha256 "1f624c40349abf0cbfa96d7c7ba0cff2c61d7253f12f45d3ccc121707b129491"
    end
  end
  on_linux do
    on_arm do
      url "https://releases.blobyard.com/v0.1.9/blobyard-0.1.9-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9896e15cb7c048b09f8848df435c2d9761d7e691308961be18a1214ff0b2e4e6"
    end
    on_intel do
      url "https://releases.blobyard.com/v0.1.9/blobyard-0.1.9-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f8668617cbe21856218c5c37aa01d4b8e0578cb4857565df3ec95c0c6bf125ec"
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
