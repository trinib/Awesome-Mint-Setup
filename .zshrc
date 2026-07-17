toilet  -f smblock -F gay --filter border:gay "======== SINGH ========="
echo -e "{⌐■_■} > -- ︻╦╤─ ~ ~ ~ ~ \e[5m" | cowsay -f eyes | lolcat

zstyle ':omz:update' mode reminder
zstyle ':omz:update' frequency 3
source ~/aliases.zsh

export PATH="$HOME/.local/bin:$PATH"

#eval "$(oh-my-posh init zsh)"
#eval "$(oh-my-posh init zsh --config /home/trinib/.local/share/oh-my-posh-theme.json)"

source ~/.zsh/catppuccin_frappe-zsh-syntax-highlighting.zsh
# --- dynamic starship: right cluster on line 1 when it truly fits, else line 2 ---
autoload -Uz add-zsh-hook

typeset -g _SS_INLINE="$HOME/.config/starship.toml"
typeset -g _SS_NARROW="$HOME/.config/starship-narrow.toml"

# strip color codes + zsh prompt markers, then wc -L gives display columns
_ss_width() { sed -e $'s/\x1b\\[[0-9;]*[a-zA-Z]//g' -e 's/%[{}]//g' | wc -L; }

# right cluster width is ~constant; measure once at startup
typeset -g _SS_RIGHT_W
_SS_RIGHT_W=$(STARSHIP_CONFIG="$_SS_NARROW" starship prompt --right 2>/dev/null | _ss_width)

_ss_switch() {
  local lw
  lw=$(STARSHIP_CONFIG="$_SS_NARROW" starship prompt 2>/dev/null | _ss_width)
  if (( lw + _SS_RIGHT_W + 3 <= COLUMNS )); then
    export STARSHIP_CONFIG="$_SS_INLINE"      # fits -> line 1
  else
    export STARSHIP_CONFIG="$_SS_NARROW"      # doesn't -> line 2
  fi
}
add-zsh-hook precmd _ss_switch
# --- track last command duration for the always-visible timer pill ---
zmodload zsh/datetime 2>/dev/null

typeset -g _CMD_START=0
typeset -g LAST_CMD_DURATION_MS=0
export LAST_CMD_DURATION_MS

_cmd_timer_preexec() {
  _CMD_START=$EPOCHREALTIME
}

_cmd_timer_precmd() {
  if [[ "$_CMD_START" != "0" ]]; then
    local elapsed_ms=$(( (EPOCHREALTIME - _CMD_START) * 1000 ))
    LAST_CMD_DURATION_MS=${elapsed_ms%.*}
    export LAST_CMD_DURATION_MS
    _CMD_START=0
  fi
}

add-zsh-hook preexec _cmd_timer_preexec
add-zsh-hook precmd _cmd_timer_precmd
eval "$(starship init zsh)"

# reflow live on window resize
TRAPWINCH() {
  _ss_switch
  local f; for f in $precmd_functions; do $f; done
  zle && zle reset-prompt
}

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME=""

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Zsh Screen Flash / Alert on Empty Backspace
function alert-backspace() {
    if [[ -z "$BUFFER" ]]; then
        printf "\a" # Sends the system bell / screen flash alert
    else
        zle backward-delete-char
    fi
}
zle -N alert-backspace
bindkey '^?' alert-backspace # Maps native Backspace key
bindkey '^H' alert-backspace # Maps secondary Backspace layout

# Zsh Screen Flash / Alert on Empty Backspace
function alert-backspace() {
    if [[ -z "$BUFFER" ]]; then
        printf "\a" # Sends the system bell / screen flash alert
    else
        zle backward-delete-char
    fi
}
zle -N alert-backspace
bindkey '^?' alert-backspace # Maps native Backspace key
bindkey '^H' alert-backspace # Maps secondary Backspace layout


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# bun completions
[ -s "/home/trinib/.bun/_bun" ] && source "/home/trinib/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Headroom proxy routing (added by Claude Code)
export ANTHROPIC_BASE_URL=http://127.0.0.1:8787
export OPENAI_BASE_URL=http://127.0.0.1:8787/v1

# >>> headroom persistent env >>>
export HEADROOM_PORT="8787"
export HEADROOM_HOST="127.0.0.1"
export HEADROOM_MODE="token"
export HEADROOM_BACKEND="anthropic"
export HEADROOM_TELEMETRY="off"
export ANTHROPIC_BASE_URL="http://127.0.0.1:8787"
export ENABLE_TOOL_SEARCH="true"
export COPILOT_PROVIDER_TYPE="anthropic"
export COPILOT_PROVIDER_BASE_URL="http://127.0.0.1:8787"
export OPENAI_BASE_URL="http://127.0.0.1:8787/v1"
# <<< headroom persistent env <<<
