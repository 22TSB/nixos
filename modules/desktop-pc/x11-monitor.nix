{
  services.xserver.displayManager.sessionCommands = ''
    xrandr --output DisplayPort-1 --mode 3440x1440 --rate 180
    xrandr --output DisplayPort-2 --mode 3440x1440 --rate 180
    xrandr --output DP-1 --mode 3440x1440 --rate 180
    xrandr --output DP-2 --mode 3440x1440 --rate 180
    xwallpaper --center ~/walls/raekwon.png
    xset r rate 200 35 &
    '';
}
