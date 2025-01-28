{pkgs, ...}: {
  # Tmux
  # Almost all of this is customization and should be moved out of system configs
  programs.tmux = {
    enable = true;
    clock24 = true;
    shortcut = "a";
    secureSocket = false;
    escapeTime = 0;
    newSession = true;

    plugins = with pkgs; [
      tmuxPlugins.better-mouse-mode
    ];

    extraConfig = ''
      set -g default-terminal "xterm-256color"
      set -ga terminal-overrides ",*256col*:Tc"
      set -ga terminal-overrides '*:Ss=\E[%p1%d q:Se=\E[ q'
      set-environment -g COLORTERM "truecolor"

      set-option -g mouse on

      bind v split-window -h -c "#{pane_current_path}"
      bind s split-window -v -c "#{pane_current_path}"
      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R

      bind c new-window
      bind t next-window
      bind T previous-window
    '';
  };
}
