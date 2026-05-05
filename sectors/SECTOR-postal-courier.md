# NIS2 Postal & Courier Sector Guide

**Scope:** Postal service providers (universal and commercial) and courier operators, including parcel delivery, express services, and specialized logistics. NL has designated postal and courier operators as **Important** entities under NIS2 Annex II.1.

**Audience:** Postal and courier service CISOs, compliance officers, logistics IT directors, operations security teams, procurement specialists, last-mile network managers.

---

## Are you in scope?

Your organization falls under NIS2 Postal & Courier (Annex II.1) if you are:

| Entity type | Scope indicator | Tier |
|-------------|-----------------|------|
| **Universal postal service provider** | Designated provider for NL (PostNL, De Ptt). Mandatory nationwide coverage. | **Important** |
| **Commercial parcel/express operator** | DHL Parcel, DHL Express, DPD, FedEx-NL, GLS-NL, UPS-NL, TNT-NL. Multi-country or major domestic coverage. | **Important** |
| **B2B parcel/logistics partner** | Retailers' own fleets (Picnic fresh delivery, Albert Heijn logistics), Bol.com partners, specialist B2B couriers. | **Important** (if ≥50 emp OR ≥€10M turnover) |
| **Parcel-locker networks** | Unattended collection/drop-off infrastructure (DutchSmile, ParcelLocker, PostNL lockers, Eurobox, supermarket lockers). | **Important** (if operator meets threshold) |
| **Specialized couriers** | Medical sample transport, secure valuables (G4S Cash Solutions, cash-in-transit), temperature-controlled parcels, high-value freight. | **Important** (if meets threshold) |
| **Final-mile aggregators** | Dispatch platforms serving multiple couriers (e.g., Sendcloud, multi-carrier routing SaaS). | **Important** (if operator meets threshold) |

**Size threshold:** ≥50 employees OR ≥€10M annual turnover. Smaller operators below threshold are **out of scope**.

**Tier:** All in-scope operators are **Important tier**. Risk-based supervision; incident reporting required.

---

## NL competent authorities & CSIRT roles

**Postal regulation & economic oversight:**
- **ACM (Autoriteit Consument en Markt)** — Regulates postal market under Postwet 2009. Supervises universal service obligations (USO), tariff regulation, access rights. Receives postal-service-disruption notifications.

**Cybersecurity & incident reporting:**
- **NCSC-NL (Nationaal Cyber Security Centrum)** — National CSIRT. Receives 24h early warning + 72h full incident notifications (NIS2 art. 23). Incident assessment, coordinated disclosure, threat intelligence.
- **RDI (Rijksdienst voor Identiteitsgegevens)** — Critical for incidents involving identity data in parcels (e.g., leaked customer PII, exported ID card photo data in international shipments).

**Sector-specific oversight:**
- **NCSC-NL CSIRT** is primary contact for all cybersecurity incidents. Escalation to NCTV (national security) for incidents affecting supply chain to critical sectors (healthcare, financial, energy).

**Customs & international cargo:**
- **DGCA (Directie Generaal Douane en Accijnzen)** — Customs authority. Receives notifications of incidents affecting export-control data or customs-EDI systems. Coordinates with EU customs network.
- **ILT (Inspectie Leefomgeving en Transport)** — For air-cargo security incidents (civil aviation). Coordinates with EASA + EU air-cargo security rules.

---

## NL adjacent compliance regimes

### Postwet 2009 — Postal Services Law

**What it is:** NL law regulating postal market. Universal service obligation (USO) requires designated provider to deliver parcels/letters ≥6 days/week, nationwide, at uniform tariff.

**Overlap with NIS2:** Service availability. PostNL USO contracts require 99.5% delivery SLA. Cybersecurity incidents causing service disruption (ransomware halting sortation hubs, parcel-tracking DDoS) may breach USO obligations and trigger:
- ACM penalty proceedings.
- Notification to Minister of Interior.
- Public disclosure of service failures.

**Practical implication:** Document incident thresholds: outages >4h triggering ACM notification; >24h triggering emergency remediation reports. Coordinate NIS2 + ACM incident response timelines.

---

### GDPR & Addressee Data Protection

**What it is:** Postal operators process personal data of senders + addressees (names, addresses, phone, email). GDPR art. 5(1)(a–e) requires lawful, transparent, secure processing.

**Overlap with NIS2:** Data security (GDPR art. 32) echoes NIS2 art. 21(2). Incidents affecting parcel metadata or POD signatures create dual-track obligations:
- **AP (Autoriteit Persoonsgegevens)** — Personal data breach notification within 72h (GDPR art. 33).
- **NCSC-NL** — Cybersecurity incident notification within 24h/72h (NIS2 art. 23).

