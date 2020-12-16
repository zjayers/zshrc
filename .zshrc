#If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="powerlevel10k/powerlevel10k"
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
#ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git yarn sudo python pylint pyenv pipenv pip osx node docker ng meteor kubectl heroku gulp grunt golang github flutter docker-compose)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Autosuggestions - Syntax Highlighting
source /Users/ayers/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

#  ITerm2
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# ZSH
alias zsh:config="code ~/.zshrc"
alias zsh:source="source ~/.zshrc"
alias zsh:backup="(cd ~ && git init && git remote add origin https://github.com/zjayers/zshrc && git add ~/.zshrc .gitignore && git commit -m 'update to zshconfig' && ggpush --force && rm -rf .git)"
alias ohmyzsh="code ~/.oh-my-zsh"

#  C#
alias scriptcs="mono /Users/ayers/scriptcs/src/ScriptCs/bin/Release/net461/
scriptcs.exe"
alias ef="dotnet ef"

#  Kubernetes
alias k="kubectl"

#  NestJS
alias ns="nest"

# Meteor
alias mnpm="meteor npm"

# Rabbit MQ
alias rabbitmq:manage="docker exec rabbitmq bin/bash -c 'rabbitmq-plugins enable rabbitmq_management'"
alias rabbitmq:unmanage="docker exec rabbitmq bin/bash -c 'rabbitmq-plugins disable rabbitmq_management'"
alias rabbitmq:stop_app="docker exec rabbitmq bin/bash -c 'rabbitmqctl stop_app'"
alias rabbitmq:start_app="docker exec rabbitmq bin/bash -c 'rabbitmqctl start_app'"
alias rabbitmq:restart="docker exec rabbitmq bin/bash -c 'rabbitmqctl stop_app; rabbitmqctl start_app;'"
alias rabbitmq:reset="docker exec rabbitmq bin/bash -c 'rabbitmqctl stop_app; rabbitmqctl reset; rabbitmqctl start_app;'"

# Docker
alias start:docker="open -a Docker"
alias docker:prune="docker system prune"
alias docker:clean="docker rm -f $(docker ps -a -q); docker rmi $(docker images -q)"

# Create Database Containers
alias run:mongo="docker run --name mongo -p 27017:27017 -d mongo:latest;"
alias run:mysql="docker run -p 3306:3306 --name  mysql -e MYSQL_ROOT_PASSWORD=0okmNJI9 -d mysql:latest; "
alias run:postgres="docker run --name postgres -e POSTGRES_PASSWORD=0okmNJI9 -p 5432:5432 -d postgres:latest"
alias run:sqlserver="docker run --name sqlServer -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=0okmNJI9' -p 1433:1433 -d mcr.microsoft.com/mssql/server:latest"
alias run:redis="docker run --name redis -p 6379:6379 -d redis:latest"
alias run:rabbitmq="docker run --hostname rabbitmq-host --name rabbitmq -p 5672:5672 -p 15672:15672 -e RABBITMQ_DEFAULT_USER=user -e RABBITMQ_DEFAULT_PASS=0okmNJI9 rabbitmq:latest"
alias run:nginx="docker run --name nginx -d -p 8080:80 nginx:latest"

# Setup Container Environment
alias setup:mongo="docker exec mongo bin/bash -c 'apt-get update; apt-get install -y zsh; apt-get install -y wget; apt-get install -y git; wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true;'"
alias setup:mysql="docker exec mysql bin/bash -c 'apt-get update; apt-get install -y zsh; apt-get install -y wget; apt-get install -y git; wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true;'"
alias setup:postgres="docker exec postgres bin/bash -c 'apt-get update; apt-get install -y zsh; apt-get install -y wget; apt-get install -y git; wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true;'"
alias setup:sqlserver="docker exec sqlserver bin/bash -c 'apt-get update; apt-get install -y zsh; apt-get install -y wget; apt-get install -y git; wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true;'"
alias setup:redis="docker exec redis bin/bash -c 'apt-get update; apt-get install -y zsh; apt-get install -y wget; apt-get install -y git; wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true;'"
alias setup:rabbitmq="docker exec rabbitmq bin/bash -c 'apt-get update; apt-get install -y zsh; apt-get install -y wget; apt-get install -y git; wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true;'"
alias setup:nginx="docker exec nginx bin/bash -c 'apt-get update; apt-get install -y zsh; apt-get install -y wget; apt-get install -y git; wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true;'"

