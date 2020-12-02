# aliases
alias ll='ls -l'
alias vi='mvim -v'
alias vim='mvim -v'

# locale
export LC_ALL=en_US.UTF-8
export LANG=en_US.UFT-8

# PATH
export PATH="/usr/local/opt/openjdk@11/bin:$PATH"
export PATH="${HOME}/bin:/usr/local/sbin:$PATH"

# Powerline
if [ -f `which powerline-daemon` ]; then
  powerline-daemon -q
  POWERLINE_BASH_CONTINUATION=1
  POWERLINE_BASH_SELECT=1
  source /usr/local/lib/python3.8/site-packages/powerline/bindings/bash/powerline.sh
fi
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# xQuartz
export DISPLAY=:0
