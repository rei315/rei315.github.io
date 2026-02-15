# rei315.github.io

This site deploys to GitHub Pages from CI-generated artifacts only: on every push to `main`, GitHub Actions runs `swift run rei315`, uploads the generated `Build/` directory as the Pages artifact, and deploys that artifact; `Build/` is intentionally ignored in Git to keep local output and deployed output consistent.
