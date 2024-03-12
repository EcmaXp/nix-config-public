{ user, ... }: {
  home-manager.users.${user} = {
    home.file = {
      ".config/zed/settings.json" = {
        text = builtins.readFile zed/settings.json;
      };
      ".config/zed/keymap.json" = {
        text = builtins.readFile zed/keymap.json;
      };
    };
  };
}
