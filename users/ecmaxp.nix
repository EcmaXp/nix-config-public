{ user, lib, ... }: {
  imports = [
    ./default.nix
  ];

  environment.variables = {
    iCloud = "/Users/${user}/Library/Mobile Documents/com~apple~CloudDocs";
  };

  home-manager.users.${user} = {
    programs = {
      git = {
        userName = "ecmaxp";
      };
      fish = {
        shellAliases = {
          "tailscale" = "/Applications/Tailscale.app/Contents/MacOS/Tailscale";
          "k3s" = "lxc exec --project sigsrv-sdlc sigsrv-sdlc-k3s-master-0 -- k3s";
        };
        shellAbbrs = {
          "ic" = "$iCloud";
          "icp" = "$iCloud/Projects";
          "ics" = "$iCloud/Storage";
          "icu" = "$iCloud/Users";
        };
      };
      starship = {
        settings = {
          directory.substitutions = {
            "~/Library/Mobile Documents/com~apple~CloudDocs" = "$iCloud";
          };
        };
      };
    };
  };

  homebrew = {
    casks = lib.mkAfter [
      "cloudflare-warp"
      "discord"
      "keybase"
      "krisp"
      "obsidian"
      "rescuetime"
      "spotify"
      "transmission"
    ];
  };
}
