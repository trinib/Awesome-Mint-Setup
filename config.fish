if status is-interactive
    # Commands to run in interactive sessions can go here
end

oh-my-posh init fish --config /home/trinib/.local/share/fishthemes/night-owl.omp.json | source 
zoxide init fish | source
mcfly init fish | source

set -x TZ America/New_York

# Created by `pipx` on 2025-07-10 06:51:15
set PATH $PATH /home/trinib/.local/bin

set -gx MCFLY_RESULTS 500
set -gx MCFLY_RESULTS_SORT LAST_RUN
set -gx MCFLY_FUZZY 4
set -gx MCFLY_DELETE_WITHOUT_CONFIRM true
set -gx MCFLY_KEY_SCHEME vim
set -gx MCFLY_PROMPT "❯"

# Make autosuggestions more visible
set -g fish_autosuggestion_color brblack


# =================== Key Bindings ===================
# Use Ctrl+F to accept the current suggestion
bind \cf forward-word

bind \ce fish

# Alt+Left/Right to navigate words
bind \e\[1\;3C forward-word
bind \e\[1\;3D backward-word

# Ctrl+Backspace to delete previous word
bind \b backward-kill-word

# Ctrl+Delete to delete next word
bind \e\[3\;5~ kill-word

# Alt+Up to search history matching current input
bind \e\[1\;3A history-search-backward

# Alt+Down to search history matching current input
bind \e\[1\;3B history-search-forward


# =================== History Settings ===================
# Increase history size
set -g fish_history_max_length 10000

# Don't save commands starting with space
set -g fish_history_ignore_space 1

# Remove duplicates from history
set -g fish_history_ignore_dups 1


# =================== System shortcuts ===================
alias df 'df -h'
alias du 'du -h'
alias free 'free -m'
