# Defined interactively
function show-branch
git branch -vv | grep ': gone]' | grep -v "\*" | awk '{print $1}' | grep --color -E '$|master|main|$'
end
