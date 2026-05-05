# NIS2 Banking & Financial Sector Guide

**Audience:** CISOs, compliance officers, treasury officers, and risk committees at NL financial institutions, payment processors, and market infrastructure operators.

**Scope:** NIS2 Annex I points 3 & 4 — credit institutions, payment systems, trading venues, central counterparties (CCPs), and central securities depositories (CSDs). Essential tier.

---

## Are you in scope?

NIS2 Annex I.3 & I.4 cover:

| Sub-sector | Scope indicator |
|-----------|-----------------|
| **Credit institution** | Bank, savings bank, or credit union licensed under EU Capital Requirements Directive (CRD). Includes large fintech lenders. Essential. |
| **Payment system operator** | Operator of a payment system (e.g. iDEAL, SEPA, domestic clearing). Sole provider per MS may be essential regardless of size. |
| **Trading venue** | Stock exchange, multilateral trading facility (MTF), organised trading facility (OTF) regulated under MiFID II. Examples: Euronext Amsterdam, smaller equity/bond MTFs. Essential if operating in NL or serving NL participants. |
| **Central counterparty (CCP)** | Clears trades; acts as counterparty. EU-regulated CCPs (e.g. LCH.Clearnet, Eurex Clearing). Essential regardless of size or profit status. |
| **Central securities depository (CSD)** | Holds, issues, and transfers securities (stocks, bonds, derivatives). Examples: Euroclear, SIX Securities Services (for NL holdings). Essential regardless of size. |

**Tier:** All banking & financial entities are **Essential**. No SME exception under NIS2 (though DORA introduces separate sizing thresholds).

**Adjacent regimes — CRITICAL:**

**DORA (Directive (EU) 2022/2554)** is **lex specialis** (special law) overriding NIS2 art. 21 & 23 (risk management + incident reporting) *for in-scope financial institutions*. See table below.

---

## DORA carve-out (lex specialis)

**This is the single most important NL compliance distinction for banking.** DORA establishes *parallel* cyber-risk-management and incident-reporting obligations. NIS2 and DORA do *not* merge; they operate independently.

### Dual-status entities

| Entity type | DORA in-scope? | NIS2 art. 21 (risk mgmt)? | NIS2 art. 23 (incident reporting)? | Applicable regime |
|-------------|---|---|---|---|
| **Large credit institution** (>€30B assets or meets ESA/ESMA criteria) | YES | NO | NO | **DORA only** for substantive risk mgmt + incident reporting. |
| **Smaller credit institution** (≤€30B assets, meets thresholds for "systemic importance") | MAYBE | NO (if DORA applies) | NO (if DORA applies) | DORA if designated by competent authority; otherwise NIS2 art. 21 + 23. |
| **Microfinance institution** (credit union, small lender <€30M assets) | NO | YES | YES | **NIS2 art. 21 + 23** only (DORA does not apply). |
| **Payment system operator** (iDEAL, SEPA operator) | NO | YES | YES | **NIS2 art. 21 + 23** (DORA does not apply to pure system operators). |
| **Trading venue** (MTF, OTF) | NO | YES | YES | **NIS2 art. 21 + 23** (MiFID II supplementary, but DORA does not apply). |
| **CCP** | NO | YES | YES | **NIS2 art. 21 + 23** (EMIR supplementary, but DORA does not apply). |
| **CSD** | NO | YES | YES | **NIS2 art. 21 + 23** (Settlement Regulation supplementary, but DORA does not apply). |

### DORA specifics (for in-scope FIs)

**DORA Chapters II–III (art. 6–27)** mandate:

1. **ICT Risk Management Framework** (art. 6–16):
   - Risk appetite statement + board governance.
   - Business continuity & incident-management plan with RTO ≤ 4h critical functions, RPO ≤ 1h data.
   - Third-party service provider audit rights.
   - Concentration-risk limits for outsourced ICT services.

2. **ICT-related incidents** (art. 18–19):
   - Major-incident report to competent authority within **4 hours** of detection (vs. NIS2 24h).
   - Detailed investigation report within **10 business days** (vs. NIS2 1 month).
   - Competent authority may direct public disclosure thresholds.

3. **ICT Operational Resilience Testing** (TLPT, art. 20):
   - Annual threat-led penetration test coordinated by sector authority.
   - Adversarial scenario design; red team vs. live critical systems.
   - Results shared with ECB / ESMA / EIOPA depending on entity type.

4. **Third-party ICT service provider requirements** (art. 28–30):
   - Due-diligence questionnaire before onboarding.
   - Contractual incident-notification clause (≤ 4h for critical events).
   - No outsourcing of core functions without explicit approval.
   - Audit + inspection rights flowed down to sub-processors.