**Addressee communication:** If parcel data leaked, affected recipients must be notified (GDPR art. 34) unless encrypted/pseudonymized. High-volume incidents (e.g., 100k+ compromised parcel IDs) require coordinated messaging.

**Practical implication:** Dual-track incident playbook. Joint assessment: personal data affected? → GDPR + NIS2 tracks; otherwise NIS2-only.

---

### EU Customs Union (UCC) & Import/Export Control

**What it is:** Customs procedure regulations (UCC) for cross-border parcel movement. Export-controlled goods (dual-use electronics, cryptography, chemicals) require customs documentation, tariff classification, sanctions screening.

**Connection to NIS2:** Customs-EDI data (NCTS, ENS, exit declarations) are critical operational data. Incidents compromising customs systems create:
- Export-control violations (parcel mule rings, sanctions evasion).
- Regulatory penalties (DGCA, EU).
- Customs authority incident reporting.

**Risk scenario:** Ransomware locks customs-EDI module; operator unable to file electronic export declarations; parcels queue at border; supply chain to retailers breaks.

**Practical implication:** Customs-EDI systems must be inventoried separately; treat as critical OT-adjacent systems. Establish DGCA incident contact; test manual customs procedures as BCP fallback.

---

### DAC7 (Digital Services Tax — Reporting)

**What it is:** EU digital services tax rule. Marketplace platforms (e.g., Bol.com, Zalando) that process courier data must report fulfilment service volumes.

**Connection to NIS2:** If your SaaS platform (routing engine, TMS, booking API) processes data for multiple couriers/marketplaces, incidents affecting data accuracy or confidentiality may affect DAC7 reporting obligations.

**Practical implication:** If you operate a multi-carrier TMS or marketplace fulfillment service, include DAC7 reporting stakeholders in incident communication.

---

### ECMS & Electric Vehicle Charging

**What it is:** EU regulation on EV charging points (ECMS — Electric Charging Management System). Last-mile fleets increasingly electrified (DHL eVans, PostNL electric bikes).

**Connection to NIS2:** If your operator owns/operates public EV chargepoints (e.g., for driver/vehicle charging), ECMS cybersecurity rules apply (roaming protocols, payment processing).

**Practical implication:** Segregate EV charging infrastructure from parcel systems; assess ECMS compliance separately.

---

### R155/R156 — Vehicle Telematics & Cyber-Physical Safety

**What it is:** EU regulation mandating cybersecurity for vehicle software (connected vehicles, autonomous features). Heavy-goods vehicles with telematics, GPS tracking, real-time route optimization are in scope.

**Connection to NIS2:** Vehicle telematics networks (GPS tracking, fuel-efficiency monitoring, driver-behavior logging) connected to corporate dispatch systems create IT-OT boundary risks.

**Practical implication:** Segment vehicle telematics from admin networks; assess R155/R156 compliance for connected fleets separately.

---

## Top sector-specific risks

**Parcel-tracking platform DDoS:**
- Consumer-facing tracking websites (PostNL.nl, DHL.de, Track&Trace) are high-profile targets. DDoS causes customer frustration, media attention, lost revenue.
- **Mitigation:** Anti-DDoS service provider (Cloudflare, AWS Shield, Akamai). Rate-limiting on API endpoints. Fallback tracking methods (SMS, email notifications).

**Ransomware halting sortation hubs:**
- Automated sorting infrastructure is OT-adjacent critical system. Ransomware can lock PLCs, conveyors, barcode readers, label printers.
- **Cascade risk:** Hub down → parcels queue → retailers' inventory cutoff → supply-chain disruption to supermarkets, e-commerce.
- **Mitigation:** IT/OT network segmentation. Immutable backups (≥7 days versioning). Offline recovery procedures documented + tested quarterly. Incident SLA (restore sortation within 4h).

**Customs-data leakage:**
- Export-controlled goods metadata (tariff classification, destination country, shipper, contents) leaked or corrupted → export-control violations, sanctions evasion facilitating, regulatory fines.
- **Mitigation:** Customs-EDI encryption (mTLS or signed API calls). Access controls limiting who queries customs data. Audit logging. Regular data-protection impact assessments (DPIA).

**Last-mile mobile-app fraud & compromised POD:**
- Driver apps (route maps, parcel barcodes, proof-of-delivery signatures) are targets for spoofing, hijacking, malware injection. Fake POD (falsely marked "delivered") enables parcel theft, carrier fraud.
- **Mitigation:** App integrity attestation (SafetyNet/Play Integrity, App Attest). Per-route cryptographic signing keys. GPS validation. Driver authentication (FIDO2 where possible). Audit high-value PODs.

