for function in ~/.zsh/functions/*; do
  source $function
done

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="aussiegeek"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(rbenv ruby gem git github osx pow bundler rails docker zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

unsetopt correct_all

setopt APPEND_HISTORY

# Load all files from .shell/bashrc.d directory
if [ -d $HOME/.zshrc.d ]; then
  for file in $HOME/.zshrc.d/*.sh; do
    source $file
  done
fi

PROMPT='$fg_bold[blue]@@ $fg[red]%~ $(git_prompt_info)$fg_bold[yellow]
>> '
ZSH_THEME_GIT_PROMPT_PREFIX="$fg_bold[green]["
ZSH_THEME_GIT_PROMPT_SUFFIX="$fg_bold[green]]"
ZSH_THEME_GIT_PROMPT_DIRTY="$fg_bold[red]ㄨ"
