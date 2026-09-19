{
  imports = [
    ./hardware-configuration.nix

    ../../modules/common
    ../../modules/desktop
    ../../modules/desktop-pc
  ];

  networking.hostName = "bogdan22tsb";
  system.stateVersion = "26.05";
}
