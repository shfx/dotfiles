# Envs
export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin"

pathadd () {
  if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
    PATH="$1${PATH:+":$PATH"}"
  fi
}

pathadd "/usr/local/sbin"
pathadd "/usr/local/bin"
pathadd "/usr/local/opt/ccache/libexec"
pathadd "$HOME/.local/bin/"
pathadd "$HOME/Library/Python/3.7/bin"
pathadd "$HOME/Projects/depot_tools"
pathadd "$HOME/.cargo/bin"

export PATH
