# NIS2 Research Sector Guide

**Scope:** Universities, research institutes, academic medical centres (UMCs), and publicly funded research organizations. NL has designated core research bodies (TNO, NWO, KNAW, RIVM, specialized institutes) as essential; universities fall under discretionary scope pending formal NL transposition.

**Audience:** University CISOs, research data officers, deans of research, academic medical centre IT directors, principal investigators, research-support teams, knowledge-security coordinators.

---

## Are you in scope?

Your organization falls under NIS2 Research (Annex II.7) and potential NL Cyberbeveiligingswet scope extension if you are:

| Entity type | Scope indicator | Tier |
|-------------|-----------------|------|
| **Research institute (TNO, NWO, KNAW-affiliated)** | Publicly funded research; contracts with government or critical infrastructure sectors. | **Important** |
| **University (if NL designates)** | Conduct research, operate research infrastructure (HPC, genomics labs, accelerators). NL may designate major universities (UU, UvA, TUD, TU/e, RUG, Wageningen UR, Maastricht, Tilburg, Erasmus, Leiden, VU, Open Universiteit, UT). | **Important** (if designated) |
| **Academic medical centre (UMC)** | Clinical research, patient data, drug-trial infrastructure. All 8 Dutch UMCs in scope. | **Important** |
| **Specialized research body (RIVM, ARTIS, CWI, Nikhef, NIOZ, NIOO)** | Sector-critical research (health, environment, cybersecurity, fundamental science). | **Important** |
| **University hospital or medical faculty research unit** | If part of UMC, included in UMC scope. | **Important** |

**Important NIS2 clarification:** NIS2 Recital 41 + Art. 2(1)(g) historically exclude universities and general higher-education institutions from default Essential/Important tier. However, NL Member State has discretion to designate. Universities conducting research for critical infrastructure (energy, healthcare, water, digital services) or operating critical research infrastructure (HPC clusters, genomics platforms) are at higher risk of NL designation. Verify current NL Cyberbeveiligingsbesluit for final university scope.

**No size exemption:** All research entities are in scope regardless of budget or personnel count.

**Tier:** Research bodies are **Important tier**. Proactive supervision applies; lighter oversight than Essential sector but mandatory compliance required.

---

## NL competent authorities & CSIRT roles

**Research sector coordination:**
- **RDI (Rijksstraatloket Defensie & Innovatie) cyber division** — Technical oversight of research-sector NIS2 compliance; liaison with Dutch Ministry of Defence on dual-use export controls.
- **OCW (Ministerie van Onderwijs, Cultuur en Wetenschap)** — Policy lead for university + research-organization scope designations and sector guidance.
- **NCSC-NL (Nationaal Cyber Security Centrum)** — National CSIRT; receives 24h early warning, 72h incident notifications from all research entities.

**Sector CSIRT for higher education:**
- **SURFcert** — Operates as sector CSIRT for Dutch universities, hogescholen, research institutes affiliated with SURF cooperative. Receives incident reports; escalates to NCSC-NL where needed.
- **SURFcert incident escalation:** Report to SURFcert first; SURFcert coordinates NCSC-NL notification.

**Research-specific escalation:**
- **NWO (Netherlands Organisation for Scientific Research)** — Grants administration; may require incident notification if research funded by NWO contracts affected.
- **AIVD/MIVD (Dutch intelligence services)** — Engagement required if incident involves suspected state-sponsored espionage or dual-use technology theft. Escalation threshold: attribution to foreign state actors or nation-state tactics (e.g., spear-phishing targeting specific researchers, targeted exfiltration of pre-publication research).

---

## NL adjacent compliance regimes

### AVG / UAVG (GDPR & NL Privacy Law)

**Overlap:** Research processing of personal data (patient cohorts, longitudinal studies, survey respondents, student data, employee records).

**GDPR Art. 89 research carve-out:** Research processing may claim exemptions from certain GDPR requirements (e.g., erasure rights, profiling restrictions) if safeguarded by pseudonymization, aggregation, or institutional ethics review. **But:** Cybersecurity breaches do not fall under the carve-out—security incidents remain reportable to AP under Art. 33.

