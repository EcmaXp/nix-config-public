{ user, pkgs, ... }: {
  users.users = {
    ${user} = {
      home = "/Users/${user}";  # TODO: macOS + NixOS
      shell = pkgs.fish;
    };
  };

  environment.shells = with pkgs; [
    zsh
    fish
  ];

  environment.variables = {
    EDITOR = "micro";
  };
}
