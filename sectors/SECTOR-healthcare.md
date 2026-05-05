# NIS2 Healthcare Sector Guide

**Sector:** NIS2 Annex I, point 5 (Health) — healthcare providers and supporting entities.

**Audience:** Compliance officers, CISOs, and board members at hospitals, general practices, regional labs, pharmaceutical manufacturers, and medical-device manufacturers.

This guide covers scope, Dutch oversight, adjacent regulatory regimes, sector-specific risks, and a practical readiness checklist for healthcare entities under the Cyberbeveiligingswet (Cbw) and NIS2.

> **Disclaimer:** Not legal advice. The Cbw and AMvBs are not yet in force at the time of this corpus snapshot ([`INVENTORY.md`](../INVENTORY.md) — `Retrieved 2026-04-26`). Verify against the live NCSC-NL and IGJ guidance before relying on any answer for board-level decisions.

---

## Are you in scope?

### Essential-tier entities (NIS2 Annex I, point 5)

**In scope by default** (medium or large):
- **Hospital** (all types — acute care, specialty, psychiatric, rehabilitation) with ≥ 50 employees or ≥ €10M annual turnover.
- **General practice (huisartsenpost)** network or chain with ≥ 50 employees.
- **Regional/public-health laboratory** designated as critical for outbreak detection or vaccine distribution.
- **Pharmaceutical manufacturer** (active pharmaceutical ingredient or finished-product manufacturing) with ≥ 50 employees.
- **Manufacturer of basic pharmaceutical products and preparations** (Annex I.5).
- **Manufacturer of medical devices** **considered critical during a public-health emergency (PHE)**, as designated by the competent authority (IGJ) or EU. (Note: routine medical-device manufacturing falls under Annex II.13 "Manufacturing of medical devices" — Important tier.)

Most healthcare providers in the Netherlands operate as **Essential** entities.

### Important-tier entities (NIS2 Annex II, point 13)

**In scope if medium or large:**
- **Routine medical-device manufacturers** (not designated as critical during PHE).
- **Healthcare research entities** that are not direct providers but support pharmaceutical development.

---

## Dutch competent authority

**Primary authority:** **IGJ** (Inspectie Gezondheidszorg en Jeugd — Healthcare and Youth Inspectorate).

**Reporting and coordination:**
- Entities must register with the **NCSC-NL** (Dutch National Cyber Security Centre) under NIS2 art. 27.
- **IGJ** is the sector-specific competent authority per art. 8; NCSC-NL coordinates incident reporting.
- **Z-CERT** (sector CSIRT for health, managed by IGJ liaison with NCSC-NL) handles incident notifications.

**Key contact channels:**
- Registration: `https://www.ncsc.nl/cyberbeveiligingswet-nis2` (flowchart + self-registration).
- Incident reporting: Z-CERT (24h/7, accessible via NCSC-NL incident portal).
- Sector guidance: IGJ website + NCSC-NL FAQ.

---

## NL adjacent regulatory regimes

### NEN 7510 (Information Security in Healthcare)

Dutch standard for healthcare information security, mandatory for many NL health organizations regardless of NIS2 status.

**Overlap with NIS2 art. 21(2):**
- Both require risk assessment, access control, incident handling, business continuity.
- NEN 7510 is often cited as **strong evidence** of compliance with NIS2 art. 21(2)(a)–(c), (e)–(g), and (i)–(j).
- Use a **NEN 7510 gap analysis** as a pre-flight check before formal NIS2 audit; most entities already meet 70–80% of NIS2 via NEN 7510.

**Key alignment areas:**
- Data classification, access policy, incident response, backup/recovery, third-party contracts.

### Wegiz / eGiz (Electronic Health Data Exchange)

**Regeling elektronische gegevensuitwisseling zorg (eGiz):**
- Defines safe exchange of health records between providers (GPs, hospitals, pharmacies).
- Prescribes encrypted, authenticated channels and audit logs.
- Aligns with NIS2 art. 21(2)(h) (encryption) and 21(2)(j) (secure communications).

### MDR (EU 2017/745) — Medical Devices Regulation