**Dual-track incident reporting:**
- **AP (Autoriteit Persoonsgegevens)** — Within 72h for personal data breaches (GDPR art. 33).
- **NCSC-NL / SURFcert** — Within 24h (early warning) / 72h (full notification) for cybersecurity incidents (NIS2 art. 23).
- **Research-specific:** If incident exposes research-participant data (patient cohorts, genomics, trial data), assess both cybersecurity + ethics/research-integrity dimensions. Ethics committee may need parallel notification.

**Data management plans (RDMP):** EU Horizon Europe grants + many national research programmes require data management plans (research data, metadata, data retention, sharing, reuse). Link RDMP to NIS2 art. 21 risk measures—classify data sensitivity, flag export-control restrictions, document access controls.

---

### EU Horizon Europe Data Management & FAIR Principles

**What they are:** EU research-funding requirements mandate FAIR data (Findable, Accessible, Interoperable, Reusable) principles + data management plans for all publicly funded research.

**Connection to NIS2:** FAIR mandates data-sharing platforms (EOSC, ELIXIR, institutional repositories) that become attack surface. Research-data repositories must be hardened and included in risk assessment.

**Practical implication:** FAIR data-sharing obligations may conflict with strict access controls. Use role-based access (RBAC) + encryption + audit logging to balance openness + security.

---

### Dual-Use Export Controls (EU 2021/821 & NL Sgda)

**What they are:** EU regulation restricting export of items with potential military/proliferation use (semiconductors, materials, software, technical data). NL law enforcement: Dienst Uitvoer & Zaken (DUZ) / Sgda (foreign-trade authority).

**Research nexus:** University research in semiconductor design, materials science, biotechnology, dual-use algorithms may fall under export controls. Collaborations with researchers in sanctioned countries or sensitive jurisdictions (China, Russia, Iran, North Korea) require screening.

**Connection to NIS2:** Cyber incident involving exfiltration of research data (chip designs, biotech protocols, advanced materials specifications) to sanctioned countries = dual-use export-control breach. Report jointly to:
- NCSC-NL (cyber)
- NL Sgda / DUZ (export control)
- RDI (research security)

**Practical implication:** Screen international collaborators + PhD students from sensitive countries; classify research outputs with export-control flag; restrict download/sharing by non-authorized personnel; log all access to dual-use research repos.

---

### Human-Subjects Research Ethics (WMO & CCMO)

**What they are:** Dutch law (Wet Medisch-wetenschappelijk Onderzoek) + CCMO (Central Committee on Research Involving Human Subjects) oversee clinical trials, biomedical research on human subjects.

**Connection to NIS2:** Patient-privacy breaches in WMO-regulated trials require dual escalation:
- **CCMO** — Integrity of trial + participant safety.
- **AP + NCSC-NL** — Data protection + cybersecurity incident reporting.

**Practical implication:** UMCs + biomedical research teams must coordinate incident response across CCMO, ethics committee, AP, and NCSC-NL.

---

### Knowledge Security (Kennisveiligheid) National Programme

**What it is:** Dutch national programme (NCTV + AIVD/MIVD coordination) addressing foreign intelligence collection targeting Dutch research, IP theft, and insider threats in academic sector.

**Alignment with NIS2:** Knowledge-security training, supply-chain vetting for research collaborations, and insider-threat awareness are non-technical measures strongly aligned with NIS2 art. 21.

**Practical implication:** Universities + research institutes must participate in Dutch "kennisveiligheid" training programme (mandatory for senior researchers + IT staff). NCTV provides sector-tailored training on state-sponsored targeting, IP theft, and reporting pathways.

---

### CCV-NL (Dutch Research Registry) & Security Assessments

**What it is:** Central registry for Dutch researchers; used for grant applications, collaboration tracking, conflict-of-interest management.

**Connection to NIS2:** CCV-NL advisories on research collaborations with foreign nationals or sanctioned-country affiliates inform export-control + kennisveiligheid screening. Academic institutions use CCV-NL vetting to inform supply-chain risk assessment (collaborator backgrounds, funding sources).

---

### NIST SP 800-171 (if US Government Collaboration)

**What it is:** US DoD contractor security standard; required if research funded by US government (NSF, NIH, DARPA) or conducted at US DoD lab affiliations.