**NIS2 art. 27 still applies:** DORA-covered entities *still register with NIS2 authorities* and remain under NCSC-NL supervision for non-DORA-covered cyber matters (e.g. data-centre physical security, GDPR-relevant incidents that don't trigger DORA).

### How to determine your DORA status

1. **Are you a credit institution** (EU-licensed bank, savings bank, credit union)?
   - YES → Check asset size + systemic importance criteria in EBA regulatory technical standards (RTS).
   - If ≥€30B OR designated systemic → **DORA applies (lex specialis)**.
   - If <€30B AND not designated → **NIS2 art. 21 + 23 apply** (not DORA).

2. **Are you a payment system operator, trading venue, CCP, CSD, or other Annex I.4 entity?**
   - YES → **NIS2 art. 21 + 23 apply. DORA does not apply.**

3. **Uncertainty?** Confirm with your competent authority (DNB for banks, ESMA for trading venues, ECB for Eurosystem services).

---

## NL competent authorities & supervision split

| Entity type | Primary supervisory authority | DORA incident channel | NIS2 incident channel |
|-------------|-----|---|---|
| **Large credit institution** | DNB (Dutch Central Bank) + ECB (single supervisory mechanism). | DNB directly; ECB coordination for systemic impact. | NCSC-NL (art. 27 registration only — non-DORA cyber matters). |
| **Smaller credit institution** | DNB (national discretion). | DNB (if DORA applies to your FI). | NCSC-NL (art. 23 for non-DORA incidents). |
| **Payment system operator** | DNB (EU Payment Systems Directive). | **Not applicable** (DORA does not apply). | NCSC-NL (art. 23). |
| **Trading venue / CCP** | AFM (Dutch financial conduct regulator) for trading venues; ESMA for EU CCPs. | **Not applicable**. | NCSC-NL (art. 23). |
| **CSD** | ECB (if Eurosystem CSD) or DNB (if national). | **Not applicable**. | NCSC-NL (art. 23). |

**NCSC-NL role:** Operates national CSIRT for art. 23 incident reporting; coordinates with DNB + AFM on escalation. Maintains national cyber-incident timeline + cross-sector threat intelligence.

**MinFin (Ministry of Finance):** Policy oversight; participates in EU-level crisis coordination (e.g. ransomware against systemic FI → possible ECB/ESMA emergency powers invocation).

---

## Adjacent NL/EU regimes

- **PSD2 (EU 2015/2366) / PSD3 (forthcoming)** — Payment Services Directive. SCA (Strong Customer Authentication) + 3DS2 fraud prevention required. Incident reporting overlaps with NIS2 art. 23 for payment-related breaches.
- **MiFID II (EU 2014/65)** + **Delegated Reg. (EU) 2017/575** — trading-venue security & reporting. Sector-specific incident thresholds may differ from NIS2.
- **GDPR (EU) 2016/679)** — personal data breach notification within 72h (AP). *Parallel* with NIS2 art. 23; both apply if financial customer data exposed.
- **EBA Guidelines on ICT and Security Risk Management** (EBA/GL/2013/09, updated 2022) — shadow-banking, third-party outsourcing, penetration testing baselines. Aligns with DORA intent.
- **SWIFT Customer Security Framework (SWIFT CSP)** — applies to SWIFT users (nearly all NL banks); annual attestation + incident notification required.
- **Cybersecurity Certification Scheme (EUCC)** — optional but increasingly contractual for cloud-service providers; may be flow-down requirement to fintech SaaS.
- **Card Scheme Rules** (Visa, Mastercard, Amex) — PCI-DSS compliance + incident notification thresholds often stricter than NIS2 art. 23.

---

## Top sector-specific risks

1. **SWIFT compromise (Bangladesh-class attacks):** Attacker gains credentials to bank's SWIFT infrastructure, initiates fraudulent payment orders. Mitigation: SWIFT CSP attestation, multi-signature approval, out-of-band confirmation for large transfers, real-time transaction monitoring.

2. **Card fraud & ATM jackpotting:** Skimming, cloning, NCR/Diebold ATM exploit chains. Mitigation: EMV tokenization, encrypted PIN pads, PCI-DSS compliance, firmware validation, frequent ATM audits.

3. **Account takeover (ATO) via phishing or SIM swap:** Fraudster gains user credentials, initiates unauthorized transfers. Mitigation: PSD2 SCA/3DS2 enforcement, passwordless authentication (FIDO2), step-up authentication for high-value transactions.

4. **DDoS extortion against payment systems:** Attacker floods iDEAL, ATM network, or online-banking front-end; demands ransom. Mitigation: redundant network paths, upstream DDoS scrubbing, incident-response plan pre-negotiated with NCSC-NL.

