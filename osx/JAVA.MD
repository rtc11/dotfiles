## Install
```
$ brew install --cask temurin
$ brew install --cask temurin8
...
```

⚠️ AdoptOpenJDK deprecated
```
AdoptOpenJDK/openjdk is deprecated
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

## Add function to fish
```
function jdk
	export JAVA_HOME=(/usr/libexec/java_home -v$argv)
	java -version
end
```

Remember to save the function with `funcsave jdk`. Test it with `jdk 15`.


