#Theme Customization
ZSH_THEME="robbyrussell"

# Export Variables
export ZSH="$HOME/.oh-my-zsh"
export LANG="en_US.UTF.8"

#Setup for Bliss dircolors (only macos)
# PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"
# MANPATH="/opt/homebrew/opt/coreutils/libexec/gnuman:$MANPATH"

# alias lsah="lsd -lsah --icon=never"

#Setup for Bliss dircolors (all platforms)
# eval `dircolors ~/.sarthik/bliss-dircolors/bliss.dircolors`
# zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

#Disabled tracking of files under VCS to improve repo speeds
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Function for easily adding new directories to Path
addToPATH () {
  case ":$PATH:" in
    *":$1:"*) :;; # already there
    *) PATH="$1:$PATH";; # or PATH="$PATH:$1"
  esac
}

# Adding directories to Path
addToPATH $HOME/.local/bin
addToPATH $HOME/.npm/bin
addToPATH $HOME/.local/.npm-global/bin

# Adding directories to Path (Mac only)
addToPATH $HOME/Library/Python/3.10/bin
addToPATH /Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin

#Plugins
plugins=(thefuck zsh-autosuggestions zsh-syntax-highlighting you-should-use)

# Enabling instant-mode for thefuck
eval $(thefuck --alias --enable-experimental-instant-mode)

source $ZSH/oh-my-zsh.sh

# Adding Custom Path for N
addToPATH $HOME/.n/bin
export N_PREFIX=$HOME/.n