**Connection to NIS2:** NIS2 + NIST 800-171 have significant overlap on access controls, encryption, incident reporting. Researchers collaborating with US partners must meet NIST 800-171 + NIS2 simultaneously.

---

## Top sector-specific risks

**State-sponsored IP theft (espionage targeting research):**
- Nation-state actors (China, Russia) conduct targeted spear-phishing, watering-hole attacks, supply-chain compromises to steal pre-publication research, university IP, advanced materials/chip designs.
- **Mitigation:** Kennisveiligheid training, screening international collaborations, multi-factor authentication on email + VPN, logging of large data exports, incident-escalation pathways to AIVD/MIVD.

**Ransomware against HPC clusters & research data:**
- High-value targets: genome-sequencing data, clinical-trial databases, molecular-dynamics simulations, drug-discovery datasets. Attackers demand ransom or threaten public release.
- **Mitigation:** Segmented HPC architecture, immutable snapshots (versioning ≥7 days), offline recovery media, MFA on HPC admin + data-transfer nodes.

**Supply-chain via shared research-data platforms (SURF, ELIXIR, EOSC):**
- Universities + institutes share HPC resources (SURF Snellius, Lisa clusters), bioinformatics platforms (ELIXIR node), open-science repositories (Zenodo, OSF). Compromise of shared platform cascades to all tenant research teams.
- **Mitigation:** Supplier risk assessment of SURF + ELIXIR + cloud providers; contractual incident-notification SLAs; tenant-isolation verification; audit shared-platform access logs.

**Research-data repository compromise (GitHub, GitLab, OSF, institutional repos):**
- Researchers often push pre-publication data + code to public repositories (GitHub, GitLab, Zenodo) before peer review, exposing dual-use research or patient-level data.
- **Mitigation:** Data-classification training, export-control screening before public upload, automated scanning of repos for credentials/PII, institutional review of high-risk data uploads.

**Hardware theft (chip designs, biotech samples, lab devices):**
- Physical theft of prototypes, samples, lab notebooks, or devices containing research data (sequencers, accelerators, specialized equipment).
- **Mitigation:** Physical security (badge access to labs), asset tagging + tracking, chain-of-custody for sensitive samples, biometric access to high-security labs.

**Insider risk in international research teams:**
- Large interdisciplinary teams (50–100+) include PhD students, postdocs, visiting scholars from China, Russia, Iran, other sensitive jurisdictions. Pressure to publish, limited awareness of export controls, and visa/funding uncertainties create insider-threat surface.
- **Mitigation:** Kennisveiligheid training (mandatory for international staff), dual-use research screening at hire, quarterly access reviews, privileged-access management (PAM) for data-export functions, exit interviews with IP/classification reminders.

**Graduate student turnover + privileged data access:**
- PhD students (3–4 year tenure) may have broad access to research databases, HPC systems, lab devices, and pre-publication data. Rapid turnover (graduation, dropout, job-change) creates access-revocation gaps.
- **Mitigation:** Automated access-removal at departure, exit procedures documenting what data student accessed, data-classification matrix limiting student access to non-sensitive subsets.

**Research-collaboration platform compromise (ResearchGate, Slack, Teams, Mattermost):**
- Collaborations conducted via cloud-hosted messaging (Slack, Microsoft Teams, Mattermost), file-sharing (OneDrive, Dropbox), or academic networks (ResearchGate, Academia.edu). Compromise of guest accounts, weak multi-factor auth, or insider threats expose pre-publication data.
- **Mitigation:** MFA on identity provider (institutional AAD), guest-account lifecycle management, encryption in transit, audit logging of file access, DLP policies flagging large exports.

**Dual-use export-control violations via cyber:**
- Cyber incident (breach, ransomware, insider theft) exfiltrating chip-design files, biotech protocols, or advanced-material specs to sanctioned countries = criminal liability + research-grant liability.
- **Mitigation:** Data classification with export-control flag, access controls restricting who can export dual-use research, audit logging of dual-use data access, escalation matrix to RDI + Sgda on suspected export-control breaches.