5. **Ransomware vs. core banking:** WannaCry/NotPetya-class attack encrypts back-office or payment-processing infrastructure. Mitigation: air-gapped, versioned backups; RTO ≤ 4h procedures; tabletop exercises including manual payment-processing fallback.

6. **Supplier compromise via fintech BaaS:** Third-party fintech platform serving multiple smaller banks is compromised; shared microservices or shared cloud environment affected. Mitigation: due-diligence questionnaire pre-onboarding; audit rights; sub-processor approval; incident SLA (≤4h) contractual.

7. **AML system manipulation:** Fraudster manipulates transaction metadata to avoid AML alerts; sanctions evasion. Mitigation: transaction-audit logging, AML-system integrity checking, insider-threat monitoring, quarterly data-quality audits.

8. **Deepfake voice fraud against treasury:** CEO impersonation attack via AI voice synthesis induces wire transfer. Mitigation: out-of-band confirmation (SMS/push) for large FX/wire transfers; voice-verification biometrics for high-touch calls; training + cultural vigilance.

9. **Insider threats in 24/7 ops:** Trusted employee with payment-approval access performs unauthorized transactions or extracts customer data. Mitigation: segregation of duties, transaction limits, session recording, KPI monitoring for anomalies.

10. **Third-party API abuse:** Exposed fintech API (open banking, account-aggregator) abused by fraudulent actor to scrape PII or initiate transfers. Mitigation: OAuth 2.0 / OIDC scope limits, rate limiting, IP allow-listing, consumer consent logging.

---

## Quick-win checklist (12-15 items for 60–90 days)

- [ ] **DORA vs. NIS2 determination** — confirm your institution's regulatory classification (DORA-covered FI or NIS2-only entity) with your competent authority (DNB, AFM, ESMA as applicable).
- [ ] **PSD2 SCA/3DS2 mapping** — verify all payment channels (web, mobile, API, ATM) enforce Strong Customer Authentication per scheme rules; real-time fraud monitoring enabled.
- [ ] **SWIFT CSP attestation** — ensure annual SWIFT Customer Security Framework audit is contracted; remediation plan for gaps on file.
- [ ] **EBA ICT-baseline gap map** — crosswalk DORA RTO/RPO targets (≤4h / ≤1h) + TLPT readiness against current state; identify remediation priority.
- [ ] **DORA TLPT prep (if applicable)** — if you are a DORA-covered FI, designate red-team exercises and annual threat-led penetration-test schedule coordinated with DNB/ECB.
- [ ] **BCM target ≤2h RTO for critical functions** — documented recovery procedures + tested restore drills for core banking, payment processing, customer-facing channels at least semi-annually.
- [ ] **Third-party register with security assessment** — maintain spreadsheet of all ICT service providers, fintech partners, payment processors; flow-down incident SLAs (≤24h DORA-critical, ≤4h incident notify).
- [ ] **Real-time fraud monitoring** — implement transaction-monitoring dashboard (velocity checks, AML flagging, anomaly detection) with escalation to CISO / Chief Risk Officer.
- [ ] **Secure coding + supply-chain practices** — SBOM requirement for banking apps/fintech integrations; code-signing verification for critical payment infrastructure.
- [ ] **Data encryption** (at rest & in transit) — customer PII, payment messages, audit logs encrypted; key management via FIPS 140-2 HSM; SWIFT messages encrypted end-to-end.
- [ ] **MFA + passwordless authentication** — FIDO2 / passkey baseline for all internal staff; step-up MFA for high-value transaction approval; phishing-resistant for treasury officers.
- [ ] **Incident playbook (DORA + NIS2)** — unified response plan with parallel reporting channels (DNB/NCSC-NL if NIS2; DORA 4h clock if FI); pre-populated templates, named escalation contacts.
- [ ] **Customer notification template** — PSD2 + NIS2 art. 23(2) recipient-communications plan; pre-agreed message templates and disclosure thresholds with legal/compliance.
- [ ] **24/7 incident escalation** — contact tree with DNB, NCSC-NL, AFM, ECB (if systemically important), SWIFT incident hotline. Test escalation path ≥ biannually.
- [ ] **Third-party audit programme** — rolling 3-year audit schedule of fintech partners, payment processors, cloud providers; ISAE 3402 / SOC 2 Type II reports required.

---

## Incident-reporting nuances

### DORA major-incident reporting (if applicable)

- **Detection → DNB report: ≤4 hours** (not 24h as in NIS2 art. 23).
- **Detailed investigation report: ≤10 business days** (not 30 days).
- DNB has authority to mandate public disclosure thresholds; coordinate with communications + legal.
- ECB may engage if the incident affects a systemically important institution or the broader financial system.

