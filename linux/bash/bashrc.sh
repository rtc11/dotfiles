# install: ~/.bashrc

# Paths 
export ANDROID_HOME="/opt/android-sdk"
export ANDROID_TOOLS="/opt/android-sdk/tools"
export ANDROID_PLATFORM_TOOLS="/opt/android-sdk/platform-tools"
export JAVA_HOME="/opt/java/jdk1.8.0_20"
export ANT_HOME="/opt/ant/ant-1.9.4"
PATH=$PATH:$ANDROID_HOME:$ANDROID_TOOLS:$ANDROID_PLATFORM_TOOLS:$JAVA_HOME:$ANT_HOME

bind "set completion-ignore-case on"

# Ignore case on file/folder traversion
bind "set completion-ignore-case on"

# set PATH so it includes users private scripts folder
if [ -d "$HOME/scripts" ] ; then
  PATH=$PATH:$HOME/scripts
fi

# load aliases
if [ -f "$HOME/.bash_aliases" ]; then
. "$HOME/.bash_aliases"
fi

# load utils
if [ -f "$HOME/.bash_utils" ]; then
. "$HOME/.bash_utils"
fi
