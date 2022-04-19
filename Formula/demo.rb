class Demo < Formula
  desc "Kevin's homebrew tap to test ruby dependency and version management"
  homepage ""
  url "https://github.com/ChaoningKevin/ShinySylveon/archive/refs/tags/v3.1.tar.gz"
  sha256 "433ec2326f08aaf72f3fb4a6faa064b0b4d691a1b4e4aa05a09a20b513899c09"
  license "Apache-2.0"

  depends_on "chaoningkevin/homebrew-tap/qemu@6.1.0"

  def install
    bin.install "src/HelloWorld.go" => "HelloWorld"
    puts "Hello Kevin!"
    puts "ShinySylveon demo installed"
  end
end
