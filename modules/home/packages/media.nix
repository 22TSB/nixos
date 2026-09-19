{ pkgs, ... }:

{
  home.packages = with pkgs; [
    vlc
    feh
    gimp
    imagemagick
    ffmpeg
    obs-studio
    kdePackages.kdenlive
    kdePackages.gwenview

    cmus
    playerctl
  ];
}
