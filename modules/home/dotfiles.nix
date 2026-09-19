# modules/home/dotfiles.nix
{ config, ... }:
let
  dotfiles = "${config.home.homeDirectory}/nixos-dotfiles/config";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;

  configs = {
    alacritty = "alacritty";
    kitty = "kitty";

    git = "git";

    picom = "picom";
    rofi = "rofi";

    hypr = "hypr";
    waybar = "waybar";

    xmonad = "xmonad";
    xmobar = "xmobar";
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
