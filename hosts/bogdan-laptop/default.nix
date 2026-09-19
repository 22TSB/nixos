{
  imports = [
    ./hardware-configuration.nix

    ../../modules/common
    ../../modules/desktop
    ../../modules/laptop
  ];

  networking.hostName = "bogdan-laptop";
  system.stateVersion = "26.05";
}
