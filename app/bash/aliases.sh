alias ssha='ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null'
alias scpa='scp -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null'

# mkdircd <taget>
# mkdirp + cd
mkdircd() {
	mkdir -p "$1"
	cd "$1"
}

# wstmp [prefix name]
# shortcut to create a temporary dir for experiments
# in /tmp/$prefix-$timestamp
wstmp() {
	mkdircd ${TMP:-/tmp}/${1:-tmp}-$(date +%s)
}


