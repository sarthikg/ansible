#Theme Customization
ZSH_THEME="bliss"

#Setup for Bliss dircolors (only macos)
PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"
MANPATH="/opt/homebrew/opt/coreutils/libexec/gnuman:$MANPATH"
alias ls="ls --color=always"

#Setup for Bliss dircolors (all platforms)
eval `dircolors ~/.sarthik/bliss-dircolors/bliss.dircolors`

#Disabled tracking of files under VCS to improve repo speeds
DISABLE_UNTRACKED_FILES_DIRTY="true"

#Plugins
plugins=(thefuck zsh-autosuggestions zsh-syntax-highlighting you-should-use zsh-history-substring-search dirhistory)

# Extra Plugins
# plugins = (auto-notify ufw docker git-prompt)

source $ZSH/oh-my-zsh.sh

# Function for easily adding new directories to Path
addToPATH () {
  case ":$PATH:" in
    *":$1:"*) :;; # already there
    *) PATH="$1:$PATH";; # or PATH="$PATH:$1"
  esac
}

# Adding directories to Path
addToPATH $HOME/.local/bin

# Enabling instant-mode for thefuck
eval $(thefuck --alias --enable-experimental-instant-mode)
