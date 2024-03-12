{ lib, ... }: {
  environment.variables = {
    HOMEBREW_NO_ANALYTICS = "1";
  };

  homebrew = {
    enable = lib.mkDefault true;
    brews = lib.mkBefore [
      "cdk8s"
      "cockroach-sql"
      "displayplacer"
      "localstack"
      "lxc"
      "mackup"
      "symbex"
      "telnet"
      "uv"
      "ykman"
    ];
    taps = lib.mkBefore [
      "jakehilborn/jakehilborn"
      "cockroachdb/tap"
      "simonw/llm"
    ];
    casks = lib.mkBefore [
      "1password"
      "1password-cli"
      "aldente"
      "alt-tab"
      "aptakube"
      "arc"
      "bartender"
      "cleanshot"
      "codeql"
      "db-browser-for-sqlite"
      "deepl"
      "firefox"
      "fork"
      "gitbutler"
      "google-chrome"
      "heynote"
      "iterm2"
      "jetbrains-toolbox"
      "karabiner-elements"
      "kdiff3"
      "keka"
      "latest"
      "linearmouse"
      "little-snitch"
      "micro-snitch"
      "notion-calendar"
      "numi"
      "openlens"
      "orbstack"
      "raycast"
      "scroll-reverser"
      "session-manager-plugin"
      "slack"
      "teamviewer"
      "typora"
      "visual-studio-code"
      "yubico-yubikey-manager"
      "zed"
      "zoom"
      # "logitech-g-hub"
      # "mactex"
      # "wireshark"
    ];
  };
}
