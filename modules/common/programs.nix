{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  programs.firefox.enable = true;
  programs.steam.enable = true;

  environment.systemPackages = with pkgs; [
    git vim wget clang clang-tools
  ];

  services.udisks2.enable = true;
  services.gvfs.enable = true;
}