**Pre-publication research leak (embargo violation):**
- Accidental (or malicious insider) disclosure of manuscripts, datasets, or findings before peer-review acceptance breaches journal embargo + research-integrity norms. May also violate IP agreements with industry partners.
- **Mitigation:** Data-classification policy flagging pre-publication research, DLP scanning for research-dataset uploads to public repos, communication with journals + collaborators on embargo windows, incident investigation + remediation procedures.

---

## Quick-win checklist

- [ ] **Research-entity scope determination** — Verify organization is formally in NL Cyberbeveiligingswet scope (TNO, KNAW-affiliated institutes, UMCs) or pending university designation; confirm SURFcert affiliation.
- [ ] **Data classification with export-control flag** — Tag all research datasets (FAIR, Horizon Europe, sponsored) with sensitivity level + dual-use export-control marker. Template: [`templates/data-classification-research.csv`](../templates/data-classification-research.csv).
- [ ] **Research-data management plan (RDMP) per project** — Link grant requirements (Horizon Europe, NWO, industry sponsorship) to NIS2 art. 21 risk measures. Document access controls, retention, sharing restrictions, incident triggers.
- [ ] **International-collaborator screening & kennisveiligheid training** — Screen PhD students, visiting scholars, international PIs for sensitive-country affiliation; document screening + training completion; maintain collaborator register.
- [ ] **SURFcert subscription (universities)** — Join SURFcert incident-response network; designate SURFcert contact; participate in quarterly tabletop exercises.
- [ ] **MFA on identity provider (AAD, Shibboleth, LDAP)** — Enforce FIDO2 for all staff + faculty; passkey option for researchers to reduce helpdesk burden; guest-account lifecycle management (onboard/offboard with training).
- [ ] **Research-data repository hardening (GitHub, GitLab, Zenodo, institutional)** — Enable branch protection, code-review requirements, signed commits; DLP scanning for credentials/PII before push; audit logging. Reference: CHECKLIST-CISO.md section 2.e.
- [ ] **HPC cluster tenant isolation & access logging** — Verify SURF (or institutional HPC) provides network segmentation, user-isolation, and detailed access logs per researcher. Test recovery RTO/RPO for HPC backups.
- [ ] **Collaboration-tool hardening (Teams, Slack, Mattermost, ResearchGate)** — MFA on all accounts; guest-account policy with auto-expiry (e.g., 90 days); DLP rules for large data exports; quarterly access reviews.
- [ ] **Dual-use export-control incident playbook** — Joint coordination with RDI, Sgda, NCSC-NL, AIVD/MIVD for incidents suspected of dual-use data loss. Pre-identify escalation contacts + reporting templates.
- [ ] **State-sponsored incident escalation matrix** — Establish reporting pathways to AIVD/MIVD + NCTV for incidents with suspected foreign-state involvement (spear-phishing campaigns, targeted data exfiltration, supply-chain compromise). Document criteria (e.g., APT tactics, Iran/Russia/China attribution).
- [ ] **Kennisveiligheid training implementation** — Participate in NCTV national programme; roll out mandatory training to senior researchers, PhD students, IT staff; document completion; annual refresher.
- [ ] **USB/removable-media policy** — Restrict USB usage on HPC, research-data systems; enforce encryption + audit logging for approved removable media; education on exfiltration risks.
- [ ] **Incident-response tabletop (12-month cadence)** — Simulate scenarios: ransomware on HPC, research-data breach + dual-use export-control question, pre-publication leak, insider theft. Test coordination with SURFcert, AP, AIVD/MIVD, ethics committee, RDI.

---

## Incident-reporting nuances

**Research-data breach + personal data:**
- If incident affects research participants (patient cohorts, genomics, trial data), notify both:
  - **AP (Autoriteit Persoonsgegevens)** — 72h for GDPR breach.
  - **NCSC-NL / SURFcert** — 24h early warning / 72h full NIS2 notification.
  - **Ethics committee / CCMO** — Parallel notification if WMO-regulated trial or human-subjects research affected.

**Dual-use export-control breach escalation:**
- Incident exposes chip-design files, biotech protocols, or sanctioned-country collaboration data → escalate to:
  - **NCSC-NL** — Cybersecurity incident track.
  - **RDI (Rijksstraatloket Defensie & Innovatie)** — Research-security implications.
  - **NL Sgda / DUZ** — Export-control legal liability.
  - **Grant agencies (NWO, EU Horizon)** — If grant-funded research affected (may suspend funding pending remediation).

