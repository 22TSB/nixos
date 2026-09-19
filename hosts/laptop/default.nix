{
  imports = [
    ./hardware-configuration.nix

    ../../modules/common
    ../../modules/desktop
    ../../modules/laptop
  ];

  networking.hostName = "laptop";
  system.stateVersion = "26.05";
}
