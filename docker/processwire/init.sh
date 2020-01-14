#!/bin/bash

chown -R www-data:www-data /var/www/html

mkdir -p /usr/local/etc/php/conf.d

# Enable PHP Extensions
# Change Settings if Needed
cat > /usr/local/etc/php/conf.d/local.ini << EOF

date.timezone="America/Santiago"
upload_max_filesize = 100M
post_max_size = 0
max_file_uploads = 500

extension=gd.so
extension=intl.so
extension=mysqli.so
extension=opcache.so
extension=pdo.so
extension=pdo_mysql.so
extension=pdo_pgsql.so
extension=zip.so
EOF

# Start Apache
source /etc/apache2/envvars
exec apache2ctl -D FOREGROUND