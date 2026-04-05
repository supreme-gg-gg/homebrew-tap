class InstagramCli < Formula
  desc "Unofficial CLI and terminal client for Instagram"
  homepage "https://github.com/supreme-gg-gg/instagram-cli"
  url "https://registry.npmjs.org/@i7m/instagram-cli/-/instagram-cli-1.5.0.tgz"
  sha256 "cebc50d8a85db293f5a3d4ca6b8193589c97b5dd81500ebc7a19dc08c9557236"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args

    # Homebrew 5.1.0+ disables postinstall hooks in https://github.com/Homebrew/brew/pull/21136
    # Here we will run the postinstall script directly to patch packages
    pkg_root = libexec/"lib/node_modules/@i7m/instagram-cli"
    Dir.chdir(pkg_root) do
      system "node", "node_modules/patch-package/index.js"
    end

    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/instagram-cli --version")
  end
end
