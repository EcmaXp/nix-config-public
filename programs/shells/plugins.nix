{ user, ... }: {
  home-manager.users.${user} = {
    programs = {
      broot.enable = true;
      carapace.enable = true;
      direnv.enable = true;
      fzf.enable = true;
      mcfly.enable = true;
      navi.enable = true;
      skim.enable = true;
      watson.enable = true;
      yazi.enable = true;
      zellij.enable = true;
      zoxide.enable = true;
    };
  };
}
