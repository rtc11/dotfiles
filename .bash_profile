# ENVIRONMENT VARIABLES 
# ---------------------------------------------------

# KUBERNETES
export KUBECONFIG="/Users/robin/code/navikt/kubeconfigs/config"
export PATH="/usr/local/Cellar/kubernetes-cli@1.22/1.22.17/bin/:$PATH"
export PATH="/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/bin/:$PATH"

# RUST
export PATH="$HOME/.cargo/bin/:$PATH"
export GODOT4_BIN="/Users/robin/Applications/godot/"
export PATH="$GODOT4_BIN:$PATH"

# LLVM
#export PATH="/Users/robin/Applications/llvm/:$PATH"
export PATH="/usr/local/opt/llvm/bin:$PATH"

# JVM
export JAVA_HOME="/Library/Java/JavaVirtualMachines/temurin-21.jdk/Contents/Home"
export PATH="$JAVA_HOME/bin/:$PATH"
export KOTLIN_HOME="/usr/local/Cellar/kotlin/2.0.21"
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

# ALIAS
# -----------------------------------------------------
alias vim=nvim
alias ll='eza -l --no-permissions --no-user -s type -F --git --icons'
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

# change jvm version, e.g jdk 21 
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

# used if colima requires sudo
colima_reset() {
    sudo rm -f /etc/sudoers.d/colima
}

# opam configuration
test -r /Users/robin/.opam/opam-init/init.sh && . /Users/robin/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

# Starship prompt
eval "$(starship init bash)"

# fzf
eval "$(fzf --bash)"

export _ZO_ECHO=1

# zoxide
eval "$(zoxide init bash)"

