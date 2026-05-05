# FAQ for Compliance Officers (NIS2 / Cbw)

Practical Q&A for compliance officers, DPOs, CISOs, and program managers preparing for the Dutch Cyberbeveiligingswet (Cbw) and NIS2. Answers cite the most authoritative source available in this corpus and link to the canonical NCSC / EUR-Lex location for verification.

> **Disclaimer:** Not legal advice. Cbw + AMvBs are not yet in force at the time of this corpus snapshot ([`INVENTORY.md`](./INVENTORY.md) — `Retrieved 2026-04-26`). Verify against the live source before relying on any answer for board-level decisions.

---

## Scope & applicability

### Q1. Does my organization fall under the Cbw?

Three tests, in order:

1. **Sector test.** Are you in one of the NIS2 Annex I (essential) or Annex II (important) sectors? See NIS2 art. 2 + Annexes ([`eu-directives/md/nis2-2022-2555-NL.md`](./eu-directives/md/nis2-2022-2555-NL.md)).
2. **Size test.** Medium or large entity (≥ 50 employees OR ≥ €10M annual turnover/balance sheet)? Smaller entities may still be in scope where they meet sector-specific criteria (e.g. sole DNS provider, qualified trust service provider, public administration).
3. **Establishment test.** Is your main establishment in NL, or do you provide in-scope services in NL?

If yes to all three, follow the NL decision tree:
- [`nl-overheid-publicaties/md/doorverwijsboom-cyberbeveiligingswet.md`](./nl-overheid-publicaties/md/doorverwijsboom-cyberbeveiligingswet.md)
- [`ncsc-nl/md/www.ncsc.nl_cyberbeveiligingswet-nis2_flowchart-registratieplicht-nis2-entiteit.md`](./ncsc-nl/md/www.ncsc.nl_cyberbeveiligingswet-nis2_flowchart-registratieplicht-nis2-entiteit.md)

### Q2. Are we essential or important?

| Tier | Where to look |
|------|---------------|
| **Essential** | NIS2 Annex I — energy, transport, banking, financial market infrastructures, health, drinking water, wastewater, digital infrastructure, ICT service management (B2B), public administration, space. |
| **Important** | NIS2 Annex II — postal/courier, waste, manufacture/production/distribution of chemicals, food production/processing/distribution, manufacturing (medical devices, computers/electronics, machinery, motor vehicles, other transport), digital providers (online marketplaces, online search engines, social networking platforms), research. |

Tier governs supervision intensity and maximum fines (see Q12).

### Q3. We're a small business (SME) in a sector. Are we in?

By default, no — NIS2 applies to medium + large entities. **Exceptions** (smaller entities still in scope) include: sole providers of a critical service in a Member State, public electronic communications networks/services, trust service providers, TLD name registries, DNS service providers (excluding root servers), public administration entities, certain healthcare providers. Confirm via Q1 decision tree.

### Q4. Multiple subsidiaries — do we register once or per entity?

Each in-scope legal entity registers separately under NIS2 art. 27. Group-level cybersecurity programs are useful evidence of compliance but do not collapse the registration obligation.

### Q5. We operate cross-border in the EU. Which Member State supervises us?

NIS2 art. 26: jurisdiction follows main establishment. For specific digital providers (cloud, DNS, TLD, datacentre, CDN, MSP, MSSP, online marketplaces, search engines, social networks), main establishment is where decisions on cybersecurity risk-management measures are predominantly taken. Default fallback: where the entity has the largest number of employees in the EU.

---

## Obligations

### Q6. What are we actually required to do?

Four obligation pillars (see [`README.md`](./README.md) "About NIS2 in 60 seconds"):

1. **Risk-management measures** — NIS2 art. 21 (10 mandatory areas).
2. **Incident reporting** — NIS2 art. 23 (24h / 72h / 1mo phased).
3. **Governance** — NIS2 art. 20 (board approval + oversight + training).
4. **Registration** — NIS2 art. 27 (self-register with NCSC-NL).

Detail in [`nl-amvb-consultatie/md/ontwerp-cyberbeveiligingsbesluit.md`](./nl-amvb-consultatie/md/ontwerp-cyberbeveiligingsbesluit.md) once the Cyberbeveiligingsbesluit is in force.

