#!/bin/sh

find /app > /tmp/files
find /app -type d > /tmp/dirs

cap $@

find /app > /tmp/files.2
find /app -type d > /tmp/dirs.2

if [ -n "$GANTRY_UID" ] && [ -n "$GANTRY_GID" ]; then
    diff /tmp/files /tmp/files.2 | grep -E '^>' | sed 's/> //' | xargs chown $GANTRY_UID.$GANTRY_GID
    diff /tmp/dirs /tmp/dirs.2 | grep -E '^>' | sed 's/> //' | xargs chown $GANTRY_UID.$GANTRY_GID
fi