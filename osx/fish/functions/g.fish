# Defined via `source`
function g --wraps=./gradlew --description 'alias g=./gradlew'
  ./gradlew $argv; 
end
