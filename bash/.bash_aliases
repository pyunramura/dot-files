## GENERAL ##
alias mkdir='mkdir -pv'
alias lnano='/usr/bin/nano'
alias nano='nano -lEWexDc -T 2'
alias lano='/bin/nano'
alias vim='nvim'
alias svim='sudo nvim'
alias unzip='7zr x'
alias lsblk-m='lsblk -o NAME,TYPE,FSTYPE,SIZE,MODEL,LABEL,UUID,MOUNTPOINT,STATE'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -vI --preserve-root'
alias ls='ls -hN --color=auto --time-style=long-iso --group-directories-first'
alias ln='ln -iv'
alias grep='grep --color=auto'
alias diff='diff --color=auto'
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias back='cd $OLDPWD'
alias c='clear'
alias cd..='cd ..'
alias e='vim -O'
alias E='vim -o'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'
alias wget='wget -c'
alias j='jobs -l'
alias h='history'
alias install='sudo apt-get install'
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'

## CUSTOM ##
alias fuck='sudo $(history -p !!)'
alias gauth='genauth'
alias genauth='echo "user: $(tr -dc 'a-zA-Z' < /dev/urandom | dd bs=4 count=2 2>/dev/null)"; echo "p_16: $(tr -dc "\&\_a-zA-Z0-9\^\*\@" < /dev/urandom | dd bs=4 count=4 2>/dev/null)"; echo "p_24: $(tr -dc "\&\_a-zA-Z0-9\^\*\@" < /dev/urandom | dd bs=4 count=6 2>/dev/null)"'
alias nsh='nscript'
alias nscript='echo -e "#!/usr/bin/env bash\n#set -Eeuxo pipefail\nset -e" >'

## PROGRAM SPECIFIC ##
#alias dr='docker'
#alias dcu='docker-compose up -d'
#alias dcd='docker-compose down'
# alias kc='kubectl'
# alias kca='kubectl apply -f'
# alias kcd='kubectl delete -f'
# alias seal='kubeseal --controller-name sealed-secrets'
alias chalias='ealias'
alias ealias='$EDITOR ~/.bash_aliases'
