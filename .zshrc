# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/opera_user/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="imajes"
DEFAULT_USER=$USER

plugins=(git emacs ssh-agent brew colored-man-pages)

source $ZSH/oh-my-zsh.sh

# User configuration


OPERA_PATH="$HOME/Projects/work/"

export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/ccache/libexec:$PATH"
export PATH="$HOME/Projects/depot_tools:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/opt/X11/bin:$PATH"
export PATH="$HOME/.local/bin/:$PATH"
export PATH="$HOME/Library/Python/3.7/bin:$PATH"
export PATH="$HOME/Projects/depot_tools:$PATH"

export LANG="en_US.UTF-8"
export EDITOR="emacsclient"

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment

# Compilation flags
export GYP_DEFINES="component=shared_library target_arch=x64 dcheck_always_on=1"
export LDFLAGS="-L/usr/local/opt/libffi/lib:$LDFLAGS"
export PKG_CONFIG_PATH="/usr/local/opt/libffi/lib/pkgconfig:$PKG_CONFIG_PATH"

export ICECC_CLANG_REMOTE_CPP=1
export ICECC_SCHEDULER_HOST="10.40.135.27";
export ICECC_NETNAME=IceWro

export CCACHE_SLOPPINESS=time_macros,include_file_mtime,file_macro
export CCACHE_CPP2=yes
export CCACHE_MAXSIZE=20G # Optional, default is 5GB after full rebuild it takes around 17,5GB.
export CCACHE_PREFIX=icecc

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias gno="echo $CCACHE_PREFIX && $OPERA_PATH/desktop/gn_opera.py --ccache --release --force ffmpeg_use_atomics_fallback=true enable_precompiled_headers=false enable_pack_verification=false"
alias gng="gno  product=\\\"gx\\\""
alias gnoo="CCACHE_PREFIX=\"\" $OPERA_PATH/desktop/gn_opera.py --ccache --release --force ffmpeg_use_atomics_fallback=true enable_precompiled_headers=false enable_pack_verification=false"
alias gngg="gnoo  product=\\\"gx\\\""

function nj () {
    ICECC_VERSION=`/Users/opera_user/Projects/icecream-chromium-mac/geticeccversion.sh /Users/opera_user/Projects/work/chromium/src` \
    ninja -j70 -C $OPERA_PATH/chromium/src/out/Release opera
}

alias o="$OPERA_PATH/chromium/src/out/Release/Opera.app/Contents/MacOS/Opera --webui-debug-mode=live --disable-update --show-component-extension-options --show-component-extension-with-background-pages --user-data-dir=$HOME/Projects/clean-profile"

alias tt="npm start --prefix $OPERA_PATH/desktop/common/resources/shared/toolkit/"
alias up="git submodule update $OPERA_PATH/chromium/src"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# tabtab source for electron-forge package
# uninstall by removing these lines or running `tabtab uninstall electron-forge`
[[ -f /Users/opera_user/.config/yarn/global/node_modules/tabtab/.completions/electron-forge.zsh ]] && . /Users/opera_user/.config/yarn/global/node_modules/tabtab/.completions/electron-forge.zsh
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

alias config='/usr/bin/git --git-dir=/Users/opera_user/.dotfiles/ --work-tree=/Users/opera_user'

PURE_GIT_UNTRACKED_DIRTY=0
PURE_GIT_UNTRACKED_DIRTY=0

autoload -U promptinit; promptinit
prompt pure
