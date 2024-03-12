{ ... }: {
  imports = [
    dev/git.nix
    dev/gnupg.nix
    editors/zed.nix
    nix/home-manager.nix
    nix/nix-index.nix
    nix/nix.nix
    shells/fish.nix
    shells/plugins.nix
    shells/starship.nix
    shells/tmux.nix
  ];
}
