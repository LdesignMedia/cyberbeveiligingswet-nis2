# NIS2 / Cbw Readiness Checklist for CISOs

Action-oriented checklist mapping NIS2 art. 20–23 + 27 obligations and CIR 2024/2690 requirements to concrete deliverables, evidence, and owners. Use as a baseline gap-analysis instrument and as an audit-prep index.

> **How to use:** Each item is a line of evidence. Mark `[x]` only when the evidence exists, is current, and a named owner can produce it within 24 hours. Re-validate quarterly. Cross-reference to corpus articles in column "Source"; cross-reference to local templates where applicable.

**Legend**: ⚠ = mandatory under primary law (NIS2 + Cbw). 🛠 = mandatory under CIR 2024/2690 (digital infrastructure entities only). 📋 = strong-evidence recommendation, not strictly mandatory.

---

## 0. Scope confirmation

- [ ] ⚠ **Tier classification documented** — Essential vs Important. Source: NIS2 art. 3 + Annex I/II.
- [ ] ⚠ **Sector + sub-sector mapped** to NIS2 Annex entry with article reference.
- [ ] ⚠ **Main establishment** identified (NL or other MS). Source: NIS2 art. 26.
- [ ] 📋 **CIR 2024/2690 applicability** assessed (digital infrastructure / digital provider). Source: [`eu-implementing-regulation/md/cir-2024-2690-NL-html.md`](./eu-implementing-regulation/md/cir-2024-2690-NL-html.md).
- [ ] 📋 **DORA / sector lex specialis** carve-outs documented (financial entities, qualified trust services).
- [ ] 📋 Decision-tree run: [`nl-overheid-publicaties/md/doorverwijsboom-cyberbeveiligingswet.md`](./nl-overheid-publicaties/md/doorverwijsboom-cyberbeveiligingswet.md).
- [ ] 📋 Group structure mapped — each in-scope legal entity registered separately.

## 1. Governance (NIS2 art. 20)

- [ ] ⚠ **Management body has formally approved** the cybersecurity risk-management measures. Evidence: signed board minutes + dated.
- [ ] ⚠ **Management body oversight cadence** scheduled (minimum quarterly). Evidence: board agenda template + meeting minutes.
- [ ] ⚠ **Board training completed** within last 12 months. Evidence: attendance log + training content + assessment scores.
- [ ] 📋 **Annual training plan** for board members documented.
- [ ] 📋 **CISO reporting line** to management body documented (org chart + charter).
- [ ] 📋 **Personal-liability awareness brief** delivered to management body (NIS2 art. 20(1) NL transposition).
- [ ] 📋 Reference: ENISA NIS2 Roles & Skills mapping ([`enisa-guidance/md/ENISA_NIS2_Roles_Skills_ECSF_Mapping.md`](./enisa-guidance/md/ENISA_NIS2_Roles_Skills_ECSF_Mapping.md)).

## 2. Risk-management measures (NIS2 art. 21(2))

Tracker sheet: [`templates/nis2-maatregelen-tracker-template.csv`](./templates/nis2-maatregelen-tracker-template.csv).

### 2.a Risk policies + ISMS

- [ ] ⚠ Information security policy approved + dated.
- [ ] ⚠ Risk-assessment methodology documented (likelihood × impact + tolerance).
- [ ] ⚠ Risk register maintained: [`templates/risico-register-template.csv`](./templates/risico-register-template.csv) + [`templates/risico-register-handleiding.md`](./templates/risico-register-handleiding.md).
- [ ] ⚠ Annual ISMS review with management sign-off.
- [ ] 📋 ISO 27001 (or equivalent) certification or alignment matrix.

### 2.b Incident handling

- [ ] ⚠ Incident response plan + playbooks (per scenario class).
- [ ] ⚠ 24/7 detection capability (in-house SOC, MSSP, or hybrid).
- [ ] ⚠ Incident register with severity taxonomy: [`templates/incident-register-template.csv`](./templates/incident-register-template.csv).
- [ ] ⚠ Reporting trigger criteria mapped to NIS2 art. 23(3) significant-incident definition.
- [ ] 📋 Tabletop exercise within last 12 months (scenario, participants, outcomes documented).
- [ ] 📋 Post-incident review process with lessons-learned register.

