# cyberbeveiligingswet-nis2

Curated corpus on the EU NIS2 Directive and the Dutch implementation (Cyberbeveiligingswet / Wet weerbaarheid kritieke entiteiten). All primary sources converted to Markdown for LLM consumption and quick reference.

> **Scope:** EU primary law, Commission implementing regulation, ENISA technical guidance, NL primary + secondary law, NL government guidance.
> **Status:** Tweede Kamer adopted Cbw + Wwke on 2026-04-15. Expected entry into force ~Q2 2026.

---

## Who this is for

| Audience | Start here |
|----------|-----------|
| **Compliance officer / DPO** at a NL entity asking "does Cbw apply to us?" | [`md/Doorverwijsboom Cyberbeveiligingswet.md`](./md/Doorverwijsboom%20Cyberbeveiligingswet.md) → [`ncsc-nl/md/www.ncsc.nl_cyberbeveiligingswet-nis2_flowchart-registratieplicht-nis2-entiteit.md`](./ncsc-nl/md/www.ncsc.nl_cyberbeveiligingswet-nis2_flowchart-registratieplicht-nis2-entiteit.md) → Cbw scope (art. 2–5) |
| **Security architect** mapping controls to obligations | [`enisa-guidance/md/ENISA_Technical_Implementation_Guidance_v1.0.md`](./enisa-guidance/md/ENISA_Technical_Implementation_Guidance_v1.0.md) + [`eu-implementing-regulation/md/cir-2024-2690-NL.md`](./eu-implementing-regulation/md/cir-2024-2690-NL.md) |
| **Lawyer / policy analyst** | [`nis2-directive-nl.md`](./nis2-directive-nl.md) → [`nl-wetsvoorstel/md/cbw-2025D26060.md`](./nl-wetsvoorstel/md/cbw-2025D26060.md) → [`nl-amvb-consultatie/md/ontwerp-cyberbeveiligingsbesluit.md`](./nl-amvb-consultatie/md/ontwerp-cyberbeveiligingsbesluit.md) |
| **LLM pipeline / RAG ingestion** | Feed all `**/md/*.md` plus root `*.md`. Use [`INDEX.md`](./INDEX.md) for curated reading order, [`INVENTORY.md`](./INVENTORY.md) for the raw archive listing. |
| **Practitioner building a compliance program** | [`templates/`](./templates/) — CSV/XLSX for asset inventory, incident register, risk register, NIS2 measures tracker, sub-processor register, access review |
| **Trainer / educator** | [`NIS2-light-micro-LMS.md`](./NIS2-light-micro-LMS.md) — light micro-LMS outline |

## Reading order (LLM context priority)

1. **NIS2 Directive (EU) 2022/2555** — the regime itself
2. **CIR (EU) 2024/2690** — binding technical requirements for digital infrastructure
3. **Cyberbeveiligingswet (Cbw)** — NL transposition wetsvoorstel 36764
4. **Cyberbeveiligingsbesluit (AMvB)** — NL details on duty of care, reporting, registration
5. **ENISA Technical Implementation Guidance** — practical mapping of CIR
6. **NCSC.nl FAQ + flowchart** — entity-side practical guidance

Full curated reading order with file paths: [`INDEX.md`](./INDEX.md).

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
| `templates/` | Compliance work artifacts (CSV/XLSX) — see [`templates/README.md`](./templates/README.md) |

### Why two `nis2-directive-nl.*` files at root?

`nis2-directive-nl.html` is the canonical EUR-Lex HTML render (cleanest semantic structure). `nis2-directive-nl.md` is its derived markdown (preferred for grep/diff/LLM ingestion). The PDF-derived alternate lives at `eu-directives/md/nis2-2022-2555-NL.md`. Both NL renders are kept because they originate from different formats and one may carry artifacts the other doesn't.

## Conversion

`convert-corpus.sh` drives PDF/HTML → Markdown via pandoc with a Python regex cleanup pipeline. Re-run to refresh derived `md/` files after replacing originals. Requires `pandoc` and `python3` on PATH.

## Usage hints

- **Binding obligations on digital service providers:** NIS2 Directive + CIR 2024/2690 + ENISA Tech Guidance.
- **"Does my org fall under Cbw?":** NCSC flowchart + Doorverwijsboom + Cbw scope (art. 2–5).
- **Incident reporting:** NIS2 art. 23 + CIR significant-incident articles + Cbw meldplicht + Cyberbeveiligingsbesluit.
- **Governance / board duties:** NIS2 art. 20 + Cbw zorgplicht + Cyberbeveiligingsbesluit board training.

## License

Mixed — see [`LICENSE`](./LICENSE) for the full schedule.

- Meta-docs and Markdown conversion layer: **CC-BY-4.0**
- `convert-corpus.sh`: **MIT**
- Government source documents (PDF/HTML originals): retain the original public-sector licensing of the issuing body, redistributed unmodified.

## Contributing

See [`CONTRIBUTING.md`](./CONTRIBUTING.md). No CLA, no DCO sign-off. Contributions are accepted under CC-BY-4.0 (or MIT for `convert-corpus.sh` changes).

## Sources

All source documents are public publications retrieved from EUR-Lex, Tweede Kamer, internetconsultatie.nl, NCSC.nl, Digital Trust Center, and ENISA. Markdown conversions are derivative — verify against originals before legal use.
