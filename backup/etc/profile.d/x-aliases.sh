function borg-export-pass() {
  if [ $# -eq 1 ]; then
    export BORG_PASSPHRASE=$(egrep '^\s*encryption_passphrase:' "$1" | awk -F': ' '{print $2}')
    grep -Pzo '(?s)\brepositor(ies:\s*((\n\s*-\N+)+|\[[^\]]+\])|y:\N+)\n?' "$1"
  else
    echo "Export borg passphrase from borgmatic config..." >&2
    echo "Usage: borg-export-pass <config>" >&2
  fi
}
