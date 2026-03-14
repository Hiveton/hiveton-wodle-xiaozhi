#!/usr/bin/env bash

set -euo pipefail

usage() {
    cat <<'EOF'
Usage: build_download.sh [--dry-run] [--build-only] [--port-selection VALUE]

Compile the sf32lb52-lcd_n16r8 target, then download it with uart_download.sh.

Options:
  --dry-run                 Print the steps without executing them.
  --build-only              Stop after a successful build.
  --port-selection VALUE    Value sent to uart_download.sh when it prompts for a port.
                            Defaults to 0.
  -h, --help                Show this help text.
EOF
}

REPO_ROOT="$(cd -- "$(dirname "${BASH_SOURCE[0]}")/../../.." >/dev/null 2>&1 && pwd)"
SDK_DIR="$REPO_ROOT/sdk"
PROJECT_DIR="$REPO_ROOT/app/project"
BUILD_DIR="$PROJECT_DIR/build_sf32lb52-lcd_n16r8_hcpu"
BOARD="sf32lb52-lcd_n16r8"

DRY_RUN=0
BUILD_ONLY=0
PORT_SELECTION="0"

while [ $# -gt 0 ]; do
    case "$1" in
        --dry-run)
            DRY_RUN=1
            ;;
        --build-only)
            BUILD_ONLY=1
            ;;
        --port-selection)
            shift
            PORT_SELECTION="${1:?missing value for --port-selection}"
            ;;
        -h|--help)
            usage
            exit 0
            ;;
        *)
            echo "Unknown argument: $1" >&2
            usage >&2
            exit 1
            ;;
    esac
    shift
done

log_step() {
    printf '+ %s\n' "$1"
}

if [ ! -f "$SDK_DIR/export.sh" ]; then
    echo "Missing SDK export script: $SDK_DIR/export.sh" >&2
    exit 1
fi

if [ "$DRY_RUN" -eq 1 ]; then
    log_step "cd $SDK_DIR"
    log_step ". ./export.sh"
    log_step "cd $PROJECT_DIR"
    log_step "scons --board=$BOARD"
    if [ "$BUILD_ONLY" -eq 0 ]; then
        log_step "cd $BUILD_DIR"
        log_step "printf '%s\\n' '$PORT_SELECTION' | ./uart_download.sh"
    fi
    exit 0
fi

log_step "cd $SDK_DIR"
cd "$SDK_DIR"

log_step ". ./export.sh"
. ./export.sh

if ! command -v scons >/dev/null 2>&1; then
    echo "scons is not available after sourcing sdk/export.sh" >&2
    exit 1
fi

log_step "cd $PROJECT_DIR"
cd "$PROJECT_DIR"

log_step "scons --board=$BOARD"
scons --board="$BOARD"

if [ "$BUILD_ONLY" -eq 1 ]; then
    exit 0
fi

if [ ! -x "$BUILD_DIR/uart_download.sh" ]; then
    echo "Missing download script: $BUILD_DIR/uart_download.sh" >&2
    exit 1
fi

log_step "cd $BUILD_DIR"
cd "$BUILD_DIR"

log_step "printf '%s\\n' '$PORT_SELECTION' | ./uart_download.sh"
printf '%s\n' "$PORT_SELECTION" | ./uart_download.sh
