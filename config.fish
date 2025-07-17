if status is-interactive
    # Commands to run in interactive sessions can go here
end

oh-my-posh init fish --config /home/trinib/.local/share/fishthemes/night-owl.omp.json | source 
zoxide init fish | source
mcfly init fish | source

set PATH $PATH /home/trinib/.local/bin

# Add local bin directory to PATH
fish_add_path ~/.local/bin

set -gx MCFLY_RESULTS 500
set -gx MCFLY_RESULTS_SORT LAST_RUN
set -gx MCFLY_FUZZY 4
set -gx MCFLY_DELETE_WITHOUT_CONFIRM true
set -gx MCFLY_KEY_SCHEME vim
set -gx MCFLY_PROMPT "❯"
#set -gx EDITOR nvim
#set -gx VISUAL nvim
set -gx PAGER less
set -gx BROWSER firefox
set -gx LANG en_US.UTF-8
#et -gx LC_ALL en_US.UTF-8
set -gx GPG_TTY (tty)

set -x TZ America/New_York

# Make autosuggestions more visible
#set -g fish_autosuggestion_color brblack

# =================== Key Bindings ===================
# Use Ctrl+F to accept the current suggestion
bind \cf forward-word

bind \ce "fish"

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


# =================== System shortcuts Alias ===================
alias df 'df -h'
alias du 'du -h'
alias free 'free -m'
alias reload="exec fish"

# DELETE BELOW AND CONTENT FROM .config\fish\fish_variables AAND RESTART TERMIANL TO RESET COLORS
set fish_color_normal f8f8f2
set fish_color_command 50fa7b
set fish_color_param 8be9fd
set fish_color_redirection ff79c6
set fish_color_comment 6272a4
set fish_color_error ff5555
set fish_color_escape ff79c6
set fish_color_operator ff79c6
set fish_color_end 50fa7b
set fish_color_quote f1fa8c
set fish_color_autosuggestion 6272a4
set fish_color_valid_path --underline

## Ctrl + L	Clear screen
## Ctrl + C	Cancel command
## Ctrl + U	Delete before cursor
## Ctrl + K	Delete after cursor
## Ctrl + W	Delete previous word
## Ctrl + A	Beginning of line
## Ctrl + E	End of line
## Ctrl + R	Reverse search in history
## !!	Run previous command
## !<command>	Run last command starting with <command>
## Tab	Autocomplete
