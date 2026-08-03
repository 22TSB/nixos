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
    kitty = "kitty";
  };
in

{
  home.username = "bogdan";
  home.homeDirectory = "/home/bogdan";
  home.stateVersion = "26.05";
  home.sessionVariables = {
    TERMINAL = "kitty";
  };

  programs.zsh = {
    enable = true;
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

    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [ "git" "history" ];
    };

    initContent = ''
      source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
      [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
    '';
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
    zsh-powerlevel10k
    kitty
    alacritty
  ];
}
