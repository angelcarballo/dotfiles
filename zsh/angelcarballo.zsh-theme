
########### Prompt (based on: https://github.com/sindresorhus/pure) ###########

autoload -Uz vcs_info

zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr '^'
zstyle ':vcs_info:*' unstagedstr '+'
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{11}%r'
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' formats '@%b%c%u%B'

theme_precmd() {
  vcs_info
}

current_path() {
  echo '%B%F{blue}%~'
}

prompt_symbol_with_last_command_status() {
  echo "%(?.%{$reset_color%}.%{$fg[red]%})❯%{$reset_color%}"
}

setopt prompt_subst
PROMPT='$(current_path) %B%F{yellow}${vcs_info_msg_0_}%B%F{yellow} %{$reset_color%}% $(prompt_symbol_with_last_command_status) '

autoload -U add-zsh-hook
add-zsh-hook precmd  theme_precmd

########### Dircolors ###########

autoload colors; colors;

LS_COLORS="di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=01;05;37;41:mi=01;05;37;41:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32";
LSCOLORS="ExGxFxDxCxDxDxhbhdacEc";

# Do we need Linux or BSD Style?
if ls --color -d . &>/dev/null 2>&1
then
# Linux Style
export LS_COLORS=$LS_COLORS
alias ls='ls --color=tty'
else
# BSD Style
export LSCOLORS=$LSCOLORS
alias ls='ls -G'
fi

# Use same colors for autocompletion
zmodload -a colors
zmodload -a autocomplete
zmodload -a complist
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
