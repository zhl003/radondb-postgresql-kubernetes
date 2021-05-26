#!/bin/bash
#
# Qingcloud Pgpool run

# shellcheck disable=SC1091

set -o errexit
set -o nounset
set -o pipefail
# set -o xtrace # Uncomment this line for debugging purpose

# Load libraries
. /opt/qingcloud/scripts/liblog.sh
. /opt/qingcloud/scripts/libldapclient.sh
. /opt/qingcloud/scripts/libpgpool.sh

# Load Pgpool env. variables
eval "$(pgpool_env)"
# Load LDAP environment variables
eval "$(ldap_env)"

readonly command=$(command -v pgpool)
flags=("-n" "--config-file=${PGPOOL_CONF_FILE}" "--hba-file=${PGPOOL_PGHBA_FILE}" "--pcp-file=${PGPOOL_PCP_CONF_FILE}")
[[ -z "${PGPOOL_EXTRA_FLAGS:-}" ]] || flags=("${flags[@]}" "${PGPOOL_EXTRA_FLAGS[@]}")

is_boolean_yes "$PGPOOL_ENABLE_LDAP" && ldap_start_nslcd_bg
info "** Starting Pgpool-II **"
if am_i_root; then
    exec gosu "$PGPOOL_DAEMON_USER" "${command}" "${flags[@]}"
else
    exec "${command}" "${flags[@]}"
fi