**For medical-device manufacturers:**
- **Cybersecurity requirements** are part of pre-market technical dossier and post-market surveillance (Annex II, Chapter 1.5 and post-market vigilance).
- MDR art. 10.2 requires disclosure of known cybersecurity vulnerabilities and recalls if security is compromised.
- **Aligns with NIS2 art. 21(2)(d) & (e)** (supply-chain security, vulnerability handling).
- Device manufacturers under MDR are also NIS2 entities if they meet the size/sector test — both regimes apply.

### GDPR & WGBO (Patient Data)

**GDPR Art. 33 (Breach Notification):**
- Personal data breach: notify supervisory authority (AP — Autoriteit Persoonsgegevens) within 72 hours.
- Notify affected patients if risk is high.

**WGBO (Medical Treatment Contracts Act):**
- Patient rights to access, amend, and securely handle health data.

**Dual-track reporting trigger (common in healthcare incidents):**
- EPR (electronic patient record) outage or ransomware → confidentiality/integrity of patient data compromised → both **GDPR art. 33 (AP within 72h)** and **NIS2 art. 23 (NCSC-NL/IGJ within phased timeline)** must be triggered.
- **Coordination:** IGJ + AP joint-notification playbook recommended (see section on incident reporting below).

---

## Top sector-specific risks

### Ransomware

Healthcare remains a high-profile target globally due to life-safety impact and high ransom willingness. While specific NL incidents should not be fabricated, the threat landscape is real and well-documented in NCSC-NL and IGJ advisories.

### Legacy medical systems (end-of-life OS)

Clinical lab systems, imaging (PACS), and EHR gateways often run Windows Server 2008 R2, Windows 7, or proprietary real-time OSs no longer receiving patches. Replacement cycles are 5–10 years; interim network segmentation is essential.

### Medical-device IoT on flat networks

Infusion pumps, ventilators, MRI consoles, patient monitors often ship with default credentials and no built-in encryption. Deployment on hospital flat networks or poorly segmented VLAN, increases lateral-movement risk. Manufacturer firmware updates are infrequent.

### EPR (Electronic Patient Record) availability dependency

Hospitals depend on Epic, ChipSoft (Nederland), or HiX. EPR outage halts clinical operations within minutes. Recovery time objective (RTO) must be ≤ 4 hours for critical systems, ideally ≤ 1 hour. Backup to paper is feasible for days, not weeks.

### Supply-chain: Pharma R&D IP

Pharmaceutical research organizations face targeted APT and insider-threat activity. Clinical trial data, manufacturing protocols, and regulatory submissions are high-value exfiltration targets.

### Telehealth endpoints & remote access

GP consultation platforms (e.g., MedCentro, Medisafe) and remote monitoring solutions often run on personal devices with minimal controls. Attacker access to telehealth session data or patient identity verification bypass = immediate GDPR + NIS2 breach.

### Third-party billing & insurance integrations

Hospital billing systems connect to insurance-company portals, claims processors, and government health-subsidy APIs. Insecure API integrations, credential compromise in third-party systems, or logic bugs in claim adjudication can expose patient identity or health data.

---

## Quick-win readiness checklist

Use this checklist alongside [`CHECKLIST-CISO.md`](../CHECKLIST-CISO.md) to identify gaps in NIS2 readiness. Mark items only when evidence exists and is current.

### Network & Systems

- [ ] **Network segmentation plan** mapped: clinical VLAN (EPR, infusion pumps) / medical-device VLAN (PACS, labs) / admin VLAN (staff, billing) / guest VLAN (visitor WiFi). Firewall rules documented and tested.
- [ ] **Medical-device inventory** (spreadsheet or asset-management system) with: manufacturer, model, firmware version, last-patched date, network interface (IP / wireless), clinical criticality, support end-of-life date.
- [ ] **Legacy OS inventory**: Windows 7, Windows Server 2008 R2, proprietary RTOS systems identified; interim patch or air-gap mitigation documented per device.
- [ ] **Vendor SLA review**: Device manufacturers (infusion-pump, PACS, lab) contractually obligated to provide security patches within X days of disclosure. Document in procurement/contract register.

### Access Control & Identity

- [ ] **MFA** enabled on EPR (all admin + clinical staff editing patient data) + remote-access VPN + privileged-account (domain admin, database admin) logins.
- [ ] **Joiner / mover / leaver (JML) SLA**: access revoked ≤ 24h on termination; documented workflow.
- [ ] **Default credentials** audit: all medical devices, PACS, lab LIS systems checked for factory defaults; changed or disabled.
- [ ] **Privileged-account inventory** (admins, service accounts, data-backup service accounts) documented; periodic access review (quarterly minimum).

