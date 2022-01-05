#!/bin/bash
#
# Sets PHP session variables passed at build time

# shellcheck disable=SC1091

set -o errexit
set -o nounset
set -o pipefail
# set -o xtrace # Uncomment this line for debugging purposes

sed -i 's/session.save_handler = files/session.save_handler = $PHP_SESSION_SAVE_HANDLER/g' /opt/bitnami/php/etc/php.ini
sed -i 's/session.save_path = \/opt\/bitnami\/php\/var\/run\/session/session.save_path = $PHP_SESSION_SAVE_PATH/g' /opt/bitnami/php/etc/php.ini