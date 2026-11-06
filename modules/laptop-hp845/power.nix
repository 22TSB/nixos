{ ... }:

{
  # AMD Ryzen 5 PRO 5650U
  boot.kernelParams = [
    "amd_pstate=active"
  ];

  # Power management
  services.power-profiles-daemon.enable = true;
  services.tlp.enable = false;

  # Compressed memory swap
  zramSwap.enable = true;
}
