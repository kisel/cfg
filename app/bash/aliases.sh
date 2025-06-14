alias ssha='ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null'
alias scpa='scp -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null'

alias lsblks="lsblk -o name,size,fstype,label,partlabel"
alias lsblksm="lsblk -o name,size,fstype,label,partlabel,mountpoints"

# basic aliases. may be overridden later if needed
alias g="git"
alias k="kubectl"
alias l="ls -al"
alias v="vim"

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


