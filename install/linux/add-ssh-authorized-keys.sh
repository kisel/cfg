#!/bin/sh
#

mkdir -p $HOME/.ssh
if ! test -f $HOME/.ssh/authorized_keys ; then
# see also https://github.com/kisel.keys
tee $HOME/.ssh/authorized_keys  <<END
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCgOhFcu4hr4SbVhrkHxmVVuaFVGfdOXa2iGOA+SRwLcS0ZU4/xeitVxAi9vzaj2ZGQsMR6pHPt2WtC67XOxySLCInN9xIFdftsICIFpLx7OaN6+1YEe8mh7rNz1BshX+D0WqIge6uo1hatgzAVXeaxXonKUgV/v3Gm+XuPzrBRARjbMQdmWdri8RPP88ozmAAWijoIzWcU3ovgfn4wqpAnxFJJ3X9mWQZRCp92c8PeMFdQkUQIryv56vruo8rGebqHtXH7gAletqKVj12yaUVDMVY3BJmYnPn0rTYRj38G7P6kspGRSGAubglyaHMkApIYeh/0Yfu27L+KJjo1uLpT antonk
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMPqxob/Ql8L/T4v6J9+fU0I8SVm9T1ctiPj863c68d6 antonk

END

fi
#
