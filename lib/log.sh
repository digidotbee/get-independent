#!/usr/bin/env bash
# lib/log.sh — logging for Get Independent
# Every module sources this file. Provides:
#   log_info, log_warn, log_error, log_fatal

# Guard: if this file was already loaded, do nothing.
[[ -n "${_GI_LOG_LOADED:-}" ]] && return 0
readonly _GI_LOG_LOADED=1

# Log file location. Can be overridden before sourcing.
GI_LOG_FILE="${GI_LOG_FILE:-/tmp/get-independent.log}"

_log() {
    local level="$1"
    shift
    local timestamp
    timestamp="$(date '+%Y-%m-%d %H:%M:%S')"
    local line="[${timestamp}] [${level}] $*"
    echo "${line}"
    echo "${line}" >> "${GI_LOG_FILE}" || true
}

log_info()  { _log "INFO " "$@"; }
log_warn()  { _log "WARN " "$@" >&2; }
log_error() { _log "ERROR" "$@" >&2; }
log_fatal() { _log "FATAL" "$@" >&2; exit 1; }
