#!/usr/bin/env bash
#
# install.sh — Get Independent
# Turns a fresh Ubuntu 24.04 server into a personal communications server.
#
set -euo pipefail

# Find the directory this script lives in, so it works from anywhere.
GI_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
readonly GI_ROOT

# Load libraries.
source "${GI_ROOT}/lib/log.sh"
source "${GI_ROOT}/lib/validate.sh"

main() {
    log_info "Get Independent installer starting"
    log_info "Project root: ${GI_ROOT}"

    log_info "Running pre-flight checks..."
    validate_os
    validate_root
    validate_network
    validate_commands curl openssl systemctl apt-get

    log_info "All pre-flight checks passed."
    log_info "Nothing further to do yet — installation phases arrive in future versions."
}

main "$@"
chmod +x install.sh