### Q7. What does "appropriate and proportionate" mean for risk-management measures?

NIS2 art. 21(1) calibrates measures against:
- Degree of exposure to risks
- Entity size
- Likelihood + severity of incidents (including societal/economic impact)

State of the art and cost are factors. The 10 mandatory areas in art. 21(2) are non-negotiable in *type*, but specific implementation depth scales with the calibration.

For **digital infrastructure entities** (Q9), CIR 2024/2690 fixes the floor — measures are not just "appropriate," they are spelled out with binding specificity.

### Q8. What are the 10 mandatory measure areas (art. 21(2))?

| # | Area | NL term |
|---|------|---------|
| a | Risk analysis + information system security policies | Risico-analyse + beleid |
| b | Incident handling | Incidentenbehandeling |
| c | Business continuity (backup, disaster recovery, crisis management) | BCM/DR/crisismanagement |
| d | Supply-chain security | Toeleveringsketenbeveiliging |
| e | Security in network/info-system acquisition, development, maintenance | Veilig ontwikkelen + onderhoud |
| f | Policies + procedures to assess effectiveness of risk-management measures | Effectiviteitsbeoordeling |
| g | Basic cyber hygiene + cybersecurity training | Basis-hygiëne + training |
| h | Cryptography + encryption policies | Cryptografie |
| i | HR security, access control, asset management | HR security + asset management |
| j | MFA, secure voice/video/text comms, secure emergency comms | MFA + secure comms |

Map controls 1:1 to these in your ISMS.

### Q9. We're a cloud / DNS / MSP / SaaS — are we under CIR 2024/2690?

If you are listed in NIS2 Annex I point 8 (digital infrastructure) or Annex II point 6 (digital providers excluding online marketplaces are also in scope of CIR via separate articles), **yes** — CIR 2024/2690 binds you with technical specifics. See:

- [`eu-implementing-regulation/md/cir-2024-2690-NL-html.md`](./eu-implementing-regulation/md/cir-2024-2690-NL-html.md)
- [`enisa-guidance/md/ENISA_Technical_Implementation_Guidance_v1.0.md`](./enisa-guidance/md/ENISA_Technical_Implementation_Guidance_v1.0.md) — practical mapping of each CIR area to evidence.

### Q10. What about supply-chain / third-party risk?

NIS2 art. 21(2)(d) requires entities to address security in their direct supplier and service-provider relationships, including:
- Vulnerability handling and disclosure of suppliers
- Quality of cybersecurity products and procedures of suppliers
- Secure development practices

The Cooperation Group has issued sector-specific risk assessments (e.g. ICT supply chain). Practical implementation: include cybersecurity in procurement criteria, require contractual security obligations, audit rights where feasible, supplier inventory.

---

## Incident reporting

### Q11. What counts as a "significant incident"?

NIS2 art. 23(3) — an incident is significant if it:
- Has caused or is capable of causing **severe operational disruption** of services or financial loss for the entity, OR
- Has affected or is capable of affecting **other natural or legal persons** by causing considerable material or non-material damage.

The Cooperation Group is finalizing thresholds; CIR 2024/2690 contains specific thresholds for digital infrastructure (e.g. service unavailability percentages × duration). Internal trigger criteria should map to the CIR thresholds where applicable, otherwise fall back to art. 23(3).

### Q12. What's the reporting timeline?

| Phase | Deadline | Content |
|-------|----------|---------|
| **Early warning** | ≤ 24 h after awareness | Suspected unlawful/malicious cause; possible cross-border impact. |
| **Incident notification** | ≤ 72 h after awareness | Initial assessment, severity + impact, indicators of compromise (IoCs) where available. |
| **Intermediate report** | On request from CSIRT/competent authority | — |
| **Final report** | ≤ 1 month after notification | Detailed description, root cause, applied + ongoing mitigation, cross-border impact. |
| **Progress report** | Where incident is ongoing at 1-month mark | Status report instead of final; final report ≤ 1 month after handling concluded. |

