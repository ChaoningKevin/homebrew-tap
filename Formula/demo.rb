class Demo < Formula
  desc "Kevin's homebrew tap to test ruby dependency and version management"
  homepage ""
  url "https://github.com/ChaoningKevin/ShinySylveon/archive/refs/tags/v3.1.tar.gz"
  sha256 "433ec2326f08aaf72f3fb4a6faa064b0b4d691a1b4e4aa05a09a20b513899c09"
  license "Apache-2.0"
  
  resource "qemu"
    url "https://download.qemu.org/qemu-7.0.0-rc4.tar.xz"
    sha256 "be0cfbb301a969a6242826a069f9c441ddf3620fa28861214a647d581d599aaa" 
  end 

  def install
    bin.install "src/HelloWorld.go" 
    
    ENV["LIBTOOL"] = "glibtool"

    args = %W[
      --prefix=#{prefix}
      --cc=#{ENV.cc}
      --host-cc=#{ENV.cc}
      --disable-bsd-user
      --disable-guest-agent
      --enable-curses
      --enable-libssh
      --enable-slirp=system
      --enable-vde
      --enable-virtfs
      --extra-cflags=-DNCURSES_WIDECHAR=1
      --disable-sdl
    ]
    # Sharing Samba directories in QEMU requires the samba.org smbd which is
    # incompatible with the macOS-provided version. This will lead to
    # silent runtime failures, so we set it to a Homebrew path in order to
    # obtain sensible runtime errors. This will also be compatible with
    # Samba installations from external taps.
    args << "--smbd=#{HOMEBREW_PREFIX}/sbin/samba-dot-org-smbd"

    args << "--disable-gtk" if OS.mac?
    args << "--enable-cocoa" if OS.mac?
    args << "--enable-gtk" if OS.linux?
    
    resource("qemu").stage(system "./configure", *args)
    resource("qemu").stage(system "make", "V=1", "install")
    puts "Hello Kevin!"
    puts "ShinySylveon demo installed"
  end
end
