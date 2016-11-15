# DNS
alias flushdns="sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder;"

# SSH key
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | printf '=> Public key copied to pasteboard.\n'"

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias myip="ifconfig | grep 'inet ' | grep -v 127.0.0.1 | awk '{print \$2}'"

# Useful when Rails doesn't give the port back.
# => killport 3000
killport() { lsof -ti:$1 | xargs kill }

# Project directories
p() { cd ~/Projects/$1; }
compctl -W ~/Projects/ -/ p

s() { cd ~/Sites/$1; }
compctl -W ~/Sites/ -/ s

desk() { cd ~/Desktop/$1; }
compctl -W ~/Desktop/ -/ desk

# Misc
alias jsnuke="npm cache clean && bower cache clean && rm -rf node_modules bower_components dist tmp && npm install && bower install"
alias pgapp="'/Applications/Postgres.app/Contents/Versions/9.5/bin'/psql"
