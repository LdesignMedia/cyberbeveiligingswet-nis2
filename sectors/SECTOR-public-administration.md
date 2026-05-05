# NIS2 Public Administration Sector Guide

**Scope:** Central government departments, agencies, provincial government entities, municipalities (gemeenten), water boards (waterschappen), and independent government bodies (ZBOs). NL has exercised Member State discretion under NIS2 art. 2(10) to extend scope beyond central government to local and regional public administration.

**Audience:** Government CISOs, compliance officers, incident-response teams, procurement teams, municipal IT directors, BZK and IBD coordinators.

---

## Are you in scope?

Your organization falls under NIS2 Public Administration (Annex I point 10) and NL Cyberbeveiligingswet scope extension if you are:

| Entity type | Scope indicator | Tier |
|-------------|-----------------|------|
| **Central government department** | Ministry, central agency (e.g., Ministry of Interior & Kingdom Relations, tax office, passport office). | **Essential** |
| **Provincial government (provincie)** | Provinciale overheid providing public services, infrastructure, governance. | **Essential** (per NL extension) |
| **Municipality (gemeente)** | Local authority providing citizen services (uitkeringen, vergunningen, BRP, paspoort, belastingen). | **Essential** (per NL extension) |
| **Water board (waterschap)** | Regional water management authority providing drinking water, wastewater, water defense. | **Essential** (per NL extension) |
| **Independent government body (ZBO)** | Autonomous public agency (e.g., RDI, RVO, CIBG, Logius). | **Essential** |
| **Judiciary** | Courts, prosecutors. Typically **excluded** unless specifically designated by NL government. |
| **Parliament** | Tweede Kamer, Eerste Kamer. Typically **excluded**. |
| **Central bank** | De Nederlandsche Bank. Typically **excluded** unless designated as critical. |

**SME Exception:** No size exemption. All public administration entities are in scope regardless of employee count or budget.

**Tier:** All public administration entities are **Essential tier**. Proactive supervision applies.

---

## NL competent authorities & CSIRT roles

**Central government:**
- **BZK (Ministerie van Binnenlandse Zaken en Koninkrijksrelaties)** — internal supervision of central government ministries and agencies.
- **NCSC-NL (Nationaal Cyber Security Centrum)** — national CSIRT; registers central government entities; receives 24h early warning, 72h incident notifications.

**Local government (gemeenten):**
- **IBD (Informatiebeveiligingsdienst voor gemeenten)** — operates under VNG (Vereniging van Nederlandse Gemeenten). Coordinates cybersecurity for municipalities.
- **IBD as gemeente CSIRT** — receives municipality incident reports; escalates to NCSC-NL where needed.
- **VNG** — supports municipalities on Cbw compliance guidance, awareness, procurement standards.

**Water boards:**
- **Unie van Waterschappen** — sectoral coordinating body. Developing shared CSIRT and incident-handling protocols.
- **Incident reporting:** Direct to NCSC-NL; copy to Unie for sectoral coordination.

**Provinces:**
- **Provincie IT coordinators** coordinate with BZK and NCSC-NL.
- Incident reporting: Direct to NCSC-NL.

---

## NL adjacent compliance regimes

### BIO — Baseline Informatiebeveiliging Overheid

**What it is:** Mandatory baseline security standard for all NL government entities (central, provincial, municipal). Predates NIS2; updated regularly.

**Overlap with NIS2:** Strong alignment with NIS2 art. 21(2) risk-management measures. BIO covers:
- Asset management
- Access control
- Encryption
- Incident handling
- Business continuity
- Network segmentation

**Practical implication:** Entities meeting BIO maturity level (e.g., BIO 3) will satisfy much of NIS2 art. 21. Delta-map BIO → NIS2 to confirm gaps (board training, registration, specific incident-reporting timelines).

**Reference:** [`nl-overheid-publicaties/`](../nl-overheid-publicaties/) for BIO documentation and maturity models.

---

