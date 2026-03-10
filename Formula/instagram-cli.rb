class InstagramCli < Formula
  desc "Unofficial CLI and terminal client for Instagram"
  homepage "https://github.com/supreme-gg-gg/instagram-cli"
  url "https://registry.npmjs.org/@i7m/instagram-cli/-/instagram-cli-1.4.5.tgz"
  sha256 "a6c3eb8e6b99849b2b7ea67639ba702b520a2947bc34100c2aeb5dde3692ae9a"
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