# Container Installs
alias install:mongo="echo '---- Pulling image'; run:mongo; echo '---- Installing ZSH'; setup:mongo; echo '---- Executing ZSH in container'; exec:mongo;"
alias install:mysql="echo '---- Pulling image'; run:mysql; echo '---- Installing ZSH'; setup:mysql; echo '---- Executing ZSH in container'; exec:mysql;"
alias install:postgres="echo '---- Pulling image'; run:postgres; echo '---- Installing ZSH'; setup:postgres; echo '---- Executing ZSH in container'; exec:postgres;"
alias install:sqlserver="echo '---- Pulling image'; run:sqlServer; echo '---- Installing ZSH'; setup:sqlServer; echo '---- Executing ZSH in container'; exec:sqlServer;"
alias install:redis="echo '---- Pulling image'; run:redis; echo '---- Installing ZSH'; setup:redis; echo '---- Executing ZSH in container'; exec:redis;"
alias install:rabbitmq="echo '---- Pulling image'; run:rabbitmq; echo '---- Installing ZSH'; setup:rabbitmq; echo '---- Executing ZSH in container'; exec:rabbitmq;"
alias install:nginx="echo '---- Pulling image'; run:nginx; echo '---- Installing ZSH'; setup:nginx; echo '---- Executing ZSH in container'; exec:nginx;"

# Start Database Containers
alias start:mongo="docker start mongo"
alias start:mysql="docker start mysql"
alias start:postgres="docker start postgres"
alias start:sqlserver="docker start sqlserver"
alias start:redis="docker start redis"
alias start:rabbitmq="docker start rabbitmq"
alias start:nginx="docker start nginx"

# Stop Database Containers
alias stop:mongo="docker stop mongo"
alias stop:mysql="docker stop mysql"
alias stop:postgres="docker stop postgres"
alias stop:sqlserver="docker stop sqlserver"
alias stop:redis="docker stop redis"
alias stop:rabbitmq="docker stop rabbitmq"
alias stop:nginx="docker stop nginx"

# Exec Bash in Database Containers
alias exec:mongo="docker exec -it mongo bin/zsh"
alias exec:mysql="docker exec -it mysql bin/zsh"
alias exec:postgres="docker exec -it postgres bin/zsh"
alias exec:sqlserver="docker exec -it sqlServer bin/zsh"
alias exec:redis="docker exec -it redis bin/zsh"
alias exec:rabbitmq="docker exec -it rabbitmq bin/zsh"
alias exec:nginx="docker exec -it nginx bin/zsh"

# Navigation
alias goto:htdocs="cd ~/../../Applications/MAMP/htdocs"
alias goto:workspace="cd ~/workspace"

# Bootstrappers

alias new:react="yarn create react-app"
alias new:angular="ng new"
alias new:vue="vue create"
alias new:next="yarn create next-app"
alias new:nest="nest new"
alias new:nuxt="yarn create-nuxt-app"
alias new:electron="yarn create electron-app"
alias new:pal="pal c"
alias new:native:react="expo init"
alias new:native:vue="vue-native init"
alias new:truffle:react="truffle unbox react"
alias new:truffle:drizzle="truffle unbox drizzle"
alias new:spring="springboot init --groupId=io.ayers --name=application --description=..."

# Installs
alias install:brew='/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'

alias install:nvm="curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.0/install.sh | bash"

alias install:rvm="\curl -sSL https://get.rvm.io | bash"

alias install:spring="brew tap pivotal/tap && brew install springboot && mv /usr/local/bin/spring /usr/local/bin/springboot"
alias install:maven="brew install maven"
alias install:jenv="brew install jenv"

alias install:skaffold="brew install skaffold"

alias install:git="brew install git && brew install gh"

install:brews() {
  install:jenv
  insall:skaffold
  install:spring
  install:maven
  install:git
}

alias install:globals="npm install -g @angular/cli @nestjs/cli @paljs/cli @vue/cli eslint expo-cli ganache-cli gatsby-cli pm2 prettier rimraf solhint stylelint truffle ts-node typescript vercel vue-native-cli cli-real-favicon @openapitools/openapi-generator-cli commitizen generate generate-license generate-readme"

