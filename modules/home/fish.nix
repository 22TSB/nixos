{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set -g fish_greeting ""
    '';
    shellAliases = {
      btw = "echo i use nixos-btw";
      nrs = "sudo nixos-rebuild switch --flake ~/nixos-dotfiles#(hostname)";
      nbpc = "nix build ~/nixos-dotfiles#nixosConfigurations.bogdan22tsb.config.system.build.toplevel";
      nblh = "nix build ~/nixos-dotfiles#nixosConfigurations.laptop-hp845.config.system.build.toplevel";
      nblf = "nix build ~/nixos-dotfiles#nixosConfigurations.laptop-s710.config.system.build.toplevel";
      fs = "fastfetch";
      e = "exit";
      vim = "nvim";
      sd = "shutdown now";
      rn = "reboot";
    };
  };
}
