#!/bin/zsh
# Starts MCP Toolbox with the ready-made Postgres tools.
# Loads the connection from the repo's .env (git-ignored). No secrets in this file.
ROOT="${0:A:h:h}"
set -a
source "$ROOT/.env"
set +a
exec "$ROOT/.claude/bin/toolbox" --prebuilt=postgres --stdio