### Backup & Disaster Recovery

- [ ] **Backup strategy** for EPR and critical patient-care systems: daily incremental, weekly full, off-site or cloud-backed.
- [ ] **Recovery Time Objective (RTO)** and Recovery Point Objective (RPO) defined per critical system: e.g. EPR RTO ≤ 4h, RPO ≤ 2h.
- [ ] **Tested restore** (full end-to-end) ≤ 6 months old; scenario: ransomware encryption of production DB, restore from backup, validation that patient records are complete and correct.
- [ ] **Ransomware-specific recovery plan**: immutable backups or air-gapped cold backup; restore runbook tested; RTO ≤ 24h for clinical critical systems.
- [ ] **Continuity of patient care during EPR downtime**: documented process — paper fallback procedures, manual triage, de-duplication on re-sync.

### Incident Management

- [ ] **Incident response plan** with playbooks for: ransomware, data breach, EPR outage, medical-device compromise, insider threat.
- [ ] **Incident severity taxonomy**: define "significant incident" per NIS2 art. 23(3) (impacts confidentiality/integrity/availability of services or personal data).
- [ ] **24/7 incident detection**: in-house SOC, MSSP (managed SOC), or 24h on-call tier with escalation paths to CISO / CTO.
- [ ] **Incident register** (log of all incidents ≥ severity level 2) with: date, type, root cause, containment time, recovery time, lessons learned.
- [ ] **Tabletop exercise** ≤ 12 months old: scenario (e.g. ransomware lock-up, patient identity exfil, device compromise), participants (CISO, clinical leadership, IT ops, legal, comms), documented outcomes.

### Patch & Vulnerability Management

- [ ] **Patch SLA policy**: critical OS/app patches ≤ 7 days; high patches ≤ 30 days; medium/low patches ≤ 90 days; exclusions for medical devices with manufacturer-only patch windows documented.
- [ ] **Vulnerability disclosure policy** published (security.txt contact or IGJ-registered email) — external researchers know how to report.
- [ ] **Dependency scanning** for open-source libraries in any custom health IT applications (e.g. patient portal, lab order entry); integrated into CI/CD or monthly scan.

### Supply Chain & Third-Party Risk

- [ ] **Supplier inventory** (medical-device vendors, EHR vendor, ISP, cloud provider, managed-backup service, billing processor): documented with cybersecurity SLAs + incident-notification clause.
- [ ] **Vendor cybersecurity assessment**: questionnaire (e.g. CAIQ, NIST CSF alignment, or custom) for all tier-1 suppliers; responses documented and reviewed annually.
- [ ] **Contractual security clauses** in standard supplier template: incident notification ≤ 24h, annual audit rights, sub-processor approval, breach cost-sharing or liability caps.
- [ ] **Critical vendor contingency plan**: alternative vendor / manual workaround for EPR, backup/recovery service, and internet connectivity.

### Governance & Training

- [ ] **NEN 7510 gap analysis** completed: current vs required maturity per NEN 7510 § 5 (organization) + § 7 (asset management) + § 8 (access control) + § 9 (cryptography) + § 11 (incident management) + § 12 (business continuity).
- [ ] **NIS2 art. 21 control mapping**: all 10 mandatory measure areas (a–j) mapped to current policies; gaps identified and owner assigned.
- [ ] **Board-level training** (management body): cybersecurity risks, NIS2 obligation summary, incident-response roles, personal liability (last ≤ 12 months).
- [ ] **All-staff cybersecurity awareness training**: mandatory on hire; annual refresh. Phishing simulation program with measured click rate (target < 5%).
- [ ] **Clinical staff risk awareness**: specific modules on ransomware (patient care impact), data breach (GDPR + WGBO consequences), third-party credential compromise.
- [ ] **Z-CERT subscription & registration**: entity registered with NCSC-NL; Z-CERT incident contact designated and trained.

---

## Incident-reporting nuances for healthcare

Healthcare has unique incident-reporting triggers due to patient-care continuity and dual GDPR/NIS2 pathways.

### Significant-incident threshold (NIS2 art. 23(3))

