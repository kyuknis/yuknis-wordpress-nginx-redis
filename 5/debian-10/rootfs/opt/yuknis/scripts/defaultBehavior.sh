#!/bin/bash
#
# Executes the original run and entrypoint of the bitnami container

# shellcheck disable=SC1091

set -o errexit
set -o nounset
set -o pipefail
# set -o xtrace # Uncomment this line for debugging purposes

echo Yuknis scripts completed, continuing to Bitnami...

/opt/bitnami/scripts/wordpress/entrypoint.sh $1