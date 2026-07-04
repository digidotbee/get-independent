#!/usr/bin/env bash
# lib/pkg.sh — idempotent package management for Get Independent
# Requires lib/log.sh to be sourced first.

[[ -n "${_GI_PKG_LOADED:-}" ]] && return 0
readonly _GI_PKG_LOADED=1

[[ -n "${_GI_LOG_LOADED:-}" ]] || { echo "ERROR: source lib/log.sh before lib/pkg.sh" >&2; return 1; }

# Never let apt ask interactive questions during automated installs.
export DEBIAN_FRONTEND=noninteractive

pkg_is_installed() {
    dpkg-query -W -f='${Status}' "$1" 2>/dev/null | grep -q "install ok installed"
}

pkg_update_index() {
    log_info "Refreshing package index..."
    if apt-get update -qq; then
        log_info "Package index refreshed"
    else
        log_fatal "apt-get update failed — check network and apt sources"
    fi
}

pkg_ensure() {
    local pkg
    for pkg in "$@"; do
        if pkg_is_installed "${pkg}"; then
            log_info "Package already present: ${pkg}"
        else
            log_info "Installing package: ${pkg}"
            if apt-get install -y -qq "${pkg}" >/dev/null; then
                pkg_is_installed "${pkg}" || log_fatal "Installed ${pkg} but verification failed"
                log_info "Package installed: ${pkg}"
            else
                log_fatal "Failed to install package: ${pkg}"
            fi
        fi
    done
}
