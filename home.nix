{ config, pkgs, ... }: {
  home.homeDirectory = "/home/whs";
  home.stateVersion = "23.05";
  home.username = "whs";
  programs.home-manager.enable = true;
  programs.vim.enable = true;
  programs.git = {
    enable = true;
    userEmail = "hswongac@gmail.com";
    userName = "whs";
  };
}