### 2.c BCM / DR / Crisis management

- [ ] ⚠ Business impact analysis (BIA) per critical service.
- [ ] ⚠ Recovery time / point objectives (RTO / RPO) documented per service.
- [ ] ⚠ Backup procedures + tested restore (last test ≤ 6 months old).
- [ ] ⚠ Crisis-management plan with named owners + communication tree.
- [ ] 📋 BCP exercise within last 12 months.
- [ ] 📋 ENISA Cyber Stress Test scenario applied: [`enisa-guidance/md/ENISA_Handbook_Cyber_Stress_Tests_v2.0.md`](./enisa-guidance/md/ENISA_Handbook_Cyber_Stress_Tests_v2.0.md).

### 2.d Supply-chain security

- [ ] ⚠ Supplier inventory: [`templates/sub-verwerker-register-template.csv`](./templates/sub-verwerker-register-template.csv).
- [ ] ⚠ Third-party cybersecurity assessment process (questionnaire + tier).
- [ ] ⚠ Contractual security clauses (incident notification, audit rights, sub-processor approval) in standard supplier templates.
- [ ] ⚠ Supplier risk register with risk-treatment decisions.
- [ ] 📋 Critical-supplier exit / portability plan.

### 2.e Secure development + maintenance

- [ ] ⚠ Secure SDLC documented (threat modelling, code review, SAST/DAST, dependency scanning).
- [ ] ⚠ Vulnerability disclosure policy published (security.txt, contact channel).
- [ ] ⚠ Patch management policy with SLA per severity (e.g. critical ≤ 7 days, high ≤ 30 days).
- [ ] 📋 Bug bounty or coordinated disclosure program.

### 2.f Effectiveness assessment

- [ ] ⚠ Internal audit cadence for risk-management measures (annual minimum).
- [ ] ⚠ KPI dashboard with reportable metrics (e.g. patch SLA compliance, MFA coverage, training completion).
- [ ] 📋 External penetration testing within last 12 months for critical services.
- [ ] 📋 Red-team / purple-team exercise within last 24 months.

### 2.g Cyber hygiene + training

- [ ] ⚠ All-staff cybersecurity training completion ≥ 95%, refreshed annually.
- [ ] ⚠ Phishing simulation program with measured click rate.
- [ ] ⚠ Onboarding cybersecurity module mandatory.
- [ ] 📋 Role-specific training (developers, sysadmins, helpdesk) documented.

### 2.h Cryptography

- [ ] ⚠ Encryption policy: at-rest, in-transit, key management, algorithm allow-list.
- [ ] ⚠ Key inventory + rotation schedule.
- [ ] 📋 PQC (post-quantum) inventory + roadmap.

### 2.i HR security + access control + asset management

- [ ] ⚠ Asset inventory: [`templates/asset-inventaris-template.csv`](./templates/asset-inventaris-template.csv).
- [ ] ⚠ Joiner / mover / leaver process with timing SLAs (revoke access ≤ 24h on termination).
- [ ] ⚠ Privileged access management (PAM) for admin accounts.
- [ ] ⚠ Access review cadence (quarterly minimum for privileged): [`templates/access-review-template.csv`](./templates/access-review-template.csv).
- [ ] 📋 Background checks for sensitive roles (where lawful).

### 2.j MFA + secure communications

- [ ] ⚠ MFA enforced for: all remote access, all admin accounts, all SaaS.
- [ ] ⚠ Phishing-resistant MFA (FIDO2 / passkeys) for high-value identities.
- [ ] ⚠ Secure communication channels for emergency operations (out-of-band identified + tested).
- [ ] 📋 MFA fatigue / push bombing mitigation enabled.

## 3. CIR 2024/2690 — digital infrastructure only 🛠

Reference: [`eu-implementing-regulation/md/cir-2024-2690-NL-html.md`](./eu-implementing-regulation/md/cir-2024-2690-NL-html.md), implementation: [`enisa-guidance/md/ENISA_Technical_Implementation_Guidance_v1.0.md`](./enisa-guidance/md/ENISA_Technical_Implementation_Guidance_v1.0.md).

