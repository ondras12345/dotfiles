# ssh agent for git bash

# Source this file from .bashrc (Windows only)
# test -f ~/scripts/git-bash-agent.sh && . ~/scripts/git-bash-agent.sh


# ssh-agent
# https://help.github.com/en/github/authenticating-to-github/working-with-ssh-key-passphrases#auto-launching-ssh-agent-on-git-for-windows
env=~/.ssh/agent.env

agent_load_env () { test -f "$env" && . "$env" >| /dev/null ; }

agent_start () {
    (umask 077; ssh-agent >| "$env")
    . "$env" >| /dev/null ; }

agent_load_env

# agent_run_state: 0=agent running w/ key; 1=agent w/o key; 2= agent not running
agent_run_state=$(ssh-add -l >| /dev/null 2>&1; echo $?)

if [ ! "$SSH_AUTH_SOCK" ] || [ $agent_run_state = 2 ]; then
    agent_start
    # TODO add using alias ssh=... ??
    #ssh-add -t 1h
#elif [ "$SSH_AUTH_SOCK" ] && [ $agent_run_state = 1 ]; then
#    ssh-add -t 1h
fi

unset env