**State-sponsored incident attribution:**
- Incident shows APT indicators (e.g., spear-phishing targeting specific researchers, lateral movement via compromised HPC account, exfiltration of pre-publication research) → escalate to:
  - **AIVD / MIVD** — Intelligence assessment + threat context.
  - **NCTV (Nationaal Coördinator Terrorismebestrijding en Veiligheid)** — National-security coordination.

**Pre-publication research leak:**
- Accidental/malicious disclosure of manuscripts or datasets before peer-review acceptance → parallel notification:
  - **Journal(s) affected** — Embargo violation; request retraction/correction timeline.
  - **Research-integrity officer / ombudsperson** — Institutional investigation.
  - **NCSC-NL** — Cybersecurity incident if caused by breach (distinguish unintentional from malicious disclosure).
  - **Industry partner** — If IP agreement exists (e.g., research sponsored by pharmaceutical company).

---

## Mapping to corpus

| Resource | Purpose |
|----------|---------|
| [`eu-directives/md/nis2-2022-2555-NL.md`](../eu-directives/md/nis2-2022-2555-NL.md) | NIS2 Directive Annex II.7 (research definition), Recital 41 (university exclusion rationale). Background on sector scope + tier classification. |
| [`ncsc-nl/md/www.ncsc.nl_cyberbeveiligingswet-nis2.md`](../ncsc-nl/md/www.ncsc.nl_cyberbeveiligingswet-nis2.md) | NCSC-NL official guidance on Cbw + NIS2 for NL research entities. Incident reporting, registration, SURFcert coordination. |
| [`CHECKLIST-CISO.md`](../CHECKLIST-CISO.md) | Full readiness checklist; map sections 1–5 to research context (scope, governance, risk measures, incident reporting, registration). |
| [`FAQ-compliance-officers.md`](../FAQ-compliance-officers.md) | Q1–Q27 on scope, competent authorities, incident thresholds. Q19–Q21 cover research + academic sector specifics. |
| SURF / SURFcert resources | https://www.surf.nl/ — SURFcert incident reporting, HPC security, shared-platform risk assessments. |
| NCTV Knowledge Security (Kennisveiligheid) | https://www.nctv.nl/ — Kennisveiligheid training, research-targeting threat assessment, state-sponsored incident reporting. |
| NWO / OCW research guidance | https://www.nwo.nl/ — Grant requirements, research-integrity standards, cyber-risk frameworks for sponsored research. |
| FAIR Data principles & EOSC | https://www.eosc-portal.eu/ — Data management, repository security, open-science governance. |

---

## See also

- [`README.md`](../README.md) — Corpus overview + "About NIS2 in 60 seconds."
- [`GLOSSARY.md`](../GLOSSARY.md) — Terminology (SURFcert, AIVD/MIVD, kennisveiligheid, UMC, RDMP, FAIR, EOSC, export controls, etc.).
- [`TIMELINE.md`](../TIMELINE.md) — NL Cbw entry-into-force date, registration window, research-sector scope timeline.
- [`CHECKLIST-CISO.md`](../CHECKLIST-CISO.md) — Full readiness checklist with governance, risk measures, incident reporting.
- [`FAQ-compliance-officers.md`](../FAQ-compliance-officers.md) — Practical Q&A for research-sector specifics (international collaborations, dual-use export controls, research-data security).
- [`SECTOR-public-administration.md`](./SECTOR-public-administration.md) — Adjacent sector overlaps (government research, universities as public entities, shared infrastructure).
- [`templates/`](../templates/) — CSV templates for asset inventory, research-data classification, international-collaborator register, incident register.

---

> **Disclaimer:** This guide is not legal advice. NL Cyberbeveiligingswet + Cyberbeveiligingsbesluit entry-into-force expected ~Q2 2026; university scope designation pending NL transposition. SURFcert and NCTV guidance are maintained by their respective operators. Dual-use export-control rules follow EU 2021/821 + NL Sgda regulations (subject to change). Verify against live NCSC-NL, NCTV, RDI, NWO, and SURFcert sources before institutional-level decisions.
