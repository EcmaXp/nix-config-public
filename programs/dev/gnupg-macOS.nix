{ user, lib, pkgs, ... }: {
  home-manager.users.${user} = {
    home.packages = with pkgs; [
      pinentry_mac
    ];

    services.gpg-agent.extraConfig = lib.mkBefore ''
      pinentry-program ${pkgs.pinentry_mac}/Applications/pinentry-mac.app/Contents/MacOS/pinentry-mac
    '';
  };
}