- [ ] 🛠 13 thematic CIR areas mapped 1:1 to internal controls.
- [ ] 🛠 ENISA Tech Guidance evidence rows completed for each CIR measure.
- [ ] 🛠 Service availability targets meet CIR sector thresholds.
- [ ] 🛠 Significant-incident thresholds parameterized per CIR (e.g. % of users affected × hours of unavailability).
- [ ] 🛠 Detection + logging coverage meets CIR retention minima.
- [ ] 🛠 Network segmentation evidence for production, management, customer planes.

## 4. Incident reporting (NIS2 art. 23)

- [ ] ⚠ **24-hour early warning** template prepared + responsible role assigned.
- [ ] ⚠ **72-hour incident notification** template prepared with severity + impact + IoC sections.
- [ ] ⚠ **1-month final report** template prepared with root cause + mitigation sections.
- [ ] ⚠ Reporting channel to **NCSC-NL** (or sector CSIRT) tested in last 12 months.
- [ ] ⚠ Recipient-notification policy for incidents likely to affect service users (NIS2 art. 23(2)).
- [ ] ⚠ Public-disclosure trigger criteria documented.
- [ ] 📋 24/7 contact roster maintained at NCSC-NL portal.
- [ ] 📋 Cross-border notification matrix (which Member States, which authorities) documented for in-scope EU operations.

## 5. Registration (NIS2 art. 27)

- [ ] ⚠ Entity registered at NCSC-NL portal (or sector authority) within registration window.
- [ ] ⚠ Registration data current: legal name, sector, contact, services, MS where services provided.
- [ ] ⚠ Registration update process when material changes occur.
- [ ] 📋 Register entry verified after Cbw entry-into-force date.

## 6. Documentation + evidence

- [ ] ⚠ Single index linking each art. 21(2) area to: policy, procedure, implementation evidence, effectiveness evidence, improvement evidence (5 columns minimum).
- [ ] ⚠ Document version control + retention (≥ 5 years for security-relevant artefacts).
- [ ] 📋 Read-only audit-evidence vault separate from operational systems.
- [ ] 📋 Pre-flight audit trail walkthrough (CISO → auditor mock-run) within last 6 months.

## 7. Adjacent regimes

- [ ] 📋 GDPR ↔ NIS2 incident notification dual-track procedure (AP within 72h vs NCSC-NL 24h/72h/1mo).
- [ ] 📋 DORA carve-out documented (financial entities) — NIS2 art. 21/23 superseded for in-scope FIs.
- [ ] 📋 eIDAS overlap documented for trust service providers (if applicable).
- [ ] 📋 CER ↔ NIS2 alignment for entities also designated under Wwke.

## 8. Continuous improvement

- [ ] 📋 Quarterly metrics review with management body.
- [ ] 📋 Annual external assessment (audit, pen-test, or NIS2 maturity benchmark).
- [ ] 📋 Threat intelligence subscription (ENISA, NCSC-NL, sector ISAC).
- [ ] 📋 Lessons-learned register integrated into next-cycle risk treatment.

---

## Quick scoring

Count ⚠ items: ___ / total ⚠ items
Count 🛠 items: ___ / total 🛠 items (digital infrastructure only)
Count 📋 items: ___ / total 📋 items

**Readiness rule of thumb**:
- < 50% of ⚠ items checked: not ready, expect supervisory action.
- 50–80% of ⚠ items: bridge plan with named milestones must exist before Cbw entry-into-force.
- ≥ 80% of ⚠ items + ≥ 70% of 🛠 (where applicable): defensible posture; refine evidence quality + run audit dry-run.

## See also

- [`README.md`](./README.md) — corpus overview.
- [`FAQ-compliance-officers.md`](./FAQ-compliance-officers.md) — Q&A explanations behind these checks.
- [`GLOSSARY.md`](./GLOSSARY.md) — definitions.
- [`TIMELINE.md`](./TIMELINE.md) — deadlines.
- [`templates/`](./templates/) — CSV/XLSX program artefacts.
