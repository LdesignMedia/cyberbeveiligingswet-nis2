# NIS2 / Cyberbeveiligingswet — LLM Resource Index

Curated corpus on EU NIS2 Directive + Dutch implementation (Cyberbeveiligingswet / Wet weerbaarheid kritieke entiteiten). All source documents converted to markdown for LLM consumption.

**Scope:** EU primary law, Commission implementing regulation, ENISA technical guidance, NL primary + secondary law, NL government guidance.

**Reading priority for LLM context:**
1. NIS2 Directive (2022/2555) — the regime itself
2. CIR 2024/2690 — binding technical requirements for digital infra
3. Cyberbeveiligingswet (Cbw) wetsvoorstel — NL transposition
4. Cyberbeveiligingsbesluit (AMvB) — NL details on duty of care, reporting, registration
5. ENISA Technical Implementation Guidance — practical mapping of CIR
6. NCSC.nl FAQ + flowchart — entity-side practical guidance

---

## 1. EU Primary Law

### NIS2 Directive (EU) 2022/2555
14 December 2022. Cybersecurity baseline across Union. Replaces NIS1 (2016/1148). Transposition deadline 17 Oct 2024. Defines essential vs important entities, art. 21 risk-management measures, art. 23 incident reporting.

- **Best NL:** [`nis2-directive-nl.md`](./nis2-directive-nl.md) (cleaned HTML conversion, 1802 lines)
- **NL alt (PDF-derived):** `eu-directives/md/nis2-2022-2555-NL.md`
- **EN (HTML):** `eu-directives/md/nis2-2022-2555-EN-html.md` (canonical EN render)
- **EN (PDF):** `eu-directives/md/nis2-2022-2555-EN-pdf.md` (PDF-derived alt)
- Originals: `eu-directives/nis2-2022-2555-{NL,EN}.{pdf,html}`

### CER Directive (EU) 2022/2557
Sister directive. Resilience of critical entities (physical + organisational). NL transposition: Wet weerbaarheid kritieke entiteiten (Wwke).

- **NL (HTML):** `eu-directives/md/cer-2022-2557-NL-html.md` (canonical NL render)
- **NL (PDF):** `eu-directives/md/cer-2022-2557-NL-pdf.md` (PDF-derived alt)
- **EN:** `eu-directives/md/cer-2022-2557-EN.md`
- Originals: `eu-directives/cer-2022-2557-{NL,EN}.{pdf,html}`

## 2. EU Implementing Regulation

### CIR (EU) 2024/2690 — Technical & methodological cybersecurity requirements
17 October 2024. Binding for: DNS providers, TLD registries, cloud, datacenter, CDN, MSP, MSSP, online marketplaces, search engines, social networks, trust services. 13 thematic areas covering governance, operational, technical measures.

- **NL (HTML):** `eu-implementing-regulation/md/cir-2024-2690-NL-html.md` (canonical)
- **NL (PDF):** `eu-implementing-regulation/md/cir-2024-2690-NL-pdf.md`
- **EN (HTML):** `eu-implementing-regulation/md/cir-2024-2690-EN-html.md` (canonical)
- **EN (PDF):** `eu-implementing-regulation/md/cir-2024-2690-EN-pdf.md`
- Originals: `eu-implementing-regulation/cir-2024-2690-{NL,EN}.{pdf,html}`

## 3. ENISA Guidance (non-binding, June 2025)

| File | Description |
|------|-------------|
| `enisa-guidance/md/ENISA_Technical_Implementation_Guidance_v1.0.md` | 170 pp. Translates CIR 2024/2690 into practical measures + evidence. Primary technical reference. |
| `enisa-guidance/md/ENISA_NIS2_Roles_Skills_ECSF_Mapping.md` | 32 pp. Maps NIS2 art. 21 + 23 to ECSF role profiles. |
| `enisa-guidance/md/ENISA_Handbook_Cyber_Stress_Tests_v2.0.md` | 27 pp. Methodology for sectoral / EU-level stress tests. |

## 4. NL Primary Law — Cyberbeveiligingswet (Cbw) + Wwke

Tweede Kamer adopted 2026-04-15. Expected entry into force ~Q2 2026.

