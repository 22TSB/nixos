{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # terminal
    tmux
    yazi

    # editor + nvim ecosystem
    neovim
    live-server
    emmet-language-server
    vimPlugins.nvim-treesitter-parsers.nix
    tree-sitter

    # LSPs / language tooling
    lua-language-server
    vscode-langservers-extracted
    typescript-language-server
    typescript
    intelephense
    php
    phpPackages.php-cs-fixer
    vscode-js-debug

    # build tools
    gcc
    gnumake
    gdb
    cmake
    rustup
    nodejs
    lua51Packages.luarocks
    nasm
    python3
    python313Packages.debugpy

    # nix tooling
    nil
    nixpkgs-fmt

    # git
    lazygit
  ];
}
