{ config, pkgs, ... }:

let
  dotfiles = "${config.home.homeDirectory}/nixos-dotfiles/config"; create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;

  # Standard .config/directory
  configs = {
    # qtile = "qtile";
    rofi = "rofi";
    alacritty = "alacritty";
    picom = "picom";
    git = "git";
    kitty = "kitty";
    hypr = "hypr";
    waybar = "waybar";
    # nvim = "nvim";
  };
in

{
  home.username = "bogdan";
  home.homeDirectory = "/home/bogdan";
  home.stateVersion = "26.05";
  home.sessionVariables = {
    TERMINAL = "alacritty";
  };

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set -g fish_greeting ""
    '';

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
  };

  xdg.configFile = builtins.mapAttrs
    (name: subpath: {
      source = create_symlink "${dotfiles}/${subpath}";
      recursive = true;
    })
    configs;

  home.packages = with pkgs; [
    neovim

    # live server
    live-server

    # emmet
    emmet-language-server

    # nix treesitter
    vimPlugins.nvim-treesitter-parsers.nix

    # clipboard
    wl-clipboard

    # lsp
    lua-language-server
    vscode-langservers-extracted
    typescript-language-server
    typescript
    intelephense

    # php tools
    php
    phpPackages.php-cs-fixer

    # core
    gnutar
    unzip

    # search / nav
    fd
    ripgrep

    # js tools
    vscode-js-debug

    # build tools
    gcc
    gnumake
    gdb
    cmake

    # rust
    rustup

    # treesitter CLI
    tree-sitter

    # git UI
    lazygit

    # image support for Snacks
    imagemagick

    nil
    nixpkgs-fmt
    nodejs
    rofi
    xwallpaper
    fastfetch
    btop
    ffmpeg
    pcmanfm
    discord
    figlet
    cmatrix
    unimatrix
    cava 
    stress-ng
    zsh-powerlevel10k
    kitty
    alacritty
    brave
    fish
    fishPlugins.done
    fishPlugins.fzf-fish
    fishPlugins.forgit
    feh
    vlc
    gimp
    bottles
    steam
    (pkgs.symlinkJoin {
    name = "dolphin-wrapped";
    paths = [ pkgs.kdePackages.dolphin ];
    buildInputs = [ pkgs.makeWrapper ];
    postBuild = ''
      wrapProgram $out/bin/dolphin \
        --add-flags "-stylesheet \"data:text/css,QWidget { color: #c0caf5; }\""
    '';
    })
    kdePackages.spectacle
    playerctl
    cmus
    waybar
    hyprpaper
    (pkgs.writeShellApplication {
      name = "ns";
      runtimeInputs = with pkgs; [
        fzf
        nix-search-tv
      ];
      text = builtins.readFile "${pkgs.nix-search-tv.src}/nixpkgs.sh";
    })
    kdePackages.kdenlive
    kdePackages.gwenview
    lua51Packages.luarocks
    qbittorrent
    kdePackages.kio-extras 
    pavucontrol
  ];
}