An incident is "significant" if it results in a:
- Disruption of patient care (e.g. EPR unavailable > 4 hours, surgery postponed, urgent imaging delayed).
- Loss or compromise of confidentiality/integrity of patient health data (≥ 10 patient records affected, or any genetic/psychiatric/treatment data).
- Compromise of availability of a critical life-safety system (ventilator, infusion-pump network, patient-monitoring system).

### Reporting timeline

1. **Early warning ≤ 24h:** brief notification to NCSC-NL / IGJ (incident confirmed, initial severity assessment).
2. **Formal incident notification ≤ 72h:** detailed report including root cause (if known), systems affected, patient/data volume, mitigation status.
3. **Final report ≤ 1 month:** root-cause analysis, corrective actions, system changes to prevent recurrence.

### Dual-track GDPR + NIS2 trigger (common scenario)

**Example:** Ransomware encrypts EPR database. Patient data (≥10 records) exposed in exfiltration.

**Required notifications:**
1. **AP (Autoriteit Persoonsgegevens) — GDPR art. 33:** personal data breach, notify ≤ 72h from discovery.
2. **NCSC-NL / IGJ — NIS2 art. 23:** significant incident (availability + confidentiality), report on phased timeline.
3. **Patients — GDPR art. 34:** high-risk breach, notify directly if feasible (or via media if large volume).

**Coordination & playbook:**
- Designate a **joint GDPR + NIS2 incident team** (legal, CISO, clinical ops, comms).
- Prepare a **dual-track notification checklist** specifying:
  - Which details go to AP vs NCSC-NL/IGJ (AP focuses on personal data + mitigation; IGJ focuses on service continuity + systemic risk).
  - Timing: AP ≤ 72h is stricter; use it as the driving deadline; NIS2 early warning ≤ 24h is advisory but recommended for transparency.
  - Patient notification: coordinate with comms; media statement may be needed if > 5000 patients affected.

### Service-continuity notification (NIS2 art. 23(2))

If the incident materially affects the **continuity of healthcare services** (e.g. EPR, pharmacy, lab):
- Notify **recipients of the service** (patients, referring GPs, insurers, public-health authority) of disruption + estimated recovery.
- Example: hospital announces "elective surgeries postponed due to IT infrastructure incident; emergency intake continues."

---

## Mapping to corpus

- **Authoritative NIS2 text:** [`eu-directives/md/nis2-2022-2555-NL.md`](../eu-directives/md/nis2-2022-2555-NL.md) — Annex I, point 5 (Health).
- **Dutch law & decision tree:** [`nl-overheid-publicaties/md/doorverwijsboom-cyberbeveiligingswet.md`](../nl-overheid-publicaties/md/doorverwijsboom-cyberbeveiligingswet.md).
- **Registration flowchart:** [`ncsc-nl/md/www.ncsc.nl_cyberbeveiligingswet-nis2_flowchart-registratieplicht-nis2-entiteit.md`](../ncsc-nl/md/www.ncsc.nl_cyberbeveiligingswet-nis2_flowchart-registratieplicht-nis2-entiteit.md).
- **CISO checklist** (comprehensive evidence tracker): [`CHECKLIST-CISO.md`](../CHECKLIST-CISO.md).
- **Compliance officer FAQ:** [`FAQ-compliance-officers.md`](../FAQ-compliance-officers.md) — Q1–Q10 for scope, Q6–Q8 for obligations.
- **NIS2 in 60 seconds:** [`README.md`](../README.md) — overview of four obligation pillars.
- **Glossary:** [`GLOSSARY.md`](../GLOSSARY.md) — key terms (Essential, Important, competent authority, significant incident, etc.).
- **ENISA technical guidance** (control mapping): [`enisa-guidance/md/ENISA_Technical_Implementation_Guidance_v1.0.md`](../enisa-guidance/md/ENISA_Technical_Implementation_Guidance_v1.0.md).
- **CIR 2024/2690** (if health IT supplier is also a digital infrastructure provider): [`eu-implementing-regulation/md/cir-2024-2690-NL-html.md`](../eu-implementing-regulation/md/cir-2024-2690-NL-html.md).

---

## See also

- [`README.md`](../README.md) — corpus scope + audience routing.
- [`TIMELINE.md`](../TIMELINE.md) — key deadlines for Cbw entry into force + registration.
- [`INVENTORY.md`](../INVENTORY.md) — corpus snapshot date and source attribution.
