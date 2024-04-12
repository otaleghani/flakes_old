{ config, pkgs, ... }:

{
  home.file."./.config/tmux/tmux.conf".text = ''
    # defaults
    set -g default-terminal screen-256color
    set -g default-command fish
    # set -g default-shell fish

    # prefix
    unbind C-b
    set-option -g prefix F12
    bind-key F12 send-prefix

    # split panes
    bind C-l split-window -h
    bind C-h split-window -hb
    bind C-j split-window -v
    bind C-k split-window -vb
    unbind '"'
    unbind %

    # move trough panes
    bind l select-pane -R
    bind h select-pane -L
    bind j select-pane -D
    bind k select-pane -U

    # kill pane
    bind q kill-pane

    # windows
    bind n new-window
    bind r command-prompt -I "#W" "rename-window '%%'"
    bind , previous-window
    bind . next-window

    # ricing
    #setw -g clock-mode-colour '#${config.colorScheme.palette.base07}'
    set -g status-position bottom
    set -g status-justify left
    set -g status-bg "#${config.colorScheme.palette.base02}"
    set -g status-fg "#${config.colorScheme.palette.base07}"
    set -g status-left '   '
    set -g status-left-length 20
    set -g status-right ' %Y-%m-%d %H:%M '
    set -g status-right-length 50

    setw -g window-status-current-style 'fg=#${config.colorScheme.palette.base00} bg=#${config.colorScheme.palette.base09} bold'
    setw -g window-status-current-format ' #I #W #F ' 
    setw -g window-status-style 'fg=#${config.colorScheme.palette.base00} dim' 
    setw -g window-status-format ' #[fg=#${config.colorScheme.palette.base20}]#I #[fg=#${config.colorScheme.palette.base20}]#W #[fg=#${config.colorScheme.palette.base20}]#F ' 

  '';
}

