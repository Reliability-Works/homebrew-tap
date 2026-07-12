# typed: strict
# frozen_string_literal: true

# Blobyard native CLI formula. Generated from the signed release manifest.
class Blobyard < Formula
  desc "Secure artifact storage for developers"
  homepage "https://blobyard.com"
  version "0.1.5"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://releases.blobyard.com/v0.1.5/blobyard-0.1.5-aarch64-apple-darwin.tar.gz"
      sha256 "abcbac95d51f7a9fcf76ba314200915c332b2c33b5c293712672821b4ae50e43"
    end
    on_intel do
      url "https://releases.blobyard.com/v0.1.5/blobyard-0.1.5-x86_64-apple-darwin.tar.gz"
      sha256 "962b99f772d69ac2043655c9b0f3ce0b47fd17b2ac8400587d3cb9e710f29acb"
    end
  end
  on_linux do
    on_arm do
      url "https://releases.blobyard.com/v0.1.5/blobyard-0.1.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0ea6807fbc153c1ac25516f1abf335e8fe0690997f7550f38f32183061dc790e"
    end
    on_intel do
      url "https://releases.blobyard.com/v0.1.5/blobyard-0.1.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6b70d8827d7c1c3cd306d2e6cac397413aa20fc9113b0318a33ea4d39b4f4842"
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
