# cyberbeveiligingswet-nis2

Curated corpus on the EU NIS2 Directive and the Dutch implementation (Cyberbeveiligingswet / Wet weerbaarheid kritieke entiteiten). All primary sources converted to Markdown for LLM consumption and quick reference.

> **Scope:** EU primary law, Commission implementing regulation, ENISA technical guidance, NL primary + secondary law, NL government guidance.
> **Status:** Tweede Kamer adopted Cbw + Wwke on 2026-04-15. Expected entry into force ~Q2 2026.

---

## Quick start

- Browse [`INDEX.md`](./INDEX.md) for the curated reading order with file paths.
- Browse [`INVENTORY.md`](./INVENTORY.md) for the raw archive listing.
- Use the Markdown files in each `md/` subfolder when feeding context to an LLM. Original PDFs/HTML kept alongside.
- Templates for compliance work live in [`templates/`](./templates/) (CSV + XLSX): asset inventory, incident register, risk register, NIS2 measures tracker, sub-processor register, access review.
- Light micro-LMS outline: [`NIS2-light-micro-LMS.md`](./NIS2-light-micro-LMS.md).

## Reading order (LLM context priority)

1. **NIS2 Directive (EU) 2022/2555** — the regime itself
2. **CIR (EU) 2024/2690** — binding technical requirements for digital infrastructure
3. **Cyberbeveiligingswet (Cbw)** — NL transposition wetsvoorstel 36764
4. **Cyberbeveiligingsbesluit (AMvB)** — NL details on duty of care, reporting, registration
5. **ENISA Technical Implementation Guidance** — practical mapping of CIR
6. **NCSC.nl FAQ + flowchart** — entity-side practical guidance

## Repository layout

| Path | Contents |
|------|----------|
| `eu-directives/` | NIS2 (2022/2555) + CER (2022/2557), NL + EN, PDF/HTML/MD |
| `eu-implementing-regulation/` | CIR 2024/2690, NL + EN |
| `enisa-guidance/` | ENISA Technical Implementation Guidance, ECSF role mapping, Cyber Stress Tests handbook |
| `nl-wetsvoorstel/` | Cbw (36764) + Wwke (36765) Tweede Kamer stukken |
| `nl-amvb-consultatie/` | Cyberbeveiligingsbesluit (AMvB onder Cbw) consultation set |
| `nl-amvb-consultatie-wwke/` | Besluit Wwke consultation set |
| `ncsc-nl/` | NCSC.nl + Digital Trust Center guidance snapshots |
| `eu-cooperation-group/` | EU Commission policy hub, FAQ, transposition tracker |
| `md/` | Markdown of NL government PDFs (Doorverwijsboom, flyer, brochure) |
| `templates/` | Compliance work artifacts (CSV/XLSX) |

## Conversion

`convert-corpus.sh` drives PDF/HTML → Markdown conversion via pandoc with regex cleanup. Re-run to refresh derived `md/` files after replacing originals.

## Usage hints

- **Binding obligations on digital service providers:** NIS2 Directive + CIR 2024/2690 + ENISA Tech Guidance.
- **"Does my org fall under Cbw?":** NCSC flowchart + Doorverwijsboom + Cbw scope (art. 2–5).
- **Incident reporting:** NIS2 art. 23 + CIR significant-incident articles + Cbw meldplicht + Cyberbeveiligingsbesluit.
- **Governance / board duties:** NIS2 art. 20 + Cbw zorgplicht + Cyberbeveiligingsbesluit board training.

## License / sources

All source documents are public domain or EU/NL government publications retrieved from EUR-Lex, Tweede Kamer, internetconsultatie.nl, NCSC.nl, Digital Trust Center, and ENISA. Markdown conversions are derivative — verify against originals before legal use.
