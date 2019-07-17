export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="imajes"
DEFAULT_USER=$USER

# Oh My Zsh Plugins
plugins=(git emacs ssh-agent brew colored-man-pages node)

source $ZSH/oh-my-zsh.sh


# Lang and editor
export LANG="en_US.UTF-8"
export EDITOR="emacsclient"

# Compilation flags
export GYP_DEFINES="component=shared_library target_arch=x64 dcheck_always_on=1"
export LDFLAGS="-L/usr/local/opt/libffi/lib:$LDFLAGS"
export PKG_CONFIG_PATH="/usr/local/opt/libffi/lib/pkgconfig:$PKG_CONFIG_PATH"

export ICECC_CLANG_REMOTE_CPP=1
export ICECC_SCHEDULER_HOST="10.40.135.27";
export ICECC_NETNAME=IceWro

export CCACHE_SLOPPINESS=time_macros,include_file_mtime,file_macro
export CCACHE_CPP2=yes
export CCACHE_MAXSIZE=40G
export CCACHE_PREFIX=icecc

# ssh
export SSH_KEY_PATH="$HOME/.ssh/rsa_id"

# Work dir
WORK_PATH="$HOME/Projects/work"
WORK_DEV_PATH="$HOME/Projects/work-dev"

alias stable="cd $WORK_PATH"
alias dev="cd $WORK_DEV_PATH"

function gnn () {
    CCACHE_PREFIX=""
    
    if [[ "$PWD" = "$WORK_PATH" ]]; then
        echo "GN STABLE"
        desktop/gn_opera.py --ccache --release --force ffmpeg_use_atomics_fallback=true enable_precompiled_headers=false enable_pack_verification=false
        
    elif [[ "$PWD" = "$WORK_DEV_PATH" ]]; then
        echo "GN DEV"
        desktop/gn_opera.py --ccache --release --force ffmpeg_use_atomics_fallback=true enable_precompiled_headers=false enable_pack_verification=false product=\"gx\"
        
    else
        echo "wrong directory"
    fi
}

function nj () {
    export ICECC_VERSION=`$HOME/Projects/icecream-chromium-mac/geticeccversion.sh $HOME/Projects/work/chromium/src`
    
    if [[ "$PWD" = "$WORK_PATH" ]]; then
        echo "Building STABLE branch"
        ninja -C $WORK_PATH/chromium/src/out/Release opera
        
    elif [[ "$PWD" = "$WORK_DEV_PATH" ]]; then
        echo "Building DEV branch"
        ninja -C $WORK_DEV_PATH/chromium/src/out/Release opera
    else
        echo "wrong directory"
    fi
}

function o () {
    if [[ "$PWD" = "$WORK_PATH" ]]; then
        $WORK_PATH/chromium/src/out/Release/Opera.app/Contents/MacOS/Opera --webui-debug-mode=live --disable-update --show-component-extension-options --show-component-extension-with-background-pages --user-data-dir=$HOME/Projects/clean-profile
        
    elif [[ "$PWD" = "$WORK_DEV_PATH" ]]; then
        $WORK_DEV_PATH/chromium/src/out/Release/Opera.app/Contents/MacOS/Opera --webui-debug-mode=live --disable-update --show-component-extension-options --show-component-extension-with-background-pages --user-data-dir=$HOME/Projects/clean-profile
        
    else
        echo "wrong directory"
    fi
}

alias tt="npm start --prefix $WORK_PATH/desktop/common/resources/shared/toolkit/"
alias up="git submodule update $WORK_PATH/chromium/src"
alias config='/usr/bin/git --git-dir=/Users/opera_user/.dotfiles/ --work-tree=/Users/opera_user'

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# tabtab source for electron-forge package
# uninstall by removing these lines or running `tabtab uninstall electron-forge`
[[ -f /Users/opera_user/.config/yarn/global/node_modules/tabtab/.completions/electron-forge.zsh ]] && . /Users/opera_user/.config/yarn/global/node_modules/tabtab/.completions/electron-forge.zsh
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

PURE_GIT_UNTRACKED_DIRTY=0
PURE_GIT_UNTRACKED_DIRTY=0

autoload -U promptinit; promptinit
prompt pure

neofetch
