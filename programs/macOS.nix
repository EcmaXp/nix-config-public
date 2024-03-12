{ ... }: {
  imports = [
    dev/git-macOS.nix
    dev/gnupg-macOS.nix
    nix/nix-macOS.nix
    shells/fish-macOS.nix
    # TODO: raycast
    # TODO: Karabiner-Elements
  ];
}
