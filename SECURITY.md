<!-- SPDX-License-Identifier: Apache-2.0 | Copyright (c) 2025-2026 Flavio Pendolino -->

# Security policy

## Supported versions

Only the latest release on `main`.

## Reporting a vulnerability

Do not open a public issue. Use GitHub private vulnerability reporting
(https://github.com/penfla/underline/security/advisories/new) or write to penfla@me.com.

Include: browser and version, steps, and a minimal sample file if the issue is triggered by a PDF, EPUB or `.pfmarker`. Do not send copyrighted books; a synthetic file is enough.

Expect an acknowledgement within 7 days.

## Scope

In scope: sanitisation of EPUB content, validation of `.pfmarker` input, any path by which book content or annotations could leave the browser, XSS through the app's own DOM updates.

Out of scope: vulnerabilities in pdf.js, JSZip or pdf-lib themselves (report upstream), and attacks requiring a compromised CDN. The three libraries are pinned by version but not by SRI hash.
