#!/usr/bin/env bash
# lib/log.sh — logging for Get Independent
# Every module sources this file. Provides:
#   log_info, log_warn, log_error, log_fatal

# Guard: if this file was already loaded, do nothing.
[[ -n "${_GI_LOG_LOADED:-}" ]] && return 0
readonly _GI_LOG_LOADED=1

# Log file location. Can be overridden before sourcing.
# Root logs to /var/log; regular users get a per-user file in /tmp.
if [[ -z "${GI_LOG_FILE:-}" ]]; then
    if [[ "$(id -u)" -eq 0 ]]; then
        GI_LOG_FILE="/var/log/get-independent.log"
    else
        GI_LOG_FILE="/tmp/get-independent-$(id -un).log"
    fi
fi
_log() {
    local level="$1"
    shift
    local timestamp
    timestamp="$(date '+%Y-%m-%d %H:%M:%S')"
    local line="[${timestamp}] [${level}] $*"
    echo "${line}"
    echo "${line}" >> "${GI_LOG_FILE}" 2>/dev/null || true
}

log_info()  { _log "INFO " "$@"; }
log_warn()  { _log "WARN " "$@" >&2; }
log_error() { _log "ERROR" "$@" >&2; }
log_fatal() { _log "FATAL" "$@" >&2; exit 1; }
