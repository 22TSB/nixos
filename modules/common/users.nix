{ pkgs, ... }:

{
  users.defaultUserShell = pkgs.fish;
  programs.fish.enable = true;

  users.users.bogdan = {
    isNormalUser = true;
    shell = pkgs.fish;

    extraGroups = [
      "wheel"
      "networkmanager"
    ];
  };
}
