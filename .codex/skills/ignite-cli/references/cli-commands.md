# Ignite CLI commands

## Commands
- `ignite new <Name>`
  - Clones a template repo into <Name> (default template: https://github.com/twostraws/IgniteStarter).
  - `--template` (or `-t`) lets you set a different template URL (must start with https://).
  - Fails if the target directory exists or is not empty.

- `ignite build`
  - Requires `Package.swift` in the current directory.
  - Runs `swift build`, then `swift run` to generate HTML into Build.

- `ignite run`
  - Starts a local server for the current site's build output.
  - Options:
    - `--port` / `-p` (default 8000)
    - `--directory` / `-d` (default Build)
    - `--preview` (open browser)
  - Uses `/usr/local/bin/ignite-server.py` (installed via `make install`).
  - If the port is in use, it will try the next port up to 8999.

## Help
- `ignite help`
- `ignite help run`
