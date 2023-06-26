{ inputs }:
let inherit (inputs) nixpkgs;
in { config, ... }: {
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
  home.file.".config/smplayer/smplayer.ini".text = ''
    [advanced]
    mplayer_additional_options=--hwdec=nvdec-copy --vo=gpu
    use_mplayer_window=true
    [default_gui]
    ; Display remaining time instead of total time
    actions\floating_control\1=play_or_pause, stop, separator, rewind1, current_timelabel_action, timeslider_action, remaining_timelabel_action, forward1, separator, fullscreen, mute, volumeslider_action
    [gui]
    mouse_left_click_function=play_or_pause
  '';
  programs.firefox.enable = true;
  programs.firefox.profiles."0".extraConfig = builtins.readFile inputs.userjs;
  programs.firefox.profiles."0".extensions =
    with config.nur.repos.rycee.firefox-addons; [
      keepassxc-browser
      multi-account-containers
      ublock-origin
    ];
  home.packages = with nixpkgs; [ nixfmt ];
}
