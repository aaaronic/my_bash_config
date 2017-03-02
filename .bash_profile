export PATH="/usr/local/bin:$PATH:$HOME/.rvm/bin"

export HISTFILESIZE=50000
export SHELL_SESSION_HISTORY=0
export PYTHONIOENCODING=utf8

# Git branch in prompt.
source ~/my_bash_config/.git-prompt.sh

export TERM="xterm-color"
export PS1="\[\e[0;33m\]\u\[\e[0m\]:\[\e[0;36m\]\w\[\e[0m\]\[\033[32m\]\$(__git_ps1)\[\033[00m\] $ "

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

if [ -d `brew --prefix`/etc/bash_completion.d ]; then
  for f in `brew --prefix`/etc/bash_completion.d/*; do source $f; done;
fi

alias ll="ls -laG"
alias grep="grep --color=auto"

alias be="bundle exec"

alias timestamp="date +%Y-%m-%dT%T%z" # ISO 8601

# alias mysqld_load="launchctl load -w /usr/local/Cellar/mysql/5.6.26/homebrew.mxcl.mysql.plist"
# alias mysqld_unload="launchctl unload -w /usr/local/Cellar/mysql/5.6.26/homebrew.mxcl.mysql.plist"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

nuke_postgres() {
  launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.postgresql93.plist
  rm -rf /usr/local/var/postgres/
  initdb -D /usr/local/var/postgres/
  launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.postgresql93.plist
}
