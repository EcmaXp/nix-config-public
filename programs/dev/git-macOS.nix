{ user, ...} : {
  home-manager.users.${user} = {
    programs.git = {
      extraConfig = {
        credential.helper = "osxkeychain";
      };
    };
  };
}
