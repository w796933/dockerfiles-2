alias tarsnap-root='tarsnap --keyfile /root/.config/tarsnap.key --cachedir /root/.cache/tarsnap'

function borg-export-pass() {
  if [ $# -eq 1 ]; then
    export BORG_PASSPHRASE=$(egrep '^encryption_passphrase:' "$1" | awk -F': ' '{print $2}')
    egrep '^repository:' "$1"
  else
    echo "Export borg passphrase from borgmatic config..." >&2
    echo "Usage: borg-export-pass <config>" >&2
  fi
}
