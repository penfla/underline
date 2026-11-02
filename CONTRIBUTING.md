<!-- SPDX-License-Identifier: Apache-2.0 | Copyright (c) 2025-2026 Flavio Pendolino -->

# Contributing

Repository: https://github.com/penfla/underline

## Licensing of contributions

Unless you state otherwise, any contribution you intentionally submit for inclusion is licensed under the Apache License 2.0 (section 5 of the [LICENSE](LICENSE)), without additional terms.

## Workflow

1. Open an issue first for anything beyond a small fix: https://github.com/penfla/underline/issues
2. Fork, branch from `main`, keep the change focused.
3. Run `bash scripts/check.sh` before pushing.
4. Open a pull request. Describe the behaviour change and how you tested it (browser, PDF/EPUB used).

## Constraints

- Single-file app, no build step. Keep it that way unless discussed.
- The book must never leave the browser tab. No telemetry, no network calls other than the pinned CDN scripts.
- Untrusted input (EPUB content, `.pfmarker` files) must go through the existing sanitisation/validation paths.
- New source files start with `SPDX-License-Identifier: Apache-2.0` and the copyright line.
- Do not commit books or annotation sessions (`*.pdf`, `*.epub`, `*.pfmarker` are ignored).

## Good first contributions

- IndexedDB adapter for `sGet`/`sSet` (source, section 2).
- SRI hashes or vendored copies of pdf.js, JSZip, pdf-lib.
- Test fixtures under permissive licence (public-domain PDF/EPUB).

## Conduct

See [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md).