### AVG / UAVG (GDPR & NL Privacy Law)

**Overlap:** Processing citizen personal data (BRP, taxes, permits, benefits). GDPR art. 32 (data security) echoes NIS2 art. 21(2) controls.

**Dual-track incident reporting:**
- **AP (Autoriteit Persoonsgegevens)** — within 72h for personal data breaches (GDPR art. 33).
- **NCSC-NL** — within 24h (early warning) / 72h (full notification) for cybersecurity incidents (NIS2 art. 23).
- **Non-breach incidents (e.g., DDoS, ransomware) not affecting personal data** → NIS2 track only, but may still meet GDPR notification threshold if data confidentiality/integrity compromised.

**Process:** Joint incident assessment: is personal data affected? → dual-track; otherwise NIS2-only.

---

### Wet open overheid (Woo) — Transparency Law

**What it is:** Requires government to publish public data and respond to freedom-of-information requests (successor to WOB).

**Connection to NIS2:** Post-incident disclosure. When a significant incident affects public services, Woo transparency obligations may require fuller disclosure than commercial peers:
- Incident details, timeline, affected services.
- Remediation steps.
- Risk mitigation for future incidents.

**Practical implication:** Prepare incident-communication templates that balance transparency with not leaking attacker tactics. Consult legal counsel on Woo obligations early in incident response.

---

### Wet digitale overheid (Wdo) — Digital Government Law

**What it is:** Mandates digital accessibility and service delivery for government entities.

**Connection to NIS2:** Service availability obligations. Incidents causing outages of digital services (DigiD, MijnOverheid, permit portals, benefit applications) have broader impact:
- Citizens unable to access essential services.
- Economic/social impact.
- Regulatory deadlines missed (passport, permit approvals).

**Practical implication:** Include availability metrics in your risk register and incident severity thresholds. DigiD or BRP outages are almost always "significant incidents" under NIS2.

---

### Logius Services — Critical Shared Infrastructure

**What they are:** Logius operates several government-wide platforms:
- **DigiD** — citizen login service (2FA, eIDAS integration).
- **BSNk (Burgerservicenummer)** — citizen ID number infrastructure.
- **MijnOverheid** — government service portal aggregation.
- **Digipoort** — business-to-government secure messaging.

**Dependency risk:** Hundreds of government entities (central, provincial, municipal) depend on Logius. A Logius outage cascades:
- Municipal permit systems offline.
- Tax/benefits systems fail.
- Healthcare providers using DigiD cannot serve patients.

**Practical implication:**
- Monitor Logius status pages; include in your BCM assumptions.
- Document Logius as a critical third-party; assess contractual SLAs and incident-response commitments.
- Test fallback authentication (non-DigiD pathways) in incident scenarios.
- Participate in Logius supplier risk assessments and joint security initiatives.

---

### eIDAS — Trust Services & Digital Signatures

**What it is:** EU regulation on trust services (digital signatures, certificates, timestamps, seals).

**Connection to NIS2:** Qualified trust service providers (e.g., Logius DigiD high-assurance, government certificate authorities) are in scope of eIDAS + NIS2. Government entities relying on eIDAS signatures:
- Must validate signature certificates properly.
- Must follow ETSI standards for timestamp validation.
- Must report eIDAS-relevant security incidents to eIDAS supervisors (in NL: OPTA/ACM).

**Practical implication:** If your service issues or validates digital signatures, coordinate incident reporting with eIDAS authority in addition to NCSC-NL.

---

## Top sector-specific risks

**Ransomware against gemeenten:**
- Gemeenten are frequent targets (publicly disclosed incidents in Utrecht, Haarlem, other municipalities). High-profile impact: passports, permits, benefits offline.
- **Mitigation:** Segmented networks, immutable backups (versioning >= 7 days), offline recovery media, incident-response SLAs for critical systems.

