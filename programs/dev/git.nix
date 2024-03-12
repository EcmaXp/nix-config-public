{ user, ...} : {
  home-manager.users.${user} = {
    programs.git = {
      enable = true;
      signing.signByDefault = true;
      delta.enable = true;
      extraConfig = {
        init.defaultbranch = "main";
        core.excludesfile = "~/.gitignore";
      };
    };
  };
}