### NIS2 art. 23 reporting (non-DORA entities or non-DORA incidents)

- **Early warning (suspected malice): 24 hours** to NCSC-NL.
- **Notification (confirmed significant): 72 hours** with severity assessment + initial impact estimate.
- **Final report: 1 month** with root cause, remediation + lessons learned.
- NCSC-NL distributes to sector peers; incident enters national timeline.

### Dual-status (entity that is both DORA-covered AND has non-DORA incidents)

Example: Large bank under DORA suffers data breach unrelated to payment processing. Both regimes may apply:
- **DORA clock:** If it affects ICT services in scope (core banking, payment), 4h to DNB + 10-day detailed report.
- **NIS2 art. 23 clock:** Incident under NIS2 scope (customer PII, infrastructure confidentiality); report to NCSC-NL per standard timeline (24h/72h/1mo).
- **GDPR clock:** Personal data exposed; notify AP within 72h if breach is high-risk.

**Recommendation:** Design incident-response workflow with *three parallel tracks*. Single incident investigation feeds all three reports.

### Payment-system specific reporting

- **iDEAL operator** (Currence): reports significant incidents to DNB + NCSC-NL + Currence incident process.
- **SEPA operator:** escalates to ECB + relevant MS central banks.
- **Card scheme incidents:** Visa / Mastercard / Amex incident SLAs often *tighter* than regulatory minimums; align your RTO/RPO.

### Ransomware scenario

If ransomware locks core banking:
1. **Immediate (≤1h):** Internal incident command activated; comms to DNB + NCSC-NL + law enforcement (POLITIE/AIVD).
2. **DORA clock (≤4h if applicable):** DNB major-incident report triggered if FI status is DORA-covered.
3. **NIS2 clock (≤24h):** Early warning to NCSC-NL even if you don't yet know if ransom was paid.
4. **Recovery focus:** Backup restoration, business continuity activation, customer-facing crisis comms.
5. **Investigation (≤10 days DORA / ≤30 days NIS2):** Forensics + root cause; payment of ransom (if any) noted in final report.

---

## Mapping to corpus

| Resource | Purpose |
|----------|---------|
| [`eu-directives/md/nis2-2022-2555-NL.md`](../eu-directives/md/nis2-2022-2555-NL.md) | NIS2 Annex I.3 & I.4 (banking & financial scope). |
| [`eu-directives/md/dora-2022-2554-NL.md`](../eu-directives/md/dora-2022-2554-NL.md) | DORA full text; art. 18–19 (incident reporting), art. 20 (TLPT), art. 28–30 (third-party requirements). |
| [`FAQ-compliance-officers.md`](../FAQ-compliance-officers.md) | Q23 (DORA carve-out), Q1 (scope test), Q6–14 (NIS2 obligations + incident reporting), Q18 (DNB/AFM/ESMA supervision). |
| [`CHECKLIST-CISO.md`](../CHECKLIST-CISO.md) | Sections 2.a–2.j (art. 21 measures for non-DORA entities), section 4 (incident reporting), section 5 (DORA supplement if applicable). |
| [`enisa-guidance/md/ENISA_Technical_Implementation_Guidance_v1.0.md`](../enisa-guidance/md/ENISA_Technical_Implementation_Guidance_v1.0.md) | CIR-style controls mapping (art. 21 baseline); applies to payment systems, trading venues, CCPs, CSDs. |

---

## See also

- [`README.md`](../README.md) — Corpus overview + "About NIS2 in 60 seconds."
- [`GLOSSARY.md`](../GLOSSARY.md) — Terminology (DORA, TLPT, SCA, 3DS2, iDEAL, SWIFT CSP, RTO, RPO, AML, ATO, fintech BaaS, FI).
- [`TIMELINE.md`](../TIMELINE.md) — NL Cbw entry-into-force (~July 2026); DORA phase-in (Article 6–16 compliance Q1 2025, TLPT Q4 2025).
- [`CHECKLIST-CISO.md`](../CHECKLIST-CISO.md) — Full readiness checklist; sections 2, 4, and DORA supplement.
- [`FAQ-compliance-officers.md`](../FAQ-compliance-officers.md) — Practical Q&A on DORA scope, DNB supervision, incident reporting dual-track.
- [`templates/`](../templates/) — CSV templates for third-party assessment, incident register, DORA TLPT exercise log.

---

> **Disclaimer:** This guide is not legal advice. NIS2 + DORA are binding EU law. NL Cbw + Cyberbeveiligingsbesluit entry-into-force expected ~July 2026. DORA obligation entry dates: art. 6–16 Q1 2025, TLPT Q4 2025. Verify against DNB, AFM, ESMA, EBA, and EUR-Lex sources before board-level compliance decisions.
