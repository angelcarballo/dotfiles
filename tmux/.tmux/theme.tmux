# Status bar
set-option -g status-position bottom
set -g status-bg "colour00"
set -g status-fg "colour07"
set -g status-justify "centre"
set -g status-left-length "100"
set -g status "on"
set -g status-right-length "100"
set -g status-left " #S #{prefix_highlight} "
set -g status-right "%d %b - #(TZ='America/New_york' date +%%H:%%M) - %H:%M "
setw -g window-status-format " #I.#W#{?window_zoomed_flag,^,} "
setw -g window-status-current-format "[#I.#W#{?window_zoomed_flag,^,}]"

# Pane borders
set -g pane-border-fg "colour18"
set -g pane-active-border-fg "colour20"

