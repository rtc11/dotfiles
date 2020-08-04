## Install
```
$ brew tap AdoptOpenJDK/openjdk
brew cask install adoptopenjdk14
brew cask install adoptopenjdk11
brew cask install adoptopenjdk8
```

## List installed
```
/usr/libexec/java_home -V
```

## Add script to `.zshrc` or `.bashrc`
```
jdk() {
        version=$1
        export JAVA_HOME=$(/usr/libexec/java_home -v"$version");
        java -version
 }
```

