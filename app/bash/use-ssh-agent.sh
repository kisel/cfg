#!/bin/sh
# script to reuse ssh agent from .profile if there is no system service
#

if [ -z "$SSH_AUTH_SOCK" ] ; then

    LOCAL_SSHAGENT="/tmp/ssh-agent-$(id -un).sh"

    if [ ! -e "$SSH_AUTH_SOCK" ] && [ -f $LOCAL_SSHAGENT ] ; then
        . $LOCAL_SSHAGENT
    fi

    if [ ! -e "$SSH_AUTH_SOCK" ] || [ ! -e "/proc/$SSH_AGENT_PID/" ] ; then
        echo "Running new ssh-agent"
        ssh-agent > $LOCAL_SSHAGENT
        . $LOCAL_SSHAGENT
    fi

fi

