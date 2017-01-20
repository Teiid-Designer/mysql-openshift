#!/bin/bash

# setup directory for data
mkdir -p /var/lib/mysql/data
chown -R mysql:0 /var/lib/mysql
restorecon -R /var/lib/mysql

# Loosen permission bits for group to avoid problems running container with
# arbitrary UID
# When only specifying user, group is 0, that's why /var/lib/mysql must have
# owner mysql.0; that allows to avoid a+rwx for this dir
chmod g+w -R /var/lib/mysql
