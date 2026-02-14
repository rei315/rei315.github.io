#!/usr/bin/env bash
set -euo pipefail

repo="."
dry_run=1
clean=0

usage() {
  cat <<'USAGE'
Usage: ignite_cli_install.sh [--repo PATH] [--apply] [--clean]

Build and install the Ignite CLI from a local Ignite repo.

Options:
  --repo PATH   Path to the Ignite repo (default: current directory)
  --apply       Execute commands (default is dry-run)
  --clean       Run 'make clean' after install
  -h, --help    Show this help
USAGE
}

while [ $# -gt 0 ]; do
  case "$1" in
    --repo)
      repo="$2"
      shift 2
      ;;
    --apply)
      dry_run=0
      shift
      ;;
    --clean)
      clean=1
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

if [ ! -f "$repo/Makefile" ]; then
  echo "Makefile not found in: $repo" >&2
  exit 1
fi

run_cmd() {
  if [ "$dry_run" -eq 1 ]; then
    echo "+ (cd \"$repo\" && $*)"
  else
    (cd "$repo" && "$@")
  fi
}

run_cmd make
run_cmd make install

if [ "$clean" -eq 1 ]; then
  run_cmd make clean
fi
