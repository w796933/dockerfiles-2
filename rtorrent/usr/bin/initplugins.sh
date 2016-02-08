#!/bin/sh -u
awk -F: '{print $1}' ${RUTORRENT_DATA}/htpasswd \
| xargs -n1 /usr/bin/php /var/www/rutorrent/php/initplugins.php &
