#!/usr/bin/env bash
# tests/run.sh — test harness for Get Independent
# Deliberately NOT using -e: this harness provokes failures on purpose.
set -uo pipefail

TESTS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
GI_ROOT="$(dirname "${TESTS_DIR}")"

# Log to a throwaway file so test runs never pollute real logs.
GI_LOG_FILE="$(mktemp)"
export GI_LOG_FILE

source "${GI_ROOT}/lib/log.sh"
source "${GI_ROOT}/lib/validate.sh"
source "${GI_ROOT}/lib/pkg.sh"

PASS=0
FAIL=0

expect_ok() {
    local desc="$1"
    shift
    if ( "$@" ) >/dev/null 2>&1; then
        echo "PASS: ${desc}"
        PASS=$((PASS + 1))
    else
        echo "FAIL: ${desc}"
        FAIL=$((FAIL + 1))
    fi
}

expect_fail() {
    local desc="$1"
    shift
    if ( "$@" ) >/dev/null 2>&1; then
        echo "FAIL: ${desc} (expected failure, got success)"
        FAIL=$((FAIL + 1))
    else
        echo "PASS: ${desc}"
        PASS=$((PASS + 1))
    fi
}

echo "=== Get Independent test suite ==="

# --- log.sh ---
expect_ok   "log_info produces output"            log_info "test message"
expect_ok   "log writes to log file"              grep -q "test message" "${GI_LOG_FILE}"
expect_fail "log_fatal exits with failure"        log_fatal "intentional test failure"

# --- validate.sh ---
expect_ok   "validate_os passes on Ubuntu 24.04"  validate_os
expect_ok   "validate_commands finds real cmds"   validate_commands bash grep
expect_fail "validate_commands rejects fake cmd"  validate_commands definitely-not-a-real-command
if [[ "$(id -u)" -eq 0 ]]; then
    expect_ok   "validate_root passes as root"    validate_root
else
    expect_fail "validate_root rejects non-root"  validate_root
fi

# --- pkg.sh ---
expect_ok   "pkg_is_installed finds bash"         pkg_is_installed bash
expect_fail "pkg_is_installed rejects absent pkg" pkg_is_installed definitely-not-a-real-package

echo "=== Results: ${PASS} passed, ${FAIL} failed ==="
[[ "${FAIL}" -eq 0 ]] || exit 1
