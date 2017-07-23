## Examples: Borgmatic

Initialize an empty repository:

```
shell.sh borg init /mnt/Borg
```

**Environment**

```
IMAGE=oszi/backup
NAME=borgmatic
DOCKER_OPTS='-v /:/host:ro -v /root:/root:rw -v /mnt/Borg:/mnt/Borg:rw'
CMD='borgmatic -c /host/etc/borgmatic/config.yaml'
```

**/etc/borgmatic/config.yaml**

```yaml
# Where to look for files to backup, and where to store those backups. See
# https://borgbackup.readthedocs.io/en/stable/quickstart.html and
# https://borgbackup.readthedocs.io/en/stable/usage.html#borg-create for details.
location:
  # List of source directories to backup (required). Globs are expanded.
  source_directories:
    - /host/etc
    - /host/home
  # Stay on the same file system?
  one_file_system: false
  # Alternate Borg remote executable.
  remote_path: borg
  # Path to local or remote repository (required).
  repositories:
    - /mnt/Borg
  # Any paths matching these patterns are excluded from backups. Globs are expanded.
  # See https://borgbackup.readthedocs.io/en/stable/usage.html#borg-help-patterns
  # for details.
  exclude_patterns:
    - '*/.cache/*'
# Repository storage options. See
# https://borgbackup.readthedocs.io/en/stable/usage.html#borg-create and
# https://borgbackup.readthedocs.io/en/stable/usage.html#environment-variables for details.
storage:
  # Passphrase to unlock the encryption key with. Only use on repositories that were
  # initialized with passphrase / repo key encryption.
  encryption_passphrase: __secret__
  # Type of compression to use when creating archives. See
  # https://borgbackup.readthedocs.org/en/stable/usage.html#borg-create for details.
  # Defaults to no compression.
  compression: lz4
  # Umask to be used for borg create.
  umask: 0077
# Retention policy for how many backups to keep in each category. See
# https://borgbackup.readthedocs.org/en/stable/usage.html#borg-prune for details.
retention:
  keep_within: 3H
  keep_hourly: 24
  keep_daily: 7
  keep_weekly: 4
  keep_monthly: 6
  keep_yearly: 1
  #prefix: sourcehostname
# Consistency checks to run after backups. See
# https://borgbackup.readthedocs.org/en/stable/usage.html#borg-check for details.
consistency:
  # List of consistency checks to run: "repository", "archives" or both.
  # Set to "disabled" to disable all consistency checks. See
  # https://borgbackup.readthedocs.org/en/stable/usage.html#borg-check for details.
  checks:
    - repository
    - archives
  # Restrict the number of checked archives to the last N.
  check_last: 3
```

Use `shell.sh borg` to manage or restore your backups.
