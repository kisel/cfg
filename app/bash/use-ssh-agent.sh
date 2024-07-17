#!/bin/sh
# script to reuse ssh agent from .profile if there is no system service

AGENTFILE="/tmp/ssh-agent-$(id -un).sh"

if [ -f $AGENTFILE ] ; then
    . $AGENTFILE
fi

if [ ! -e "$SSH_AUTH_SOCK" ] || [ ! -e "/proc/$SSH_AGENT_PID/exename" ] ; then
    # can also check /proc/$SSH_AGENT_PID/exename = /usr/bin/ssh-agent
    echo "Running new agent"
    ssh-agent | grep -v echo > $AGENTFILE
    . $AGENTFILE
fi

