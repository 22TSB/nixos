{
  services.xserver = {
    enable = true;
    autoRepeatDelay = 200;
    autoRepeatInterval = 35;

    displayManager.sessionCommands = ''
      xwallpaper --center --zoom ~/walls/raekwon.png
    '';
  };

  services.picom.enable = true;
}
