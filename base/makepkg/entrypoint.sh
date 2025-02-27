#!/usr/bin/env bash

chown paru:paru -R .

sudo -u paru paru --noconfirm -B .
RESULT=$?

chown root:root -R .
exit $RESULT
