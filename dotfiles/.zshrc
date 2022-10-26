#Oh-My-Zsh Installation Directory
export ZSH="/Users/sarthikg/.oh-my-zsh"

#Theme Customization
ZSH_THEME="bliss"

#Setup for Bliss dircolors (only macos)
PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"
MANPATH="/opt/homebrew/opt/coreutils/libexec/gnuman:$MANPATH"
alias ls="ls --color=always"

#Setup for Bliss dircolors (all platforms)
eval `dircolors ~/.oh-my-zsh/bliss-dircolors/bliss.dircolors`

#Disabled tracking of files under VCS to improve repo speeds
DISABLE_UNTRACKED_FILES_DIRTY="true"

#Plugins
plugins=(thefuck zsh-autosuggestions zsh-syntax-highlighting you-should-use zsh-history-substring-search dirhistory)

# Extra Plugins
# plugins = (auto-notify ufw docker git-prompt)

source $ZSH/oh-my-zsh.sh

#Environment Variables
export PATH="$PATH:$HOME/.spicetify"