Report to NL CSIRT / competent authority. For most non-financial in-scope entities: **NCSC-NL**. Financial sector: DNB / AFM under DORA.

### Q13. Do we have to inform recipients of our services?

NIS2 art. 23(2): yes — if a significant incident is likely to adversely affect the provision of services, entities **shall communicate without undue delay** to recipients potentially affected and inform them of measures or remedies they can take. Where appropriate, also publicly disclose for cybersecurity purposes.

### Q14. Are there fines for late or missed reports?

Yes. Failure to report is enforceable separately from the underlying incident. See Q19 for fine ranges.

---

## Governance & board duties

### Q15. What does the board need to do under art. 20?

Three concrete duties:

1. **Approve** the cybersecurity risk-management measures.
2. **Oversee** their implementation.
3. **Follow training** to gain sufficient knowledge and skills to identify risks and assess cybersecurity risk-management practices.

Member States may require extension of training to all employees on a regular basis.

### Q16. Personal liability for board members?

NIS2 art. 20(1) explicitly allows Member States to make management bodies personally liable for breaches. The Cbw + Cyberbeveiligingsbesluit (when in force) will detail the NL transposition. Until then, treat personal liability as a realistic prospect for material non-compliance.

### Q17. What training counts?

NIS2 art. 20(2) requires training "regularly" with content sufficient to:
- Gain knowledge of cybersecurity risk-management practices
- Identify risks
- Assess management's risk-management practices and their impact on services

ENISA's *Cybersecurity Roles and Skills for NIS2 Essential and Important Entities* publication ([`enisa-guidance/md/ENISA_NIS2_Roles_Skills_ECSF_Mapping.md`](./enisa-guidance/md/ENISA_NIS2_Roles_Skills_ECSF_Mapping.md)) maps obligations to ECSF role profiles — useful as a gap-analysis reference.

---

## Enforcement & supervision

### Q18. Who supervises us?

| Sector | NL competent authority |
|--------|------------------------|
| Digital infrastructure (DNS, cloud, datacentre, etc.) | RDI (Rijksinspectie Digitale Infrastructuur) |
| Energy | ACM (NL energy regulator) sectoral leads |
| Transport | ILT (Inspectie Leefomgeving en Transport) |
| Healthcare | IGJ (Inspectie Gezondheidszorg en Jeugd) |
| Drinking water / wastewater | ILT + sector authorities |
| Banking / financial market infra | DNB / AFM (under DORA + Cbw coordination) |
| Public administration | Internally (BZK) + auditing bodies |
| Other | TBD — see Cyberbeveiligingsbesluit |

NCSC-NL: registration + national CSIRT role.

### Q19. What are the maximum fines?

| Tier | Cap |
|------|-----|
| **Essential entity** | The higher of **€10,000,000** or **2% of global annual turnover** in the prior fiscal year. |
| **Important entity** | The higher of **€7,000,000** or **1.4% of global annual turnover**. |

Fines apply per breach. Member States may impose additional administrative measures.

### Q20. Can supervision force us to disclose internally?

Yes. Essential entities face proactive supervision (audits, on-site inspections, security scans, requests for information, requests to prove implementation). Important entities face reactive supervision (investigation only after evidence of non-compliance or significant incident). Both can be ordered to publish notices about identified breaches.

---

## Practical compliance program

### Q21. Where should we start a compliance program from scratch?

Suggested 90-day path:

1. **Days 1–14: Scope confirmation.** Run Q1 decision tree. Document tier, primary establishment, applicable Annex.
2. **Days 15–30: Gap analysis.** Map current ISMS / ISO 27001 / NIS1 (Wbni) coverage to NIS2 art. 21(2)(a-j). Use [`templates/nis2-maatregelen-tracker-template.csv`](./templates/nis2-maatregelen-tracker-template.csv).
3. **Days 31–45: Asset + supplier inventory.** [`templates/asset-inventaris-template.csv`](./templates/asset-inventaris-template.csv) + [`templates/sub-verwerker-register-template.csv`](./templates/sub-verwerker-register-template.csv).
4. **Days 46–60: Incident-handling readiness.** Reporting playbook with 24h/72h/1mo timeline. Tabletop exercise. [`templates/incident-register-template.csv`](./templates/incident-register-template.csv).
5. **Days 61–75: Risk register + remediation roadmap.** [`templates/risico-register-template.csv`](./templates/risico-register-template.csv) + [`templates/risico-register-handleiding.md`](./templates/risico-register-handleiding.md).
6. **Days 76–90: Board engagement.** Brief management body, schedule training, secure formal approval of measures. Document approval.

