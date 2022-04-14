class Shinysylveon < Formula
  desc "Kevin's homebrew tap to test ruby dependency and version management"
  homepage ""
  url "https://github.com/ChaoningKevin/ShinySylveon/archive/refs/tags/v1.0.tar.gz"
  sha256 "e18fbef2ab6e710fa3edb8ad8cbbb128bbe9a9697f220c4f37b4fb3de43a45cc"
  license "Apache-2.0"

  depends_on "chaoningkevin/homebrew-tap/qemu_1.0"

  def install
    puts "Hello Kevin!"
    puts "ShinySylveon installed"
  end
end
