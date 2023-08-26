{inputs, ...}: {config, ...}: {
  programs.firefox.enable = true;
  programs.firefox.profiles."0".extraConfig = builtins.readFile (inputs.userjs + /user.js);
  programs.firefox.profiles."0".extensions = with config.nur.repos.rycee.firefox-addons; [
    keepassxc-browser
    multi-account-containers
    ublock-origin
  ];
}
