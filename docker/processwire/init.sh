#!/bin/bash

chown -R www-data:www-data /var/www/html

mkdir -p /usr/local/etc/php/conf.d

# Configure PHP
# Configure Timezone
cat > /usr/local/etc/php/conf.d/local.ini << EOF
extension=gd.so
extension=intl.so
extension=mysqli.so
extension=opcache.so
extension=pdo.so
extension=pdo_mysql.so
extension=pdo_pgsql.so
extension=zip.so
date.timezone="America/Santiago"
EOF

# Start Apache
source /etc/apache2/envvars
exec apache2ctl -D FOREGROUND