git:create() {
  CURRENT=$(pwd)
  BASENAME=$(basename ${CURRENT} | tr _ .)
  TITLE=$(basename $PWD | tr . " " | python3 -c "import sys; print(sys.stdin.read().title())")
  FILEDATA=.gitignore
  LICENSE=license
  README=README.md
  ERRORDATA="${RED}GITIGNORE does not exist in your project's root directory. Please create one before running ${CYAN}git:create${NOCOLOR}"
  READMECONTENT="# ${TITLE}
[![GitHub Release](https://img.shields.io/github/release/zjayers/${BASENAME}.svg?style=flat)](https://github.com/zjayers/${BASENAME}/releases)
[![GitHub pull requests](https://img.shields.io/github/issues-pr/zjayers/${BASENAME}.svg?style=flat)](https://github.com/zjayers/${BASENAME}/pulls)
[![Issues](https://img.shields.io/github/issues-raw/zjayers/${BASENAME}.svg?maxAge=25000)](https://github.com/zjayers/${BASENAME}/issues)

## Description

> Work in progress

## Features

> Work in progress

## Installation

> Work in progress

## Usage

> Work in progress"

  if [ ! -f "${README}" ]; then
    touch README.md
    echo ${READMECONTENT} >>README.md
  fi

  if [ ! -f "${LICENSE}" ]; then
    gen license:gpl-3.0
  fi

  if [ ! -f "${FILEDATA}" ]; then
    echo ${ERRORDATA}
  else
    git init
    git add .
    git commit -m 'feat: initial commit'
    gh repo create ${BASENAME} --public --confirm
    git push origin main
  fi
}

# Git Ignore
function gi() { curl -sLw n https://www.toptal.com/developers/gitignore/api/$@; }

function git:all() {
  GHUSER=zjayers
  curl "https://api.github.com/users/$GHUSER/repos?per_page=100&page=1" | grep -o 'git@[^"]*' | xargs -L1 git clone
  curl "https://api.github.com/users/$GHUSER/repos?per_page=100&page=2" | grep -o 'git@[^"]*' | xargs -L1 git clone
  curl "https://api.github.com/users/$GHUSER/repos?per_page=100&page=3" | grep -o 'git@[^"]*' | xargs -L1 git clone
  curl "https://api.github.com/users/$GHUSER/repos?per_page=100&page=4" | grep -o 'git@[^"]*' | xargs -L1 git clone
}

alias commit="git cz"

alias git:license="gen license:gpl-3.0"

git:readme() {

  CURRENT=$(pwd)
  BASENAME=$(basename ${CURRENT} | tr _ .)
  TITLE=$(basename $PWD | tr . " " | python3 -c "import sys; print(sys.stdin.read().title())")
  README=README.md
  READMECONTENT="# ${TITLE}
[![GitHub Release](https://img.shields.io/github/release/zjayers/${BASENAME}.svg?style=flat)](https://github.com/zjayers/${BASENAME}/releases)
[![GitHub pull requests](https://img.shields.io/github/issues-pr/zjayers/${BASENAME}.svg?style=flat)](https://github.com/zjayers/${BASENAME}/pulls)
[![Issues](https://img.shields.io/github/issues-raw/zjayers/${BASENAME}.svg?maxAge=25000)](https://github.com/zjayers/${BASENAME}/issues)

## Description

> Work in progress

## Features

> Work in progress

## Installation

> Work in progress

## Usage

> Work in progress"

  if [ ! -f "${README}" ]; then
    touch README.md
    echo ${READMECONTENT} >>README.md
  fi
}

#  Favicon Generator
alias favicon="real-favicon"

# Open API
alias oa3="openapi-generator-cli"

function favicon:init() {

  FILE=./public/logo.svg

  if [ ! -f "$FILE" ]; then
    echo "${RED}File: '${FILE}' does not exist in your project. Please create the file before running ${CYAN}favicon:init${NOCOLOR}"
  else

    rm -f favicon.json
    touch favicon.json

    echo "{\"masterPicture\": \"${FILE}\",
  \"iconsPath\": \"/\",
  \"design\": {
    \"ios\": {
      \"pictureAspect\": \"backgroundAndMargin\",
      \"backgroundColor\": \"#ffffff\",
      \"margin\": \"14%\",
      \"assets\": {
        \"ios6AndPriorIcons\": false,
        \"ios7AndLaterIcons\": false,
        \"precomposedIcons\": false,
        \"declareOnlyDefaultIcon\": true
      }
    },
    \"desktopBrowser\": {
      \"design\": \"background\",
      \"backgroundColor\": \"#ffffff\",
      \"backgroundRadius\": 1,
      \"imageScale\": 0.9
    },
    \"windows\": {
      \"pictureAspect\": \"whiteSilhouette\",
      \"backgroundColor\": \"#da532c\",
      \"onConflict\": \"override\",
      \"assets\": {
        \"windows80Ie10Tile\": false,
        \"windows10Ie11EdgeTiles\": {
          \"small\": false,
          \"medium\": true,
          \"big\": false,
          \"rectangle\": false
        }
      }
    },
    \"androidChrome\": {
      \"pictureAspect\": \"shadow\",
      \"themeColor\": \"#ffffff\",
      \"manifest\": {
        \"display\": \"standalone\",
        \"orientation\": \"notSet\",
        \"onConflict\": \"override\",
        \"declared\": true
      },
      \"assets\": {
        \"legacyIcon\": false,
        \"lowResolutionIcons\": false
      }
    },
    \"safariPinnedTab\": {
      \"pictureAspect\": \"silhouette\",
      \"themeColor\": \"#5bbad5\"
    }
  },
  \"settings\": {
    \"scalingAlgorithm\": \"Mitchell\",
    \"errorOnImageTooSmall\": false,
    \"readmeFile\": false,
    \"htmlCodeFile\": false,
    \"usePathAsIs\": false
  }
        }" >>favicon.json

  fi
}

