##example-borgmatic

Initialize an empty repository:

```
backup-container borg init /mnt/Borg
```

**/etc/sysconfig/containers/backup/borgmatic**

```
IMAGE=oszi/backup
NAME=backup-borgmatic
DOCKER_OPTS='-v /:/host:ro -v /root:/root:rw -v /mnt/Borg:/mnt/Borg:rw'
CMD='borgmatic -v 1 -c /host/etc/borgmatic/config --excludes /host/etc/borgmatic/excludes'
```

**/etc/borgmatic/config**

```
[location]
# Space-separated list of sources to backup.
source_directories: /host/etc /host/home /host/root /host/opt

# Stay on same file system.
#one_file_system: True

# Alternate remote executable (defaults to "borg"):
#remote_path: borg1

# Path to local or remote repository.
repository: /mnt/Borg

[storage]
# Passphrase to unlock the encryption key with.
encryption_passphrase: topsecret

# Type of compression to use.
# See https://borgbackup.readthedocs.org/en/stable/usage.html#borg-create
compression: lz4

# Umask to be used for borg create.
#umask: 0022

[retention]
# Retention policy for how many backups to keep in each category.
# See https://borgbackup.readthedocs.org/en/stable/usage.html#borg-prune
#keep_within: 3H
#keep_hourly: 24
keep_daily: 7
keep_weekly: 4
keep_monthly: 6
keep_yearly: 1

#prefix: source-hostname

[consistency]
# Space-separated list of consistency checks to run: "repository", "archives",
# or both. Defaults to both. Set to "disabled" to disable all consistency checks.
# See https://borgbackup.readthedocs.org/en/stable/usage.html#borg-check
checks: repository archives

# Restrict the number of checked archives to the last n.
#check_last: 3
```

**/etc/borgmatic/excludes**

```
*/.cache/*
*/Downloads/*
```

Use `backup-container borg` to manage or restore your backups.
