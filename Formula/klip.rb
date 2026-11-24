class Klip < Formula
  desc "Simple Wayland screenshot tool: select, annotate, copy or save"
  homepage "https://github.com/schonbeck/klip"
  url "https://github.com/schonbeck/klip/releases/download/v0.1.3/klip-0.1.3.tar.gz"
  sha256 "764e9b7ba414bac3a974c55acca368f23651da524a28803da7ec3c2d54262753"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://github.com/schonbeck/homebrew-tap/releases/download/klip-0.1.3"
    sha256 cellar: :any, x86_64_linux: "f0f37fb2fb88ee283cfd660a4c8529d151c0989cf8470b2b2b0c79a52672fa53"
  end

  depends_on "pkgconf" => :build
  depends_on "rust" => :build
  depends_on "cairo"
  depends_on "gdk-pixbuf"
  depends_on "glib"
  depends_on "graphene"
  depends_on "gtk4"
  depends_on :linux
  depends_on "pango"

  def install
    ENV["KLIP_GIT_HASH"] = "v#{version}"
    system "cargo", "install", *std_cargo_args
    (share/"applications").install "data/io.github.schonbeck.klip.desktop"
    (share/"icons/hicolor/scalable/apps").install "data/io.github.schonbeck.klip.svg"
  end

  def caveats
    <<~EOS
      klip needs a Wayland desktop with xdg-desktop-portal (GNOME, KDE, ...).
      Run `klip` once: it stays in the background (tray icon, Ctrl+Alt+P)
      and starts at login. `klip --settings` changes the shortcut, save folder
      and autostart.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/klip --version")
    assert_match "Usage: klip", shell_output("#{bin}/klip --help")
    assert_path_exists share/"applications/io.github.schonbeck.klip.desktop"
  end
end