function favicon:generate() {

  GREEN='\033[0;32m'
  CYAN='\033[0;36m'
  NOCOLOR='\033[0m'
  RED='\033[0;31m'
  FILEDATA=favicon-data.json
  FILE=favicon.json
  LOGO=./public/logo.svg
  ICONPATH=./public/icons
  HTMLPATH=./public/html
  HTMLTEMPLATE=./public/html/index.html
  OLDFAVICONPATH=./public/favicon.ico
  NEWFAVICONPATH=./public/icons/favicon.ico

  HTMLSNIPPET='<!doctype html>
<html lang="en">
  <head>
  </head>
  <body>
  </body>
</html>'

  ERROR="${RED}File: '${FILE}' does not exist in your projects root directory. Please run ${CYAN}favicon:init${RED} before running ${CYAN}favicon:create${NOCOLOR}"
  ERRORDATA="${RED}File: '${FILEDATA}' does not exist in your projects root directory. Please try running ${CYAN}favicon:create${RED} again${NOCOLOR}"
  STEP1="${CYAN}Step 1 of 5 - Making directories${NOCOLOR}"
  STEP2="${CYAN}Step 2 of 5 - Generating Favicon data - This may take awhile${NOCOLOR}"
  STEP3="${CYAN}Step 3 of 5 - Creating html snippets${NOCOLOR}"
  STEP4="${CYAN}Step 4 of 5 - Checking for updates${NOCOLOR}"
  STEP5="${CYAN}Step 5 of 5 - Cleaning up${NOCOLOR}"
  COMPLETE="${GREEN}Complete! - See /public/html/index.html for the correct import snippets to add to your html files.${NOCOLOR}"

  if [ ! -f "${FILE}" ]; then
    echo ${ERROR}
  else
    echo ${STEP1}
    rm -rf ${ICONPATH}
    rm -rf ${HTMLPATH}
    mkdir ${ICONPATH}

    echo ${STEP2}
    real-favicon generate ${FILE} ${FILEDATA} ${ICONPATH}

    echo ${STEP3}

    if [ ! -f "${FILEDATA}" ]; then
      echo ${ERRORDATA}
    else
      mkdir ${HTMLPATH}
      touch ${HTMLTEMPLATE}
      echo ${HTMLSNIPPET} >>${HTMLTEMPLATE}
      real-favicon inject ${FILEDATA} ${HTMLPATH} ${HTMLTEMPLATE}

      echo ${STEP4}
      real-favicon check-for-update --fail-on-update ${FILEDATA}

      echo ${STEP5}
      rm -f ${OLDFAVICONPATH}

      sed -i '' 's/href="/href="..\/icons/g' ${HTMLTEMPLATE}
      sed -i '' 's/\/mstile/..\/icons\/mstile/g' ${HTMLTEMPLATE}

      echo ${COMPLETE}
    fi
  fi
}

# PNG to ICO
function png2ico() {
  local i="${1}" o="${2:-${1:r}.ico}" s="${png2ico_size:-256}"
  convert -resize x${s} -gravity center -crop ${s}x${s}+0+0 "$i" -flatten -colors 256 -background transparent "$o"
}

# Flutter
export PATH="$PATH:$HOME/flutter/bin"

#  NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

#  PHP Composer
export PATH="$PATH:$HOME/.composer/vendor/bin"

# JENV
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
PATH="$GEM_HOME/bin:$HOME/.rvm/bin:$PATH" # Add RVM to PATH for scripting
[ -s ${HOME}/.rvm/scripts/rvm ] && source ${HOME}/.rvm/scripts/rvm
