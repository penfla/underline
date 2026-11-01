<!-- SPDX-License-Identifier: Apache-2.0 | Copyright (c) 2025-2026 Flavio Pendolino -->

# Changelog

Format: [Keep a Changelog](https://keepachangelog.com/en/1.1.0/). Versioning: [SemVer](https://semver.org/).

## [Unreleased]

### Open question

- No durable storage outside the Claude artifact host (`window.storage`): an IndexedDB adapter is only sketched in the source.

## [1.14.0] - 2026

### Changed

- New look (CSS and a few markup hooks only, no behaviour change): softer palette, rounded surfaces, pill tabs, segmented pen control, primary `Open` button, icon in the drop zone. To go back to the previous look, revert the commit "New look (v1.14.0)".

## [1.13.0] - 2026

### Fixed

- Margin rules were placed from the selection or a guessed column edge, so a partial selection could put them on the text. They are now placed beyond the full extent of the text lines, measured from the document.
- Column detection ignored pages whose lines are all wide, and could be defeated by a heading crossing the gutter.

### Changed

- Grades 2–4 draw the rules (and, for grade 4, two arrows) on **both** sides of the line.
- Exports (Markdown, PDF notes appendix) no longer carry a CC BY-NC notice; `.pfmarker` records the generator instead of a licence string.
- `side` menu renamed `dot`: it now only places the note dot.

### Added

- Layout model per file (limits, content box, columns, line boxes, object coordinates), `Layout` overlay and `Layout JSON` export.
- Selectable images, tables and figures (PDF and reflowable formats); `Option`/`Alt`+`1`–`4` shortcuts for text and objects.
- DOCX, HTML, Markdown (marked 4.3.0) and TXT.
- Optional document information (Info), stored in sessions, exports and PDF properties.
- Collapsible marks column; clickable drop zone; multiple files at once.

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
