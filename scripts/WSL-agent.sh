# ssh agent for bash on WSL

# Source this file from .bashrc (WSL only)
# test -f ~/scripts/WSL-agent.sh && . ~/scripts/WSL-agent.sh

# https://www.scivision.dev/ssh-agent-windows-linux/
# https://unix.stackexchange.com/questions/321193/windows-subsystem-for-linux-share-ssh-agent/378588#378588
if [ -z "$(pgrep ssh-agent)" ]; then
    rm -rf /tmp/ssh-*
    eval $(ssh-agent -s) > /dev/null
else
    export SSH_AGENT_PID=$(pgrep ssh-agent)
    export SSH_AUTH_SOCK=$(find /tmp/ssh-* -name agent.*)
fi

# optional... potentially annoying
#if [ "$(ssh-add -l)" == "The agent has no identities." ]; then
#    ssh-add -t 1h
#fi
