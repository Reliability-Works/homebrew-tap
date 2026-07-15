# typed: strict
# frozen_string_literal: true

# Blobyard native CLI formula. Generated from the signed release manifest.
class Blobyard < Formula
  desc "Secure artifact storage for developers"
  homepage "https://blobyard.com"
  version "0.1.10"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://releases.blobyard.com/v0.1.10/blobyard-0.1.10-aarch64-apple-darwin.tar.gz"
      sha256 "720a937ea3cfb845adba0c1456ae50b82e3ebd522642fc06f054721f8834b3b5"
    end
    on_intel do
      url "https://releases.blobyard.com/v0.1.10/blobyard-0.1.10-x86_64-apple-darwin.tar.gz"
      sha256 "5501b3ad92e97444c3de97d8960dd80b2da98e587e51298f6cf5a1bfb449055d"
    end
  end
  on_linux do
    on_arm do
      url "https://releases.blobyard.com/v0.1.10/blobyard-0.1.10-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a4a7a8909737fedaf224bc42c27562bc786e1823842cc8236af3c138dd1627ad"
    end
    on_intel do
      url "https://releases.blobyard.com/v0.1.10/blobyard-0.1.10-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7f0cdccff9ef2297e509cf60b7ef131586e8143ad15be02f6ce9fd9a7eed0241"
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