### Q22. We have ISO 27001 — are we done?

ISO 27001 covers ~70-80% of NIS2 art. 21 ground but does not satisfy:
- Specific incident reporting timelines + recipients (NIS2 art. 23)
- Registration with NCSC-NL (NIS2 art. 27)
- Board training duty (NIS2 art. 20)
- CIR 2024/2690 specifics for digital infrastructure (where applicable)
- Supply-chain measures with the depth NIS2 art. 21(2)(d) implies

Treat ISO 27001 as a strong baseline + delta-map the gaps.

### Q23. We're already DORA-regulated (financial sector). Do we need to do NIS2 too?

DORA is **lex specialis** for financial entities — its art. 21/23 equivalents supersede NIS2 for in-scope FIs. You still register and engage with the sectoral authority, but the substantive risk-management + incident reporting obligations follow DORA. Confirm with DNB/AFM.

### Q24. We're already GDPR-mature. How does that map?

GDPR + NIS2 overlap on:
- Personal data breach reporting (GDPR art. 33 = AP within 72h)
- Confidentiality/integrity controls (GDPR art. 32 ↔ NIS2 art. 21(2)(a-j) subset)

They differ on:
- NIS2 covers all incidents affecting service availability — not just personal data.
- NIS2 has a 24h early warning ahead of the 72h notification.
- NIS2 has board-level liability hooks GDPR doesn't.

Run two parallel reporting tracks: AP for personal data, NCSC-NL for cyber.

### Q25. How should we structure evidence for an audit?

Each art. 21(2)(a-j) area should have:

- **Policy** — approved + dated document.
- **Procedure** — operational steps.
- **Implementation evidence** — logs, screenshots, config exports, training records.
- **Effectiveness evidence** — test results, metrics, KPI trends.
- **Improvement evidence** — change records, remediation tickets.

Use [`templates/nis2-maatregelen-tracker-template.csv`](./templates/nis2-maatregelen-tracker-template.csv) as the evidence index.

---

## Timing

### Q26. When does the Cbw enter into force?

Tweede Kamer adopted on 2026-04-15. Eerste Kamer + entry-into-force expected ~Q2 2026 (~July 1, provisional). See [`TIMELINE.md`](./TIMELINE.md) for the full milestone view.

### Q27. Is NIS2 already binding on us regardless of NL transposition delay?

**Direct effect** is limited:
- **Directives** (NIS2, CER) generally do **not** have horizontal direct effect — they bind Member States to transpose, but private parties cannot rely on them in court against other private parties before transposition. Some vertical effect against the State exists.
- **Regulations** (CIR 2024/2690) are **directly applicable** in all Member States from their stated entry-into-force date. **CIR 2024/2690 binds digital infrastructure entities now**, regardless of NL Cbw status.

If you are a digital infrastructure entity, treat CIR as in force today. For non-digital-infra essential/important entities, plan for Cbw entry-into-force; supervisors are unlikely to wait long after that date.

---

## See also

- [`README.md`](./README.md) "About NIS2 in 60 seconds"
- [`GLOSSARY.md`](./GLOSSARY.md) — term definitions
- [`TIMELINE.md`](./TIMELINE.md) — key dates
- [`INDEX.md`](./INDEX.md) — curated reading order
- [`templates/`](./templates/) — compliance program artifacts
- NCSC FAQ (more entity-side detail): [`ncsc-nl/md/www.ncsc.nl_cyberbeveiligingswet-nis2_faq-cyberbeveiligingswet-nis2.md`](./ncsc-nl/md/www.ncsc.nl_cyberbeveiligingswet-nis2_faq-cyberbeveiligingswet-nis2.md)