**Citizens' personal data exposure (BRP, taxes, benefits):**
- Broad exposure of citizen IDs, SSNs (BSN), tax records, benefit amounts.
- **Mitigation:** Encryption at-rest/in-transit, access controls limiting who can query citizen data, audit logging, regular data inventories.

**Service unavailability cascading from shared platforms:**
- DigiD outage = dozens of municipal services offline; citizens cannot apply for permits, access benefits.
- BRP unavailability = passport offices cannot verify identity.
- **Mitigation:** Document dependencies on Logius/shared platforms in BCM; establish alternative authentication/lookup procedures; test failover.

**Legacy line-of-business applications with end-of-life support:**
- Many gemeenten still run custom-developed applications from the 1990s–2010s with small vendor support teams or no vendor at all.
- **Mitigation:** Inventory applications, assess vendor viability, patch management SLAs, web-application firewalls for older apps, consider modernization roadmap.

**Supply-chain via shared SaaS platforms:**
- Multiple gemeenten use the same cloud-hosted permitting system, tax system, or benefits platform (e.g., Gemeente Servicecentrum, TaxCloud, NCOD).
- **Mitigation:** Supplier risk assessment of shared platforms; contractual incident-notification SLAs; participation in joint security reviews.

**Insider risk in social-services teams:**
- Large teams (100+) with broad citizen-data access (benefits, housing, childcare) create insider-threat surface.
- **Mitigation:** Access reviews (quarterly+), privileged access management (PAM) for bulk-export functions, audit logging, background checks (where lawful).

**Third-party hosters in shared government clouds:**
- Many gemeenten host systems on "Overheidsdatacenter" or similar shared-tenant clouds, creating multi-tenant isolation risks.
- **Mitigation:** Contractual separation guarantees, encryption between tenants, network segmentation, audit of hoster's access controls.

**Governance & political pressure:**
- Aldermen and burgemeesterscollege may require rapid service re-enablement post-incident, overriding security containment.
- **Mitigation:** Board training on incident-response governance, documented escalation procedures, incident-response playbooks with political stakeholder approval pre-incident.

---

## Quick-win checklist

- [ ] **BIO maturity assessment** — Use BIO maturity model as baseline; identify NIS2 deltas (board training, incident-reporting timelines, registration).
- [ ] **Asset inventory including SaaS** — Include all government systems, cloud subscriptions (Office 365, Salesforce, shared platforms). Reference: [`templates/asset-inventaris-template.csv`](../templates/asset-inventaris-template.csv).
- [ ] **MFA on all admin + citizen-facing portals** — FIDO2 for staff; consider passkeys for citizen portals to reduce helpdesk load.
- [ ] **Segmented network for line-of-business apps** — Isolate legacy systems from modern network; whitelist inter-segment traffic.
- [ ] **Joint AVG/NCSC-NL/IBD incident playbook** — Dual-track personal-data + cyber incident procedures; pre-coordinate with IBD + AP contacts.
- [ ] **IBD subscription + tabletop participation** — (Gemeenten only) Join IBD CSIRT network; participate in quarterly tabletop exercises.
- [ ] **Supplier register including Logius/SSC-ICT dependencies** — Document critical SaaS, hosting, shared platforms (DigiD, BRP, permit systems, tax systems). Reference: [`templates/sub-verwerker-register-template.csv`](../templates/sub-verwerker-register-template.csv).
- [ ] **DigiD outage continuity plan** — Fallback authentication method (e.g., citizen certificate + local lookup) documented and tested.
- [ ] **Secure DevOps for in-house gemeente apps** — Code review, dependency scanning, SAST for custom systems. Reference: CHECKLIST-CISO.md section 2.e.
- [ ] **Citizen-communication template ready for service outages** — Draft Woo-compliant statements explaining what happened, remediation timeline, steps citizens can take. Template tested with legal + comms teams.
- [ ] **BCP exercise within 12 months** — Test recovery of at least 3 critical services; document RTO/RPO.
- [ ] **Patch management SLA** — Critical patches ≤ 7 days, high ≤ 30 days. Track compliance metrics.
- [ ] **Access review cadence for privileged accounts** — Quarterly minimum; document approvals + removals.

