# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH="/home/zayers/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git docker-compose docker node zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

#  NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# ZSH
alias zsh:config="code ~/.zshrc"
alias zsh:source="source ~/.zshrc"
alias zsh:backup="(cd ~ && git init && git remote add origin https://github.com/zjayers/zshrc && git add ~/.zshrc .gitignore && git commit -m 'update to zshconfig' && ggpush --force && rm -rf .git)"
alias ohmyzsh="code ~/.oh-my-zsh"

# Open API
alias oa3="openapi-generator-cli"

# Git Ignore
function gi() { curl -sLw n https://www.toptal.com/developers/gitignore/api/$@;}
