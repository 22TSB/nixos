# modules/home/dotfiles.nix
{ config, ... }:
let
  dotfiles = "${config.home.homeDirectory}/nixos-dotfiles/config";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;

  configs = {
    alacritty = "alacritty";
    kitty = "kitty";
    git = "git";
    rofi = "rofi";
    hypr = "hypr";
    waybar = "waybar";
    picom = "picom";
  };
in
{
  xdg.configFile = builtins.mapAttrs
    (name: subpath: {
      source = create_symlink "${dotfiles}/${subpath}";
      recursive = true;
    })
    configs;
}
