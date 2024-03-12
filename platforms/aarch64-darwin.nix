{ pkgs, ... }: {
  nixpkgs.hostPlatform = "aarch64-darwin";
  nix.extraOptions = "extra-platforms = aarch64-darwin x86_64-darwin";
}
