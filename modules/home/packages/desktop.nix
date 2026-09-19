{ pkgs, ... }:

{
  home.packages = with pkgs; [
    rofi
    xwallpaper
    waybar
    hyprpaper
    wl-clipboard
    pavucontrol
    brave

    pcmanfm
    kdePackages.spectacle
    kdePackages.kio-extras
    qbittorrent

    haskell-language-server
    xmobar

    (pkgs.symlinkJoin {
      name = "dolphin-wrapped";
      paths = [ pkgs.kdePackages.dolphin ];
      buildInputs = [ pkgs.makeWrapper ];
      postBuild = ''
        wrapProgram $out/bin/dolphin \
          --add-flags "-stylesheet \"data:text/css,QWidget { color: #c0caf5; }\""
      '';
    })
  ];
}
