
class Shinysylveon < Formula
  desc "Kevin's homebrew tap to test ruby dependency and version management"
  homepage ""
  url "https://github.com/AnqiPang/demo-private/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "15d9fc76c316e6b4149a3cb7c3863735af1421603c719955ca5af8c84f5707ec"
  license "Apache-2.0"


  def install
    bin.install "src/HelloWorld.go"
    puts "ShinySylveon installed"
  end
end