---
name: ignite-cli
description: Operate the Ignite command-line tool. Use when installing/building the Ignite CLI, creating new sites, building HTML, running the local preview server, or troubleshooting CLI usage, flags, or the server script.
---

# Ignite CLI

## Overview
Use this skill to run and troubleshoot Ignite CLI commands for any Ignite-based site. This skill does not assume a local Ignite source repo is present.

## Quick workflow
1. Confirm whether the `ignite` CLI is available in PATH; if not, use SwiftPM build/run or install the CLI from an Ignite source checkout.
2. Choose the command: new, build, or run.
3. Confirm the current directory is the site root (look for `Package.swift`) for build/run.
4. Use `ignite help` or `ignite help <command>` for details.

## Commands
- new: clone a template repo into a new folder (use --template for a different https URL).
- build: runs swift build then swift run to generate Build output.
- run: serves Build locally; use --port, --directory, and --preview as needed.

## Scripts
- scripts/ignite_cli_install.sh: build/install the CLI from a local Ignite repo (dry-run by default).
- scripts/ignite_build_site.sh: build a site using ignite build or swift build/run.

## Troubleshooting
- If run reports the server script is missing, reinstall (make install && make clean).
- If a port is already in use, pass --port; the CLI will try the next ports up to 8999.
- If build fails, review swift build errors first.

## References
- Open references/cli-commands.md for command details.
- Open references/installation.md for install steps.
