{ pkgs, ... }:

{
  home.packages = with pkgs; [
    steam
    bottles
    discord
  ];
}
