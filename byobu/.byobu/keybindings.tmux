set -g prefix F12
unbind-key -n C-a

bind -n    C-Space   next-layout

bind -n    C-Up      set -g status on
bind -n    C-Down    set -g status off

### HOOKS #####################################################################

set-hook -g 'after-split-window' 'select-layout -E'
set-hook -g 'pane-exited' 'select-layout -E'
set-hook -g 'window-linked' "rename-window ''"
