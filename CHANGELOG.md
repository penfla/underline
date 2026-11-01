<!-- SPDX-License-Identifier: Apache-2.0 | Copyright (c) 2025-2026 Flavio Pendolino -->

# Changelog

Format: [Keep a Changelog](https://keepachangelog.com/en/1.1.0/). Versioning: [SemVer](https://semver.org/).

## [Unreleased]

### Open question

- Markdown export and the PDF notes appendix still print "CC BY-NC 4.0". This is a non-free licence applied to output that consists of the user's own selections and notes. Decide whether to drop the notice or replace it with a neutral attribution line.
- No durable storage outside the Claude artifact host (`window.storage`): an IndexedDB adapter is only sketched in the source.

## [1.12.0] - 2026

### Added

- `start.command`: double-click launcher (local server on 127.0.0.1, opens the browser, stops on window close).
- App icon: `assets/` (SVG, PNG 512/180/32, social preview), inlined as favicon and header mark in `index.html`.
- CI checks for the launcher and icon assets.

## [1.11.0] - 2026

### Changed

- Relicensed from PolyForm Noncommercial 1.0.0 to Apache License 2.0.
- Repository packaging for GitHub: `LICENSE`, `NOTICE`, `README.md`, community files, CI and Pages workflows.

### Unchanged

- Application logic is identical to the 1.11.0 artifact; only licence headers, footer, the in-app Licence dialog and the `license` field written into `.pfmarker` files changed.

The in-app version history (Guide → Versions) covers 1.0.0–1.12.0.
