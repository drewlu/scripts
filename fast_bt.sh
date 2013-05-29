#!/bin/bash


pid=$1

if [ "x$pid" == "x" ]; then
    echo "Usage: $0 <pid>"
    exit 1
fi

cat <<EOF > /tmp/gdb.conf
set logging on
bt full
quit
EOF

sudo gdb --pid $pid -x /tmp/gdb.conf

