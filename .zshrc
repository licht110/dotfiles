#export LANG=ja_JP.UTF-8
export LANG=en_US.UTF-8
export PATH="$HOME/usr/local/bin:$PATH"
export LD_LIBRARY_PATH="/usr/local/lib"
export PATH="$HOME/.rbenv/bin:$PATH"
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
[ "$(which pyenv)" = 0 ] && eval "$(pyenv init -)"
[ "$(which rbenv)" = 0 ] && eval "$(rbenv init -)"

export PATH="$HOME/bin:$PATH"

autoload -Uz colors
colors

autoload -Uz compinit
compinit

bindkey -e
#bindkey -v

setopt share_history

setopt histignorealldups

HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000

setopt correct

alias -g L='| less'
alias -g H='| head'
#alias -g G='| grep'
alias -g G='| egrep'
#alias -g GI='| grep -ri'
vi='vim'

if [ "$(uname -a | egrep "^Linux")" ];then
  alias ls='ls --color=auto'
  alias lst='ls -ltr --color=auto'
  alias l='ls -ltr --color=auto'
  alias la='ls -la --color=auto'
  alias ll='ls -l --color=auto'
elif [ "$(uname -a | egrep "^Darwin")" ];then
  alias ls='ls -G'
  alias lst='ls -ltr -G'
  alias l='ls -ltr -G'
  alias la='ls -la -G'
  alias ll='ls -l -G'
fi
#alias so='source'
#alias v='vim'
#alias vi='vim'
#alias vz='vim ~/.zshrc'
#alias c='cdr'
# historyに日付を表示
alias h='fc -lt '%F %T' 1'
alias cp='cp -i'
alias rm='rm -i'
alias mkdir='mkdir -p'
alias ..='c ../'
alias back='pushd'
alias diff='diff -U1'
alias history="history -E 1"
alias rrh='sshpass -p $(openssl rsautl -inkey ~/.ssh/private.key -in ~/.ssh/secret -decrypt) ssh -o StrictHostKeyChecking=no'
alias rscp='sshpass -p $(openssl rsautl -inkey ~/.ssh/private.key -in ~/.ssh/secret -decrypt) scp -P14022 -p'
alias tmux='tmux -2'

#stty erase ^H
bindkey "^[[3~" delete-char

if [ "$(uname -a | egrep "^Linux")" ];then
  chpwd() { ls --color=auto }
elif [ "$(uname -a | egrep "^Darwin")" ];then
  chpwd() { ls -G}
fi

cdpath=(~)

autoload -Uz select-word-style
select-word-style default
#zstyle ':zle:*' word-chars "_-./;@"
#zstyle ':zle:*' word-style unspecified

setopt no_flow_control

PROMPT="%(?.%{${fg[green]}%}.%{${fg[red]}%})%n${reset_color}@${fg[cyan]}%m${reset_color}(%*%) %~
%# "

zstyle ':completion:*:default' menu select=2

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

bindkey '^r' history-incremental-pattern-search-backward
bindkey '^s' history-incremental-pattern-search-forward

autoload -Uz history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^b" history-beginning-search-forward-end

autoload -Uz add-zsh-hook
autoload -Uz chpwd_recent_dirs cdr
add-zsh-hook chpwd chpwd_recent_dirs
zstyle ":chpwd:*" recent-dirs-default true

autoload -Uz zmv
alias zmv='noglob zmv -W'

function mkcd() {
  if [[ -d $1 ]]; then
    echo "$1 already exists!"
    cd $1
  else
    mkdir -p $1 && cd $1
  fi
}

RPROMPT="%{${fg[blue]}%}[%~]%{${reset_color}%}"
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }
RPROMPT=$RPROMPT'${vcs_info_msg_0_}'