**Fraudulent label generation:**
- Attackers generate fake shipping labels (valid barcodes, false destinations) to exploit parcel-mule shipping chains, money laundering, sanctions evasion.
- **Mitigation:** Label-issuance authentication (OAuth 2.0, mutual TLS). Serialized label tracking (detect duplicate/reissued). Anomaly monitoring (unusual volume spikes, high-value routes). Fraud-intelligence sharing with postal-fraud task force.

**Supply-chain risk via SaaS routing/TMS:**
- Many couriers depend on third-party routing engines (Sennder, Flexport, TMS Cloud), workforce-management SaaS (Workable, BambooHR), API integrations to retailer ERP (SAP, Oracle, NetSuite).
- **Cascade risk:** SaaS vendor breach → parcel data, driver data, or retailer order data compromised → cascading notification to retailers' customers.
- **Mitigation:** Supplier risk register including SaaS vendors. Contractual incident-notification SLA (4h notification). Participation in supplier security reviews. Redundant routing fallback.

**Warehouse robotics & sortation OT compromise:**
- Modern hubs use collaborative robots (cobots), automated guided vehicles (AGVs), autonomous sortation systems. IoT sensors + network connectivity create OT attack surface.
- **Mitigation:** Asset inventory of all OT devices. Segregated OT network (no direct internet access). Firmware-validation procedures. Intrusion-detection monitoring for OT.

**Business Email Compromise (BEC) targeting high-value freight:**
- Attackers impersonate shipper, receiver, or carrier management to redirect high-value parcels, intercept payment, or obtain shipping credentials.
- **Mitigation:** BEC training for finance + customer-onboarding teams. DMARC/SPF/DKIM email authentication. Verify shipper identity via out-of-band contact before processing high-value shipments.

**Cargo theft tied to compromised tracking data:**
- Attackers gain access to internal tracking system, identify high-value parcels in transit, tip off theft rings, intercept during transport.
- **Mitigation:** Access controls on tracking data (role-based, need-to-know). Audit logging. Encryption of parcel-value metadata. Decoupling tracking data from location data (separate systems/keys).

**Identity theft via stolen parcel data:**
- Leaked shipment records contain sender/receiver names, addresses, phone numbers. Criminals use for phishing, account takeover, financial fraud targeting recipients.
- **Mitigation:** Encryption at-rest + in-transit. Data minimization (collect only required fields). Regular data inventories. Incident playbook for large-scale data breaches.

---

## Quick-win checklist

- [ ] **NIS2 + ACM incident-reporting protocol** — Document dual-track timelines: 24h early warning to NCSC-NL + immediate notification to ACM if service disruption >4h.
- [ ] **Asset inventory including SaaS + OT** — Parcel-tracking platforms, sortation hubs (PLCs, conveyors), routing TMS, driver apps, customs-EDI systems, EV charging, telematics. Reference: [`templates/asset-inventaris-template.csv`](../templates/asset-inventaris-template.csv).
- [ ] **MFA on tracking + admin portals + driver apps + customs-EDI** — FIDO2 for staff; Passkeys where possible. Enforce on all shipper + parcel-shop accounts.
- [ ] **Sortation OT network segmentation** — Isolate PLCs, conveyors, barcode readers from corporate IT. Whitelist inter-segment traffic. Document air-gaps for critical functions.
- [ ] **IT/OT asset inventory + firmware baseline** — Catalog all robotics, IoT sensors, AGVs. Establish firmware versions + checksums. Implement firmware-update validation procedures.
- [ ] **Label-issuance authentication + duplicate prevention** — Implement OAuth 2.0 + mTLS on label APIs. Serialize labels; detect re-issue attempts. Anomaly monitoring for volume spikes.
- [ ] **Customs-EDI encryption (mTLS or signed API)** — Ensure customs declarations encrypted in transit. Establish DGCA incident contact.
- [ ] **Anti-DDoS service for tracking platforms** — Contract with CDN/anti-DDoS provider (Cloudflare, AWS Shield, Akamai). Rate-limiting on public APIs. Fallback tracking methods documented.
- [ ] **Third-party SaaS register including TMS, routing, WMS** — Document all critical vendors (routing engines, workforce management, ERP integrations). Include contractual incident-notification SLA. Reference: [`templates/sub-verwerker-register-template.csv`](../templates/sub-verwerker-register-template.csv).
- [ ] **GDPR + NIS2 dual-track incident playbook** — Joint assessment: personal data affected? → AP (72h) + NCSC-NL (24h/72h); otherwise NIS2-only. Pre-coordinate with NCSC-NL + AP contacts.
- [ ] **Fraud monitoring + label-generation auditing** — Detect unusual label volumes, suspicious shipper/destination patterns. Link to postal-fraud intelligence network (INTERPOL, national postal police).
- [ ] **Driver-app integrity attestation** — Implement SafetyNet/Play Integrity API (Android) or App Attest (iOS). Per-route cryptographic signing keys. Audit high-value PODs.
- [ ] **BEC training for finance + customer-onboarding** — Quarterly drills. Verify high-value shipper identity via out-of-band contact. Implement DMARC/SPF/DKIM.
- [ ] **Warehouse-robotics security assessment** — Firmware validation. OT intrusion detection. Segregated network access. Vendor security reviews.
- [ ] **Supplier risk assessment for critical SaaS + hosting** — Contractual SLAs, audit rights, incident-response procedures, data residency. Establish alternative vendors for routing/TMS.
- [ ] **DPIA (Data Protection Impact Assessment)** — Required for high-risk parcel + customs data processing. Document mitigations.
- [ ] **BCP exercise within 12 months** — Test sortation-hub recovery, customs-EDI fallback, tracking-platform failover, label issuance manual procedures. Document RTO/RPO.

