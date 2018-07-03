;= @echo off
;= rem Call DOSKEY and use this file as the macrofile
;= %SystemRoot%\system32\doskey /listsize=1000 /macrofile=%0%
;= rem In batch mode, jump to the end of the file
;= goto:eof
;= Add aliases below here

gl=git log --oneline --all --graph --decorate  $*
ls=ls --show-control-chars -F --color $*
clear=cls
history=cat "%CMDER_ROOT%\config\.history"
unalias=alias /d $1
vi=vim $*
cmderr=cd /d "%CMDER_ROOT%"

help=cat C:\Users\T147539\Desktop\notater.txt
scripts=ls C:\cmder\1.2.9\bin | xargs -n 1 basename | cut  -f 1 -d '.'
ll=ls --color -la

.=explorer .

saml=sh saml.sh $*
build=sh build.sh
deploy=sh deploy.sh $*
rest=sh rest.sh $*
fasit=sh rest.sh $*
test=sh test.sh $*
undeploy=sh undeploy.sh $*
mass-rename=sh mass-rename.sh $*
search=sh search.sh $*
fastdeploy=sh fastdeploy.sh $*
pwd=sh pwd.sh $*
remote=sh remote.sh $*
db=sh db.sh $*
jdbc=sh db.sh $*
ssh2=sh ssh2.sh $*
debugger=sh debugger.sh $*
sshkeygen=sh sshkeygen.sh $*
ssh-copy-id=ssh-copy-id.cmd
get_logger=sh get_logger.sh $*
exp=sh expect.sh $*
validate=sh validate.sh $*
log=sh log.sh $*
k=kubectl $*
token=sh token.sh $*
token-q=sh token-q.sh $*
token-t=sh token-t.sh $*
smoketest=sh smoketest.sh $*

freg=cd C:\FREG\
mfn=cd C:\projects\mfn
projects=cd C:\projects

j7='export JAVA_HOME=C:/apps/Java/jdk1.7.0_45'
j8='export JAVA_HOME="C:/Program Files/Java/jdk1.8.0_101"'
