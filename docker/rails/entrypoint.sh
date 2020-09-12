#!/bin/bash
set -e

rm -f /cmm/tmp/pids/server.pid

exec "$@"
