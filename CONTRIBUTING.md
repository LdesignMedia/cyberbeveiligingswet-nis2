# Contributing

This is a documentation corpus, not a code project. Contributions are welcome for:

- Adding new authoritative sources (EU/NL government, ENISA, official EU Commission pages).
- Refreshing existing sources after upstream updates.
- Improving Markdown conversion quality (`convert-corpus.sh`).
- Improving meta-docs (`README.md`, `INDEX.md`, `INVENTORY.md`, this file).
- Adding compliance templates under `templates/`.

No CLA. No DCO sign-off required. By submitting a contribution you agree it is licensed under **CC-BY-4.0** (or **MIT** for changes to `convert-corpus.sh`). See [`LICENSE`](./LICENSE).

## Adding a new source

1. **Pick the right folder** based on jurisdiction and document type:
   - `eu-directives/` — EU primary law (directives, regulations of comparable weight)
   - `eu-implementing-regulation/` — Commission Implementing Regulations
   - `enisa-guidance/` — ENISA publications (non-binding)
   - `nl-wetsvoorstel/` — Tweede Kamer wetsvoorstellen + kamerstukken
   - `nl-amvb-consultatie/` or `nl-amvb-consultatie-wwke/` — internetconsultatie sets
   - `ncsc-nl/` — NCSC.nl + Digital Trust Center snapshots
   - `eu-cooperation-group/` — EU Commission policy hub + FAQ pages

2. **Drop the original** (PDF or HTML) at the folder root, not in `md/`.

3. **File naming convention:** lowercase, hyphenated, descriptive. Include language suffix where applicable (`-NL`, `-EN`). Examples: `nis2-2022-2555-NL.pdf`, `cbw-2025D26060.pdf`, `consultatiepagina-wwke.html`.

4. **Run conversion** to generate the Markdown:
   ```bash
   ./convert-corpus.sh
   ```
   This regenerates every `md/<basename>.md` from PDF/HTML originals via pandoc + a regex cleanup pipeline. Requires `pandoc` and `python3` on PATH.

5. **Update INDEX.md** under the appropriate section, with a one-line description and stable relative path.

6. **Update INVENTORY.md** with the source archive metadata (filename, source URL or document number).

7. **Commit** with a `docs:` or `chore:` prefix per Conventional Commits.

## Refreshing an existing source

1. Replace the original PDF or HTML in place — keep the filename stable to preserve the citation contract.
2. Run `./convert-corpus.sh` to regenerate the corresponding `md/` file.
3. Note the refresh in the commit message and, if material, in the PR description.

## Conversion quality

Pandoc output for EU/NL gov documents is generally good but not perfect. Known artifacts:

- Footnote references occasionally break across paragraphs.
- Tables rendered from PDFs may need manual repair.
- Page headers/footers can leak into body text.

If you fix conversion bugs in `convert-corpus.sh`, those changes are MIT-licensed. Test by re-running the script and diffing a representative sample.

## Reporting an issue

Open a GitHub issue. For corpus-content issues (e.g., broken conversion artifact, missing footnote, outdated source), please include the file path and a short excerpt.

## What does NOT belong here

- Code (TypeScript, Python, Go, etc.) beyond the existing Bash conversion driver.
- Confidential or non-public documents.
- Unverified or paraphrased "summaries" of legal text. Provenance over polish.
- Cross-jurisdiction interpretations or legal advice.