| File | Description |
|------|-------------|
| `nl-wetsvoorstel/md/cbw-wetsvoorstel-detail.md` | TK overview wetsvoorstel 36764 (Cbw) |
| `nl-wetsvoorstel/md/wwke-wetsvoorstel-detail.md` | TK overview wetsvoorstel 36765 (Wwke) |
| `nl-wetsvoorstel/md/cbw-2025D26060.md` | Wetsvoorstel + memorie van toelichting |
| `nl-wetsvoorstel/md/cbw-2025D26103.md` | Cbw + Wwke gerelateerd kamerstuk |
| `nl-wetsvoorstel/md/cbw-2025D45516.md` | Nota van wijziging |
| `nl-wetsvoorstel/md/cbw-2025D45518.md` | Brief minister J&V |

## 5. NL Secondary Law — Lower regulations

### Cyberbeveiligingsbesluit (AMvB onder Cbw)
Consultation 20 Feb – 30 March 2025.

| File | Description |
|------|-------------|
| `nl-amvb-consultatie/md/ontwerp-cyberbeveiligingsbesluit.md` | Draft AMvB text |
| `nl-amvb-consultatie/md/nota-van-toelichting-cbb.md` | Explanatory memorandum |
| `nl-amvb-consultatie/md/ministeriele-regeling-cbb.md` | Draft ministerial regulation |
| `nl-amvb-consultatie/md/beleidskompas-cbb.md` | Policy compass |

### Besluit Wwke
Sister AMvB.

| File | Description |
|------|-------------|
| `nl-amvb-consultatie-wwke/md/ontwerpbesluit-wwke.md` | Draft AMvB text |
| `nl-amvb-consultatie-wwke/md/nota-van-toelichting-wwke.md` | Explanatory memorandum |
| `nl-amvb-consultatie-wwke/md/beleidskompas-wwke.md` | Policy compass |

## 6. NL Government Guidance

### NCSC.nl + Digital Trust Center
Entity-side practical guidance.

| File | Description |
|------|-------------|
| `ncsc-nl/md/www.ncsc.nl_cyberbeveiligingswet-nis2.md` | NCSC Cbw landing |
| `ncsc-nl/md/www.ncsc.nl_cyberbeveiligingswet-nis2_over-de-cbw.md` | Over de Cbw |
| `ncsc-nl/md/www.ncsc.nl_cyberbeveiligingswet-nis2_flowchart-registratieplicht-nis2-entiteit.md` | Registratieplicht flowchart |
| `ncsc-nl/md/www.ncsc.nl_cyberbeveiligingswet-nis2_faq-cyberbeveiligingswet-nis2.md` | FAQ |
| `ncsc-nl/md/www.ncsc.nl_over-ncsc_wettelijke-taak_wat-gaat-de-nis2-richtlijn-betekenen-voor-uw-organisatie_samenvatting-nis2-richtlijn.md` | NIS2 samenvatting |
| `ncsc-nl/md/www.digitaltrustcenter.nl_wat-is-de-nis2-richtlijn.md` | DTC NIS2 explainer |

### NL Government Publications

Standalone NL government brochures and decision aids (not Tweede Kamer kamerstukken).

| File | Description |
|------|-------------|
| `nl-overheid-publicaties/md/doorverwijsboom-cyberbeveiligingswet.md` | Decision tree — does Cbw apply? |
| `nl-overheid-publicaties/md/flyer-cyberbeveiligingswet.md` | Flyer |
| `nl-overheid-publicaties/md/informatiebrochure-cyberbeveiligingswet.md` | Info brochure |

## 7. EU Commission Pages

| File | Description |
|------|-------------|
| `eu-cooperation-group/md/nis2-directive-policy-page.md` | digital-strategy.ec.europa.eu NIS2 hub |
| `eu-cooperation-group/md/nis2-directive-faqs.md` | Official Commission NIS2 FAQ |
| `eu-cooperation-group/md/nis-cooperation-group-page.md` | NIS Cooperation Group page |
| `eu-cooperation-group/md/nis2-transposition-tracker.md` | NIS2 transposition by Member State |

---

## Usage hints for LLM

- For binding obligations on a digital service provider: NIS2 Directive + CIR 2024/2690 + ENISA Tech Guidance.
- For "does my org fall under Cbw?": NCSC flowchart + Doorverwijsboom + Cbw wetsvoorstel scope (art. 2-5).
- For incident reporting: NIS2 art. 23 + CIR art. on significant incidents + Cbw art. on meldplicht + Cyberbeveiligingsbesluit.
- For governance/board duties: NIS2 art. 20 + Cbw zorgplicht + Cyberbeveiligingsbesluit board training.

Use plain markdown files in `md/` subfolders. Originals (PDF/HTML) kept alongside for reference.
