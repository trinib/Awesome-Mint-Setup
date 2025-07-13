# System commands
abbr -a -g "ex" "exec fish"
abbr -a -g "c" "clear"
abbr -a -g "e" "$EDITOR"
abbr -a -g "o" "xdg-open"
abbr -a -g "g" "git"
abbr -a -g "k" "kubectl"
abbr -a -g "d" "docker"
abbr -a -g "dc" "docker-compose"

# Directory navigation
abbr -a -g "h" "cd ~"
abbr -a -g "dl" "cd ~/Downloads"
abbr -a -g "doc" "cd ~/Documents"
abbr -a -g "dev" "cd ~/Development"

# Package management (adapt to your system)
abbr -a -g "ai" "sudo apt install"
abbr -a -g "au" "sudo apt update"
abbr -a -g "aug" "sudo apt upgrade"

# Git abbreviations
abbr -a -g "gaa" "git add --all"
abbr -a -g "gcm" "git commit -m"
abbr -a -g "gco" "git checkout"
abbr -a -g "gpl" "git pull"
abbr -a -g "gps" "git push"
abbr -a -g "gst" "git status"
abbr -a -g "gbr" "git branch"

# Network
abbr -a -g "myip" "curl ifconfig.me"
abbr -a -g "ports" "sudo netstat -tulanp"
