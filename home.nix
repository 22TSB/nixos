{ config, pkgs, ... }:

let
  dotfiles = "${config.home.homeDirectory}/nixos-dotfiles/config";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;

  # Standard .config/directory
  configs = {
    qtile = "qtile";
    nvim = "nvim";
    rofi = "rofi";
    alacritty = "alacritty";
    picom = "picom";
    git = "git";
  };
in

{
  home.username = "bogdan";
  home.homeDirectory = "/home/bogdan";
  home.stateVersion = "26.05";

  programs.zsh = {
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      btw = "echo i use nixos-btw";
      nrs = "sudo nixos-rebuild switch --impure --flake ~/nixos-dotfiles#bogdan22tsb";
      syu = "sudo nixos-rebuild switch --upgrade";
      fs = "fastfetch";
      e = "exit";
      vim = "nvim";
      sd = "shutdown now";
      rn = "reboot";
    };

    initExtra = ''
      	  export PS1="\[\e[38;5;75m\]\u@\h \[\e[38;5;113m\]\w \[\e[38;5;189m\]\$ \[\e[0m\]"
      	'';

    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [ "git" "history" ];
    };
  };

  xdg.configFile = builtins.mapAttrs
    (name: subpath: {
      source = create_symlink "${dotfiles}/${subpath}";
      recursive = true;
    })
    configs;

  home.packages = with pkgs; [
    neovim
    ripgrep
    nil
    nixpkgs-fmt
    nodejs
    gcc
    rofi
    xwallpaper
    fastfetch
    btop
    ffmpeg
    pcmanfm
    discord
    figlet
    cmatrix
    cava 
    stress-ng
  ];
}