---

## Incident-reporting nuances

**NIS2 art. 23 timelines:**
- **24h early warning** to NCSC-NL (initial assessment, expected severity, estimated impact).
- **72h full incident notification** (root cause, remediation steps, systemic risk assessment).

**ACM postal-service-disruption reporting:**
- If incident causes service unavailability >4h (sortation hub down, tracking platform offline, label-issuance failure), notify ACM **immediately** (within 2h of discovery).
- ACM may require remediation updates every 4h until service restored.
- >24h outage: escalates to Minister of Interior. Public disclosure likely.

**GDPR addressee notification (if personal data affected):**
- Notify AP within 72h (art. 33).
- Notify affected recipients without undue delay (art. 34) unless data encrypted/pseudonymized.
- Prepare addressee communication template in advance; coordinate with legal + comms.

**DGCA customs-data incident (if export-control/customs-EDI affected):**
- Notify DGCA within 24h if customs-EDI system unavailable or customs data (tariff codes, destination, contents) compromised.
- DGCA may coordinate with EU customs network + DG TAXUD.

**Media & public trust:**
- Postal/courier incidents attract media attention (consumer impact, supply-chain visibility, parcel-theft stories).
- Prepare proactive comms: what happened, which services affected, remediation timeline, customer actions (tracking status, reshipment).
- Avoid technical jargon; emphasize service restoration + customer protection.

---

## Mapping to corpus

| Resource | Purpose |
|----------|---------|
| [`eu-directives/md/nis2-2022-2555-NL.md`](../eu-directives/md/nis2-2022-2555-NL.md) | NIS2 Annex II.1 (postal services definition), tier classification, Important entity obligations. |
| [`ncsc-nl/md/www.ncsc.nl_cyberbeveiligingswet-nis2.md`](../ncsc-nl/md/www.ncsc.nl_cyberbeveiligingswet-nis2.md) | NCSC-NL incident-reporting procedures, registration, risk-management guidance. |
| [`CHECKLIST-CISO.md`](../CHECKLIST-CISO.md) | Full readiness checklist. Map sections 1–5 to postal/courier operations (asset inventory, incident reporting, risk measures). |
| [`FAQ-compliance-officers.md`](../FAQ-compliance-officers.md) | Q&A on Important entity obligations, incident thresholds, registration deadlines, competent-authority roles. |
| [`SECTOR-transport.md`](./SECTOR-transport.md) | Last-mile fleet overlap (vehicle telematics, R155/R156 cyber-physical safety, driver-behavior monitoring). |
| ACM Postwet guidance | https://www.acm.nl/ — Postal market regulation, USO obligations, incident-impact assessment. |
| DGCA Customs guidance | https://www.belastingdienst.nl/douane/ — Customs-EDI procedures, incident protocols. |

---

## See also

- [`README.md`](../README.md) — Corpus overview + "About NIS2 in 60 seconds."
- [`GLOSSARY.md`](../GLOSSARY.md) — Terminology (ACM, NCSC-NL, RDI, DGCA, ILT, USO, EDI, OT, POD, TMS, WMS, etc.).
- [`TIMELINE.md`](../TIMELINE.md) — NL Cbw entry-into-force date, registration window, reporting deadlines.
- [`CHECKLIST-CISO.md`](../CHECKLIST-CISO.md) — Full readiness checklist for governance, risk measures, incident response, registration.
- [`FAQ-compliance-officers.md`](../FAQ-compliance-officers.md) — Practical Q&A for postal/courier sector specifics.
- [`templates/`](../templates/) — CSV templates for asset inventory, supplier register, incident register, risk register.

---

> **Disclaimer:** This guide is not legal advice. NL Cyberbeveiligingswet and Cyberbeveiligingsbesluit entry-into-force expected ~Q2 2026. Postwet 2009, ACM guidance, and DGCA customs rules are maintained by respective authorities. Verify against live NCSC-NL, ACM, and DGCA sources before board-level decisions.
