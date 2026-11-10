#!/usr/bin/env bash
#
# Deploy the built docs (site/) to the Hetzner web space, the same way as
# ~/git/bastian-kuhn.de/deploy/deploy.sh: SFTP in batch mode, because the
# Hetzner web space blocks remote command execution (no rsync, no scp, no
# ssh exec). Called by "make deploy" and "make deploy-dry".
#
# Config comes from the environment or from deploy/deploy.env (gitignored,
# template: deploy/deploy.env.example):
#   TA_DEPLOY_HOST  (required) SFTP host of the web space
#   TA_DEPLOY_USER  (required) SFTP user
#   TA_DEPLOY_DIR   (default public_html/docs.tourenanmeldung) remote path,
#                   relative to the SFTP home
#   TA_DEPLOY_PASS  (optional) password for a test without SSH key, fed to
#                   sftp by expect, never stored or shown on the command line
#
# Auth: an SSH key is recommended, once: ssh-copy-id USER@HOST
#
# Uploads only, never deletes on the server: files that disappear from
# site/ stay on the web space until removed by hand.
#
# --dry-run prints the SFTP batch and the file count and does not connect.
set -euo pipefail

cd "$(dirname "$0")/.."

DRY=0
[ "${1:-}" = "--dry-run" ] && DRY=1

if [ -f deploy/deploy.env ]; then
  # shellcheck disable=SC1091
  set -a; . deploy/deploy.env; set +a
fi

HOST="${TA_DEPLOY_HOST:-}"
USER="${TA_DEPLOY_USER:-}"
REMOTE_DIR="${TA_DEPLOY_DIR:-public_html/docs.tourenanmeldung}"
OUT="site"
SSH_OPTS="-o StrictHostKeyChecking=accept-new"

if [ -z "$HOST" ] || [ -z "$USER" ]; then
  echo "TA_DEPLOY_HOST and TA_DEPLOY_USER are not set, see deploy/deploy.env.example." >&2
  exit 2
fi

for f in index.html 404.html sitemap.xml; do
  if [ ! -f "$OUT/$f" ]; then
    echo "$OUT/$f is missing, run the build first (make deploy does)." >&2
    exit 2
  fi
done

# Build the SFTP batch. A leading "-" makes sftp ignore an error on that line
# (e.g. mkdir of a directory that already exists). Every directory and every
# file is listed on its own: "put -r" fails on the Hetzner web space for
# directories that don't exist remotely yet. Parents sort before their
# children, so each mkdir finds its parent.
BATCH="$(mktemp)"
trap 'rm -f "$BATCH"' EXIT
{
  echo "-mkdir ${REMOTE_DIR}"
  echo "cd ${REMOTE_DIR}"
  echo "lcd ${OUT}"
  (cd "$OUT" && find . -mindepth 1 -type d | sed 's|^\./||' | LC_ALL=C sort) |
    while IFS= read -r d; do echo "-mkdir \"$d\""; done
  (cd "$OUT" && find . -type f | sed 's|^\./||' | LC_ALL=C sort) |
    while IFS= read -r f; do echo "put \"$f\" \"$f\""; done
  echo "ls -la"
} > "$BATCH"

FILES=$(find "$OUT" -type f | wc -l | tr -d ' ')
echo "Deploy to ${USER}@${HOST}:${REMOTE_DIR}/  (via SFTP, ${FILES} files)"

if [ "$DRY" = 1 ]; then
  echo "Dry run, not connecting. SFTP batch:"
  sed 's/^/  /' "$BATCH"
  exit 0
fi

if [ -n "${TA_DEPLOY_PASS:-}" ]; then
  # sftp -b turns on BatchMode (which disables password prompts): undo that,
  # and force password auth so a loaded agent doesn't exhaust the attempts.
  SSH_OPTS="${SSH_OPTS} -o BatchMode=no -o PreferredAuthentications=password -o PubkeyAuthentication=no -o IdentitiesOnly=yes -o NumberOfPasswordPrompts=1"
fi
SFTP_CMD="sftp ${SSH_OPTS} -b ${BATCH} ${USER}@${HOST}"

if [ -n "${TA_DEPLOY_PASS:-}" ]; then
  # Feed the password through the environment; expect answers the prompt.
  CMD="$SFTP_CMD" expect -c '
    set timeout 600
    spawn sh -c $env(CMD)
    expect {
      -nocase -re "assword:"            { send -- "$env(TA_DEPLOY_PASS)\r"; exp_continue }
      -nocase -re "passphrase"          { send -- "$env(TA_DEPLOY_PASS)\r"; exp_continue }
      -nocase -re "continue connecting" { send -- "yes\r"; exp_continue }
      eof
    }
    catch wait result
    exit [lindex $result 3]
  '
else
  $SFTP_CMD
fi

echo "Done."
