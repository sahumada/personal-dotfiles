# aliases
alias diff='colordiff'
alias ll='ls -l'
alias vi='mvim -vb'
alias vim='mvim -vb'

# locale
export LC_ALL=en_US.UTF-8
export LANG=en_US.UFT-8

# less
export LESS='-i'

## Java 11
# For the system Java wrappers to find this JDK, symlink it with
# sudo ln -sfn /opt/brew/opt/openjdk@11/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-11.jdk
# openjdk@11 is keg-only, which means it was not symlinked into /opt/brew,
# because this is an alternate version of another formula.
# If you need to have openjdk@11 first in your PATH run:
export PATH="/usr/local/opt/openjdk@11/bin:$PATH"

#For compilers to find openjdk@11 you may need to set:
export CPPFLAGS="-I/usr/local/opt/openjdk@11/include"
export LDFLAGS="-L/usr/local/opt/zlib/lib -L/usr/local/opt/bzip2/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include -I/usr/local/opt/bzip2/include"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
eval "$(pyenv init --path)"
#eval "$(pyenv virtualenv-init -)"

# PATH
export PATH="/usr/local/sbin:$PATH"
if [ -d "/opt/brew/bin" ]; then
    PATH="/opt/brew/bin:$PATH"
fi
export PATH="~/bin:$PATH"

# Powerline
if [ -f `which powerline-daemon` ]; then
  powerline-daemon -q
  POWERLINE_BASH_CONTINUATION=1
  POWERLINE_BASH_SELECT=1
  source /usr/local/lib/python3.9/site-packages/powerline/bindings/bash/powerline.sh
fi
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# xQuartz
export DISPLAY=:0
