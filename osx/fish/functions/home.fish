# Defined via `source`
function home --wraps='cd ~/' --description 'alias home=cd ~/'
  cd ~/ $argv; 
end
