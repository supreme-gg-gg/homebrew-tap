class InstagramCli < Formula
  desc "Unofficial CLI and terminal client for Instagram"
  homepage "https://github.com/supreme-gg-gg/instagram-cli"
  url "https://registry.npmjs.org/@i7m/instagram-cli/-/instagram-cli-1.4.0.tgz"
  sha256 "e38b98ab331de279459b7245630c785f91ad5c32c683ac1eccb9bca6f2884b1a"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/instagram-cli --version")
  end
end
