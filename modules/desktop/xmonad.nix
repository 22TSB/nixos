{
  services.xserver.windowManager.xmonad = {
    enable = true;
    enableContribAndExtras = true;
    extraPackages = hpkgs: [
      hpkgs.xmonad
      hpkgs.xmonad-extras
      hpkgs.xmonad-contrib
    ];
  };
}
