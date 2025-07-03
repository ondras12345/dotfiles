# ssh agent for bash on WSL

# Source this file from .bashrc (WSL only)
# test -f ~/scripts/WSL-agent.sh && . ~/scripts/WSL-agent.sh

# https://www.scivision.dev/ssh-agent-windows-linux/
# https://unix.stackexchange.com/questions/321193/windows-subsystem-for-linux-share-ssh-agent/378588#378588
ssh_agent_pid="$(pgrep ssh-agent | head -n 1)"
if [ -z "$ssh_agent_pid" ] ; then
    rm -rf /tmp/ssh-*(N)
    eval $(ssh-agent -s) > /dev/null
else
    export SSH_AGENT_PID="$ssh_agent_pid"
    export SSH_AUTH_SOCK=$(find /tmp/ssh-*(N) -name agent.* | head -n 1)
fi

# optional... potentially annoying
#if [ "$(ssh-add -l)" == "The agent has no identities." ]; then
#    ssh-add -t 1h
#fi
