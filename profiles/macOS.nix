{ ... }: {
  imports = [
    ./default.nix
    ../packages/macOS.nix
    ../programs/macOS.nix
    ../systems/macOS.nix
  ];
}
