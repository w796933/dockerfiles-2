#!/bin/sh -u
awk -F: '{print $1}' /data/.htpasswd \
| xargs -n1 /usr/bin/php /usr/share/rutorrent/php/initplugins.php &
