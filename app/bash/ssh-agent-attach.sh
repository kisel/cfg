#!/bin/sh

# finds latest ssh-agent from another ssh connection
# useful to get ssh-agent in mosh

# just find ssh socket and use local
ssh-agent-attach() {
    export SSH_AUTH_SOCK=$(ls -1t $(find /tmp/ssh-* -name 'agent.*' -type s -user $(id -ru)) | head -n 1)
    echo "export SSH_AUTH_SOCK=$SSH_AUTH_SOCK"
}

