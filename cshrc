################################################################################
#                       1. Common Configuration of
################################################################################
umask 022
set filec
# set prompt="`whoami`:`pwd`/ "
set prompt="%h%%[$cwd] > "

set path = (/usr/local/bin/Typora-linux-x64 $path)


################################################################################
#                       2. Completation Enhance
################################################################################
if($?prompt) then
    set autolist
    set complete=enhance
    set autoexpand
endif



################################################################################
#                       3. Person Alias
################################################################################
# alias cd 'cd \!*;set prompt="`whoami`:`pwd`/ ";ls'
alias cd 'cd \!*;set prompt="%h%%[$cwd] > ";ls'
alias lt 'ls -lrt'
alias v vim
alias g gvim
alias rm 'rm -i'
alias . pwd
alias .. 'cd ..'
alias pdle '/usr/local/bin/python3/bin/idle3'
