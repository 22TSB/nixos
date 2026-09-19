{ pkgs, ... }:

{
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
    wget
    clang
    clang-tools

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
    obs-studio
  ];
}
