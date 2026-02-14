#!/usr/bin/env bash
set -euo pipefail

site="."
dry_run=0
mode="auto"

usage() {
  cat <<'USAGE'
Usage: ignite_build_site.sh [--site PATH] [--dry-run] [--ignite|--swift-run]

Build an Ignite site. Uses the Ignite CLI if available, otherwise falls back to
'swift build' and 'swift run'.

Options:
  --site PATH     Path to the site root (default: current directory)
  --dry-run       Print commands without executing
  --ignite        Force using the Ignite CLI
  --swift-run     Force using swift build/run
  -h, --help      Show this help
USAGE
}

while [ $# -gt 0 ]; do
  case "$1" in
    --site)
      site="$2"
      shift 2
      ;;
    --dry-run)
      dry_run=1
      shift
      ;;
    --ignite)
      mode="ignite"
      shift
      ;;
    --swift-run)
      mode="swift"
      shift
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "Unknown option: $1" >&2
      usage
      exit 2
      ;;
  esac
done

if [ ! -f "$site/Package.swift" ]; then
  echo "Package.swift not found in: $site" >&2
  exit 1
fi

run_cmd() {
  if [ "$dry_run" -eq 1 ]; then
    echo "+ (cd \"$site\" && $*)"
  else
    (cd "$site" && "$@")
  fi
}

use_ignite=0
if [ "$mode" = "ignite" ]; then
  use_ignite=1
elif [ "$mode" = "auto" ] && command -v ignite >/dev/null 2>&1; then
  use_ignite=1
fi

if [ "$use_ignite" -eq 1 ]; then
  run_cmd ignite build
else
  if ! command -v swift >/dev/null 2>&1; then
    echo "Swift toolchain not found in PATH." >&2
    exit 1
  fi
  run_cmd swift build
  run_cmd swift run
fi
