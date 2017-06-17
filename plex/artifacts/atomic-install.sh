cp -av firewalld-service.xml ${HOST}/etc/firewalld/services/plex.xml
chcon --reference=${HOST}/etc/firewalld/services ${HOST}/etc/firewalld/services/plex.xml || :
