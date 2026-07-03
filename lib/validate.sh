#!/usr/bin/env bash
# lib/validate.sh — pre-flight checks for Get Independent
# Requires lib/log.sh to be sourced first.

[[ -n "${_GI_VALIDATE_LOADED:-}" ]] && return 0
readonly _GI_VALIDATE_LOADED=1

# Refuse to load without the logger.
[[ -n "${_GI_LOG_LOADED:-}" ]] || { echo "ERROR: source lib/log.sh before lib/validate.sh" >&2; return 1; }

validate_os() {
    [[ -r /etc/os-release ]] || log_fatal "Cannot read /etc/os-release — is this even Linux?"
    # shellcheck source=/dev/null
    source /etc/os-release
    [[ "${ID}" == "ubuntu" ]]        || log_fatal "Unsupported OS: ${ID}. This installer supports Ubuntu only."
    [[ "${VERSION_ID}" == "24.04" ]] || log_fatal "Unsupported Ubuntu version: ${VERSION_ID}. Only 24.04 LTS is supported."
    log_info "OS check passed: Ubuntu ${VERSION_ID}"
}

validate_root() {
    [[ "$(id -u)" -eq 0 ]] || log_fatal "This installer must run as root. Try: sudo ./install.sh"
    log_info "Privilege check passed: running as root"
}

validate_network() {
    if ping -c 1 -W 3 archive.ubuntu.com >/dev/null 2>&1; then
        log_info "Network check passed: archive.ubuntu.com reachable"
    else
        log_fatal "No network access to archive.ubuntu.com — packages cannot be downloaded."
    fi
}

validate_commands() {
    local cmd
    for cmd in "$@"; do
        command -v "${cmd}" >/dev/null 2>&1 || log_fatal "Required command not found: ${cmd}"
    done
    log_info "Command check passed: $*"
}