---

## Incident-reporting nuances

**Citizen recipients under NIS2 art. 23(2):**
- Citizens are "recipients of services" if they depend on your systems (permit portal, passport scheduling, benefit applications, etc.).
- **Lower public-disclosure threshold** — Incidents affecting citizen-facing services should be communicated without undue delay (≤ 24h for many gemeenten) and may be disclosed publicly to protect citizen safety (e.g., "Permit system will be offline Tue 14–18; plan accordingly").
- **Contrast with commercial sector:** A commercial SaaS provider might report an incident confidentially to customers without public disclosure; government must consider Woo transparency obligations + public-trust implications.

**NCTV engagement for central-government incidents:**
- Central government cybersecurity incidents can escalate to national-security concern if they affect critical infrastructure (water, energy, healthcare, tax system).
- **NCTV (Nationaal Coördinator Terrorismebestrijding en Veiligheid)** may be engaged for central-government essential entities.
- Escalation criteria: multi-sector impact, foreign-state involvement, geopolitical context.

**AP (Autoriteit Persoonsgegevens) dual-track:**
- If incident affects personal data (BRP, tax records, citizen IDs), notify AP within 72h (GDPR) in addition to NCSC-NL within 24h/72h (NIS2).
- AP incident report form: separate submission.

**Media & public relations:**
- Government incidents often attract media attention quickly (public trust, political impact).
- Prepare comms templates in advance; coordinate with gemeente comms team + legal counsel before incident.

---

## Mapping to corpus

| Resource | Purpose |
|----------|---------|
| [`eu-directives/md/nis2-2022-2555-NL.md`](../eu-directives/md/nis2-2022-2555-NL.md) | NIS2 Directive Annex I point 10 (public administration definition). Background on sector scope, tier classification. |
| [`ncsc-nl/md/www.ncsc.nl_cyberbeveiligingswet-nis2.md`](../ncsc-nl/md/www.ncsc.nl_cyberbeveiligingswet-nis2.md) | NCSC-NL official guidance on Cbw + NIS2 for NL entities. Incident reporting details, registration process. |
| [`CHECKLIST-CISO.md`](../CHECKLIST-CISO.md) | Full readiness checklist. Map sections 1–5 to your entity (scope, governance, risk measures, incident reporting, registration). |
| [`FAQ-compliance-officers.md`](../FAQ-compliance-officers.md) | Q1–Q27 cover public administration scope, competent authorities, incident thresholds. Q18 covers BZK/IBD supervision roles. |
| BIO documentation (NL overheid) | Maturity models, control catalogs. External reference: https://www.noraonline.nl/ (Dutch government architecture). |
| Logius incident-reporting contacts | https://www.logius.nl/ — Contacts, status pages, supplier agreements. |

---

## See also

- [`README.md`](../README.md) — Corpus overview + "About NIS2 in 60 seconds."
- [`GLOSSARY.md`](../GLOSSARY.md) — Terminology (BZK, IBD, ZBO, BIO, DigiD, BSN, BRP, etc.).
- [`TIMELINE.md`](../TIMELINE.md) — NL Cbw entry-into-force date, registration window.
- [`CHECKLIST-CISO.md`](../CHECKLIST-CISO.md) — Full readiness checklist with governance, risk measures, incident reporting.
- [`FAQ-compliance-officers.md`](../FAQ-compliance-officers.md) — Practical Q&A for public administration sector specifics.
- [`templates/`](../templates/) — CSV templates for asset inventory, supplier register, incident register, risk register.

---

> **Disclaimer:** This guide is not legal advice. NL Cyberbeveiligingswet and Cyberbeveiligingsbesluit entry-into-force expected ~Q2 2026. BIO guidelines are maintained by NORA. Verify against live NCSC-NL, BZK, IBD, and VNG sources before board-level decisions.
