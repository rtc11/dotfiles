## Install
```
brew cask install adoptopenjdk13
brew cask install adoptopenjdk11
brew cask install adoptopenjdk8
```

## List installed
```
/usr/libexec/java_home -V
```

## Switch between versions:
```
/usr/libexec/java_home -v 13
/usr/libexec/java_home -v 11
/usr/libexec/java_home -v 1.8
```

## Add as alias to `.zshrc`
```
export JAVA13=$(/usr/libexec/java_home -v 13)
export JAVA11=$(/usr/libexec/java_home -v 11)
export JAVA8=$(/usr/libexec/java_home -v 1.8)
alias java13='export JAVA_HOME=$JAVA13'
alias java11='export JAVA_HOME=$JAVA11'
alias java8='export JAVA_HOME=$JAVA8'
java13
export PATH=$JAVA_HOME:$PATH
```

