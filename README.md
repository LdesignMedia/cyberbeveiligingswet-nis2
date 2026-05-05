# cyberbeveiligingswet-nis2

Curated corpus on the EU NIS2 Directive and the Dutch implementation (Cyberbeveiligingswet / Wet weerbaarheid kritieke entiteiten). All primary sources converted to Markdown for LLM consumption and quick reference.

> **Scope:** EU primary law, Commission implementing regulation, ENISA technical guidance, NL primary + secondary law, NL government guidance.
> **Status:** Tweede Kamer adopted Cbw + Wwke on 2026-04-15. Expected entry into force ~Q2 2026.

---

## About NIS2 in 60 seconds

**NIS2 Directive (EU) 2022/2555** is the EU's second-generation cybersecurity baseline, in force since 16 January 2023 with a transposition deadline of 17 October 2024. It replaces the 2016 NIS1 Directive (2016/1148) and dramatically expands scope, sharpens enforcement, and codifies management-board accountability.

### What changed vs NIS1

- **Bigger perimeter.** NIS2 covers ~18 sectors (vs 7 in NIS1). All medium and large entities operating in those sectors are in-scope by default — no national designation lottery.
- **Two tiers.**
  - **Essential entities** (energy, transport, banking, drinking water, healthcare, digital infrastructure core, public administration, space). Proactive supervision, full audit rights, fines up to **€10M or 2% global turnover**.
  - **Important entities** (postal/courier, waste, chemicals, food, manufacturing, digital providers like online marketplaces/search engines/social networks, research). Reactive supervision, fines up to **€7M or 1.4% global turnover**.
- **Management-body liability.** Boards must approve cyber risk-management measures, oversee implementation, and complete training (NIS2 art. 20). Personal liability is on the table.
- **Sharper incident reporting timeline** (art. 23): early warning ≤ 24 h, incident notification ≤ 72 h, final report ≤ 1 month.

### The four obligation pillars

1. **Risk-management measures** (art. 21) — 10 mandatory areas including risk policies, incident handling, BCP/DR, supply-chain security, vulnerability handling, secure development, MFA/identity, encryption, access control, asset management.
2. **Incident reporting** (art. 23) — phased reports to the CSIRT/competent authority for any "significant incident."
3. **Governance** (art. 20) — board approval, oversight, and training duty.
4. **Registration** — entities self-register with the competent authority; jurisdiction follows main establishment for cross-border digital providers.

### Binding technical requirements (CIR 2024/2690)

Commission Implementing Regulation **(EU) 2024/2690**, in force 17 October 2024, makes art. 21 risk-management measures **legally binding and uniform** for digital infrastructure providers (DNS, TLD, cloud, datacenter, CDN, MSP, MSSP, online marketplaces, search engines, social networks, trust services). 13 thematic areas, ~70 mandatory measures, evidence-based. ENISA's Technical Implementation Guidance (June 2025, 170 pp) is the de-facto reference for *how* to satisfy each measure.

### Dutch transposition stack

| Layer | Instrument | Role |
|-------|------------|------|
| Primary law | **Cyberbeveiligingswet (Cbw)** — wetsvoorstel 36764 | Transposes NIS2 into NL law. Tweede Kamer adopted 2026-04-15. |
| Primary law (sister) | **Wet weerbaarheid kritieke entiteiten (Wwke)** — wetsvoorstel 36765 | Transposes the CER Directive (2022/2557) covering physical/organisational resilience of critical entities. |
| Secondary law | **Cyberbeveiligingsbesluit (AMvB)** | Lower regulation under Cbw — duty of care detail, registration, board training. Internetconsultatie 20 Feb – 30 March 2025. |
| Secondary law (sister) | **Besluit Wwke** | Lower regulation under Wwke. |
| Operational guidance | **NCSC.nl** (registration flowchart, FAQ) + **Digital Trust Center** | Entity-facing how-to. |

Expected NL entry into force: ~Q2 2026 (~July 1).

### Adjacent regimes (out of scope for this corpus)

- **CER Directive (EU) 2022/2557** (sister): physical/organisational resilience of critical entities. Included here as context; primary content lives in NIS2 corpus only.
- **DORA (EU) 2022/2554**: financial-sector cyber rules, supersedes NIS2 art. 21/23 for financial entities (lex specialis).
- **GDPR**: data-protection regime; overlaps on incident reporting for breaches involving personal data.
- **eIDAS**: trust services; CIR 2024/2690 art. 21 applies to qualified trust service providers.

---

## Who this is for

| Audience | Start here |
|----------|-----------|
| **Compliance officer / DPO** at a NL entity asking "does Cbw apply to us?" | [`FAQ-compliance-officers.md`](./FAQ-compliance-officers.md) (27 Q&A) → [`nl-overheid-publicaties/md/doorverwijsboom-cyberbeveiligingswet.md`](./nl-overheid-publicaties/md/doorverwijsboom-cyberbeveiligingswet.md) → [`ncsc-nl/md/www.ncsc.nl_cyberbeveiligingswet-nis2_flowchart-registratieplicht-nis2-entiteit.md`](./ncsc-nl/md/www.ncsc.nl_cyberbeveiligingswet-nis2_flowchart-registratieplicht-nis2-entiteit.md) |
| **Security architect** mapping controls to obligations | [`enisa-guidance/md/ENISA_Technical_Implementation_Guidance_v1.0.md`](./enisa-guidance/md/ENISA_Technical_Implementation_Guidance_v1.0.md) + [`eu-implementing-regulation/md/cir-2024-2690-NL-html.md`](./eu-implementing-regulation/md/cir-2024-2690-NL-html.md) |
| **CISO running gap analysis / audit prep** | [`CHECKLIST-CISO.md`](./CHECKLIST-CISO.md) — 100+ evidence items mapped to art. 20–23 + 27 and CIR 2024/2690 |
| **Lawyer / policy analyst** | [`nis2-directive-nl.md`](./nis2-directive-nl.md) → [`nl-wetsvoorstel/md/cbw-2025D26060.md`](./nl-wetsvoorstel/md/cbw-2025D26060.md) → [`nl-amvb-consultatie/md/ontwerp-cyberbeveiligingsbesluit.md`](./nl-amvb-consultatie/md/ontwerp-cyberbeveiligingsbesluit.md) |
| **LLM pipeline / RAG ingestion** | Feed all `**/md/*.md` plus root `*.md`. Use [`INDEX.md`](./INDEX.md) for curated reading order, [`INVENTORY.md`](./INVENTORY.md) for the raw archive listing. |
| **Practitioner building a compliance program** | [`templates/`](./templates/) — CSV/XLSX for asset inventory, incident register, risk register, NIS2 measures tracker, sub-processor register, access review |
| **Trainer / educator** | [`NIS2-light-micro-LMS.md`](./NIS2-light-micro-LMS.md) — light micro-LMS outline |
| **Anyone hitting an unfamiliar term** | [`GLOSSARY.md`](./GLOSSARY.md) — NL/EN definitions for NIS2, Cbw, Wwke, CER, DORA, eIDAS jargon |
| **Anyone tracking dates / deadlines** | [`TIMELINE.md`](./TIMELINE.md) — EU + NL milestones from NIS1 (2016) through Cbw entry into force |

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
| `nl-overheid-publicaties/` | Standalone NL government publications: Doorverwijsboom (decision tree), Flyer, Informatiebrochure (PDF + MD) |
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
