class LimaPrivate < Formula
  desc "Linux virtual machines"
  homepage "https://github.com/AnqiPang/lima-private"
  url "https://github.com/AnqiPang/lima-private/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "82fcb5d272d412147f305622d38adb17658e9a7388c98b0c8198edcd69ab66e7"
  license "Apache-2.0"
  head "https://github.com/AnqiPang/lima-private.git", branch: "master"


  depends_on "go" => :build
  depends_on "qemu"

  def install
    system "make", "VERSION=#{version}", "clean", "binaries"

    bin.install Dir["_output/bin/*"]
    share.install Dir["_output/share/*"]

    # Install shell completions
    output = Utils.safe_popen_read("#{bin}/limactl", "completion", "bash")
    (bash_completion/"limactl").write output
    output = Utils.safe_popen_read("#{bin}/limactl", "completion", "zsh")
    (zsh_completion/"_limactl").write output
    output = Utils.safe_popen_read("#{bin}/limactl", "completion", "fish")
    (fish_completion/"limactl.fish").write output
  end

  test do
    assert_match "Pruning", shell_output("#{bin}/limactl prune 2>&1")
  end
end