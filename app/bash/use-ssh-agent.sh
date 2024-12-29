#!/bin/sh
# script to reuse ssh agent from .profile if there is no system service

AGENTFILE="/tmp/ssh-agent-$(id -un).sh"

if [ -f $AGENTFILE ] ; then
    . $AGENTFILE
fi

if [ ! -e "$SSH_AUTH_SOCK" ] || [ ! -e "/proc/$SSH_AGENT_PID/" ] ; then
    echo "Running new ssh-agent"
    ssh-agent | grep -v echo > $AGENTFILE
    . $AGENTFILE
fi

