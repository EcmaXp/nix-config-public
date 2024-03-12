{ user, lib, pkgs, ...} : {
  programs.fish = {
    enable = true;
    shellInit = ''
      /opt/homebrew/bin/brew shellenv | source
      for nix_profile in (string split " " $NIX_PROFILES)
        fish_add_path -gm $nix_profile/bin
      end
    '';
  };

  home-manager.users.${user} = {
    programs.fish = {
      interactiveShellInit = lib.mkBefore ''
        source {$HOME}/.iterm2_shell_integration.fish

        # shared (python binary package)
        # https://stackoverflow.com/a/72217172/9675715
        # export LDFLAGS=-L/opt/homebrew/lib
        # export CPPFLAGS=-I/opt/homebrew/include
      '';
      shellAliases = {
        "ibrew" = "arch -x86_64 /usr/local/bin/brew";
      };
      shellAbbrs = {
        # nix-darwin
        "nr" = "darwin-rebuild switch --flake ~/.config/nix-darwin";
        "nhr" = "ls ~/.config/nix-darwin/**.nix | entr darwin-rebuild switch --flake ~/.config/nix-darwin";
      };
      functions = {
        __fish_command_not_found_handler = {
          body = "~/bin/nix-command-not-found $argv";
          onEvent = "fish_command_not_found";
        };
      };
    };

    home.file."bin/nix-command-not-found" = {
      executable = true;
      text = ''
        #!/usr/bin/env bash
        source ${pkgs.nix-index}/etc/profile.d/command-not-found.sh
        command_not_found_handle "$@"
      '';
    };
  };
}
