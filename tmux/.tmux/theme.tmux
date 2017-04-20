# Prefix highlight options
set -g @prefix_highlight_fg 'colour18'
set -g @prefix_highlight_bg 'colour20'

# Status bar
set-option -g status-position bottom
set -g status-bg "colour18"
set -g status-fg "colour21"
set -g status-justify "left"
set -g status-left-length "100"
set -g status "on"
set -g status-right-length "100"
set -g status-right-attr "none"
set -g status-attr "none"
set -g status-left-attr "none"
set -g status-left "#{tmux-status-variables} #S #{prefix_highlight} "
set -g status-right "#(~/src/dotfiles/bin/next-calendar-event) :: #{battery_percentage} :: %d %b %H:%M "
setw -g window-status-format " #I.#W#{?window_zoomed_flag,^,} "
setw -g window-status-current-format "#[fg=colour18,bg=colour20] #I.#W#{?window_zoomed_flag,^,} "

# Pane borders
set -g pane-border-fg "colour18"
set -g pane-active-border-fg "colour18"
