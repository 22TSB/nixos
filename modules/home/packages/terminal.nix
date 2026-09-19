{ pkgs, ... }:

{
  home.packages = with pkgs; [
    kitty
    alacritty

    fish
    fishPlugins.done
    fishPlugins.fzf-fish
    fishPlugins.forgit
    zsh-powerlevel10k

    # core cli utils
    gnutar
    unzip
    fd
    ripgrep
    fastfetch
    btop
    stress-ng
    tree

    # terminal fun
    figlet
    cmatrix
    unimatrix
    cava

    # custom script
    (pkgs.writeShellApplication {
      name = "ns";
      runtimeInputs = with pkgs; [
        fzf
        nix-search-tv
      ];
      text = builtins.readFile "${pkgs.nix-search-tv.src}/nixpkgs.sh";
    })
  ];
}
