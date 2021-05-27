# Defined via `source`
function project --wraps='cd ~/project' --description 'alias project=cd ~/project'
  cd ~/project $argv; 
end
