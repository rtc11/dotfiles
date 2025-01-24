# Infinite bash history (ctrl+r)
export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T] "
export HISTFILE=~/.bash_eternal_history
PROMPT_COMMAND="history -a; $PROMTP_COMMAND"

# Custom scripts
export PATH="$HOME/code/sh/bin/:$PATH"

# KUBERNETES
export KUBECONFIG="/Users/robin/code/navikt/kubeconfigs/config"
export PATH="/usr/local/Cellar/kubernetes-cli@1.22/1.22.17/bin/:$PATH"
export PATH="/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/bin/:$PATH"
export USE_GKE_GCLOUD_AUTH_PLUGIN=True

# RUST
export PATH="$HOME/.cargo/bin/:$PATH"
export GODOT4_BIN="/Users/robin/Applications/godot/"
export PATH="$GODOT4_BIN:$PATH"

# C3
export PATH="$HOME/code/c3/c3c/build/:$PATH"
export PATH="$HOME/code/go/c3-lsp/server/bin:$PATH"

# LLVM
#export PATH="/Users/robin/Applications/llvm/:$PATH"
export PATH="/usr/local/opt/llvm/bin:$PATH"

# JVM
export JAVA_HOME="/Library/Java/JavaVirtualMachines/temurin-21.jdk/Contents/Home"
export PATH="$JAVA_HOME/bin/:$PATH"
export KOTLIN_HOME="/usr/local/Cellar/kotlin/2.1.0"
export PATH="$KOTLIN_HOME/bin/:$PATH"

# POSTGRES
export PATH="/usr/local/opt/libpq/bin/:$PATH"

# COLIMA
export DOCKER_HOST="unix://${HOME}/.colima/docker.sock"
export TESTCONTAINERS_DOCKER_SOCKET_OVERRIDE="/var/run/docker.sock"

# OPS / NanoVM
export OPS_DIR="$HOME/.ops"
export PATH="$HOME/.ops/bin:$PATH"
# "$HOME/.ops/scripts/bash_completion.sh"

# GPG
export GPG_TTY=(tty)

# MISC
#export PATH="/usr/local/opt/binutils/bin/:$PATH"

# BUILDK
export PATH="/Users/robin/code/rust/buildk/target/release/:$PATH"

# EZA
export EZA_CONFIG_DIR="$HOME/.config/eza/theme.yml"
unset LS_COLORS
unset EZA_COLORS

# ALIAS
# -----------------------------------------------------
# alias jo='$HOME/code/c3/c3junitout/main $@'
alias vim=nvim
# alias test='sh test.sh "$@"'
alias ideaformat='sh "/Users/robin/Applications/IntelliJ IDEA Ultimate.app/Contents/bin/format.sh" "$@"'
alias ideahello='sh "/Users/robin/Applications/IntelliJ IDEA Ultimate.app/Contents/bin/hello.sh" "$@"'
alias ll='eza -la --no-permissions --no-user -s type -F --git --icons'
alias lla='eza -la --no-permissions --no-user -s type -F --git'
alias la='eza -la --no-permissions --no-user -s type -F --git'
alias l='eza -aF'
alias ls='eza -F'
alias find='fd "$@"'
alias k='kubectl "$@"'
alias g='./gradlew "$@"'
alias b='buildk "$@"'
alias cd='z "$@"'
alias icat='kitten icat $@'

# FUNCTIONS
# -----------------------------------------------------

jdk() {
  if [ $# -eq 0 ] ; then
    echo "Available versions:";
    /usr/libexec/java_home -V
    echo "Current version:";
    java --version
  else
    export JAVA_HOME=$(/usr/libexec/java_home -v"$@");
    java --version
  fi
}

colima_reset() {
    sudo rm -f /etc/sudoers.d/colima
}

# opam configuration
# test -r /Users/robin/.opam/opam-init/init.sh && . /Users/robin/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

# Starship prompt
eval "$(starship init bash)"

# fzf
eval "$(fzf --bash)"
export FZF_DEFAULT_COMMAND='rg --files'
export FZF_DEFAULT_OPTS='-m --height 50% --border --bind ctrl-a:select-all,ctrl-d:deselect-all'

export _ZO_ECHO=1

# zoxide
eval "$(zoxide init bash)"

# bash-completion
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

# >>> coursier install directory >>>
export PATH="$PATH:/Users/robin/Library/Application Support/Coursier/bin"
# <<< coursier install directory <<<

