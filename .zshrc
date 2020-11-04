# tmux <3
alias tmux="TERM=screen-256color-bce tmux"

# Kill vims
alias kl='killall -9 vim'

# Where do we keep the gems again?
alias gems='gem environment'

# Shit happens
alias gti='git'

# Bundle exec alias
alias be='bundle exec'

# Start foreman alias
alias bef='bundle exec foreman start'

# Start rails console alias
alias bec='bundle exec rails c'

# Start rails console alias
alias bec='bundle exec rails c'
alias nightwatch='./node_modules/.bin/nightwatch'

alias nd='open "rndebugger://set-debugger-loc?host=localhost&port=19001"'

alias deploy_stg='git push heroku-stg HEAD:master -f'
alias deploy_prod='git push heroku-prod master'

alias publish_staging='expo publish --release-channel staging'
alias publish_v1='expo publish --release-channel staging-v1'
alias publish_prod='expo publish --release-channel prod-v1'
alias build_ios='expo build:ios --release-channel staging-v1'
alias build_ios_prod='expo build:ios --release-channel prod-v1'
alias build_android='expo build:android --release-channel staging-v1'
alias build_android_prod='expo build:android --release-channel prod-v1'
alias build_ios_local='expo build:ios --release-channel localhost'
alias build_android_local='expo build:android --release-channel localhost'

click_ios() {
  xcrun simctl openurl booted "exp://127.0.0.1:19000/--/$1"
}

click_ios_expo() {
  xcrun simctl openurl booted "exp://exp.host/@community/with-webbrowser-redirect/--/$1"
}

click_android() {
  adb shell am start -a "android.intent.action.VIEW" -d "exp://192.168.0.20:19000/--/$1"
}

alias kill_spring="ps ax | grep spring | cut -f1 -d' ' | xargs kill"

alias start_docker="docker-sync-stack start"

# Common git push aliases
alias gpd='git push origin develop'
alias gpm='git push origin master'

# Open last migration in vim
alias mi='ls db/migrate/* | tail -n1 | xargs "vi"'

# Commit changelog
alias gclog='git commit -m "Updates the CHANGELOG" CHANGELOG.md'

# Set custom prompt
setopt PROMPT_SUBST
autoload -U promptinit
promptinit
prompt grb

# Initialize completion
autoload -U compinit
compinit

# Add paths
export PATH=/usr/local/sbin:/usr/local/bin:${PATH}
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/Library/Python/2.7/bin:$PATH"
export PATH="/usr/local/bin/vim:$PATH"

export ANDROID_SDK=/Users/myuser/Library/Android/sdk
export PATH=/Users/myuser/Library/Android/sdk:$PATH

# Colorize terminal
alias ls='ls -G'
alias ll='ls -lG'
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
export GREP_OPTIONS="--color"

# Nicer history
export HISTSIZE=100000
export HISTFILE="$HOME/.history"
export SAVEHIST=$HISTSIZE

# Use vim as the editor
export EDITOR=vi
# GNU Screen sets -o vi if EDITOR=vi, so we have to force it back.
set -o emacs

# Use C-x C-e to edit the current command line
# autoload -U edit-command-line
# zle -N edit-command-line
# bindkey '\C-x\C-e' edit-command-line

# By default, zsh considers many characters part of a word (e.g., _ and -).
# Narrow that down to allow easier skipping through words via M-f and M-b.
export WORDCHARS='*?[]~&;!$%^<>'

# Highlight search results in ack.
export ACK_COLOR_MATCH='red'
alias ag="ag --color-match 31"

# Aliases
t() {
    if [ -e script/test ]; then
        script/test $*
    else
        rspec --color spec
    fi
}
alias f="script/features $*"
alias z="zeus $*"
alias r="script/rails $*"
function lack() {
    # The +k clears the screen (it tries to scroll up but there's nowhere to
    # go)
    ack --group --color $* | less -r +k
}
function mcd() { mkdir -p $1 && cd $1 }
function cdf() { cd *$1*/ } # stolen from @topfunky
function das() {
    cd ~/proj/destroyallsoftware.com/destroyallsoftware.com
    pwd
    export RUBY_HEAP_MIN_SLOTS=1000000
    export RUBY_HEAP_SLOTS_INCREMENT=1000000
    export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
    export RUBY_GC_MALLOC_LIMIT=1000000000
    export RUBY_HEAP_FREE_MIN=500000
    . /Volumes/misc/filing/business/destroy\ all\ software\ llc/s3.sh
    . /Volumes/misc/filing/business/destroy\ all\ software\ llc/braintree.sh
}
alias v="view -"

# Activate the closest virtualenv by looking in parent directories.
activate_virtualenv() {
    if [ -f env/bin/activate ]; then . env/bin/activate;
    elif [ -f ../env/bin/activate ]; then . ../env/bin/activate;
    elif [ -f ../../env/bin/activate ]; then . ../../env/bin/activate;
    elif [ -f ../../../env/bin/activate ]; then . ../../../env/bin/activate;
    fi
}

# Find the directory of the named Python module.
python_module_dir () {
    echo "$(python -c "import os.path as _, ${1}; \
        print _.dirname(_.realpath(${1}.__file__[:-1]))"
        )"
}

# By @ieure; copied from https://gist.github.com/1474072
#
# It finds a file, looking up through parent directories until it finds one.
# Use it like this:
#
#   $ ls .tmux.conf
#   ls: .tmux.conf: No such file or directory
#
#   $ ls `up .tmux.conf`
#   /Users/grb/.tmux.conf
#
#   $ cat `up .tmux.conf`
#   set -g default-terminal "screen-256color"
#
function up()
{
    local DIR=$PWD
    local TARGET=$1
    while [ ! -e $DIR/$TARGET -a $DIR != "/" ]; do
        DIR=$(dirname $DIR)
    done
    test $DIR != "/" && echo $DIR/$TARGET
}

# Use vim on the prompt
bindkey -v

# Using rbenv
export PATH="$HOME/.rbenv/bin:$PATH"                                                                                                                                                                                 
eval "$(rbenv init -)"

# Fix git autocomplete
__git_files () {
  _wanted files expl 'local files' _files
}


export CURL_SSL_BACKEND=secure-transport
# https://github.com/Homebrew/brew/issues/6274#issuecomment-507937736
export HOMEBREW_NO_ENV_FILTERING=1

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"


export ANDROID_HOME="$HOME/Library/Android/Sdk"
export PATH="$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools:$PATH"
export PATH=$PATH:/Applications/MySQLWorkbench.app/Contents/MacOS
export PATH=./node_modules/.bin:$PATH

export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
