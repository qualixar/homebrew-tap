class TouchlessMac < Formula
  desc "Control your Mac with your hand through the built-in camera"
  homepage "https://github.com/qualixar/touchless-mac"
  url "https://github.com/qualixar/touchless-mac/releases/download/v0.1.1/touchless-mac-v0.1.1-macos-arm64.tar.gz"
  sha256 "c22e98f66ef739bb6a9c85a533ba9a498d35cac6100b4e2f311cc44e6c04e262"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos

  def install
    # The program finds its hand models in models/ next to itself (symlinks are resolved).
    libexec.install "touchless-mac", "models"
    bin.install_symlink libexec/"touchless-mac"
    doc.install "README.md", "CHANGELOG.md"
  end

  def caveats
    <<~EOS
      Run `touchless-mac doctor` first. macOS asks for two permissions for your terminal app:
        Camera, and Accessibility (to move the mouse).
      The doctor opens the right System Settings page if one is off.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/touchless-mac --version")
  end
end
