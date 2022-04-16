# name: Zish

function _is_git_dirty
  echo (command git status -s --ignore-submodules=dirty 2> /dev/null)
end


function fish_prompt
  
  echo
  printf '\e[0m\033[38;5;201m╔═─═║─═─║═─═─═─═─═─═─═─'
  printf '\e[38;5;214m'
  printf '%s'(date +%X)
  printf '\e[38;5;201m─═─═─═─═─'
  printf '\e[5m\033[38;5;190m┌∩┐(◣_◢)┌∩┐'
  printf '\e[0m\033[38;5;201m─═─═─═─═─═─'
  printf '\e[38;5;214m'
  printf '%s'(date +%x)

  echo

  printf '\e[38;5;201m╚═─═║═─═║═─═'
  set_color yellow
  printf '%s' (__fish_git_prompt)
  if [ (_is_git_dirty) ]
    set_color blue
    printf '* '
  end
  set_color -o green
  printf '%s' (prompt_pwd)
  set_color cyan
  printf '👽▷▷▷ '


end
