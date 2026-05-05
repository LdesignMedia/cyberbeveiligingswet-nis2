# NIS2 Sector Guide: Food Production, Processing & Distribution

**Scope:** NIS2 Annex II point 4 — food production, food processing, food distribution, and beverages.

**Audience:** Food & beverage companies (producers, processors, distributors, retailers, logistics), and their compliance, IT, and operational teams preparing for the Dutch Cyberbeveiligingswet (Cbw) and NIS2.

> **Disclaimer:** Not legal advice. Cbw + AMvBs are not yet in force at the time of this corpus snapshot ([`INVENTORY.md`](../INVENTORY.md) — `Retrieved 2026-04-26`). Verify against the live source before relying on any answer for board-level decisions.

---

## Are you in scope?

**Three-part test:**

1. **Sector match** — You operate in food production (farming, milling, brewing, fermentation), food processing (packaging, pasteurization, preservation), food distribution (cold-chain logistics, warehousing), or food retail supply chains. See [`eu-directives/md/nis2-2022-2555-NL.md`](../eu-directives/md/nis2-2022-2555-NL.md) for the full Annex text.

2. **Size threshold** — You employ ≥ 50 people OR have annual turnover / balance sheet total ≥ €10M. Below this, you are typically **out of scope** unless you are a sole provider of critical food services in the Netherlands (rare).

3. **Establishment** — Your main establishment is in the Netherlands, or you provide food services regulated under NIS2 in the NL.

**If yes to all three:** You are an **Important entity** (lower-tier under NIS2) subject to reactive supervision and lower maximum fines than essential entities. Registration with NCSC-NL is mandatory (NIS2 art. 27). See decision tree: [`nl-overheid-publicaties/md/doorverwijsboom-cyberbeveiligingswet.md`](../nl-overheid-publicaties/md/doorverwijsboom-cyberbeveiligingswet.md).

---

## Major NL food sector clusters

The Dutch food sector is concentrated in a few strategic clusters and players:

- **Dairy** — FrieslandCampina (cooperative, €11B revenue), Campina, Friesche Vlag. High automation in processing + cold chain.
- **Meat & poultry** — Vion (pork, beef, €4.5B), Plukon (poultry), Westland-Friesche (poultry). Plant-floor automation + traceability systems.
- **Produce & horticulture** — Westland greenhouse cluster (tomatoes, peppers, cucumbers), Fleur (mushrooms), Berry operations. Climate-controlled growing + packing houses.
- **Retail & supply chains** — Albert Heijn, Jumbo (supermarkets with centralized DCs), Plus (regional), Picnic (e-grocery with cold-chain ops).
- **Brewers & beverages** — Heineken (€28B group), Bavaria, Grolsch, Amstel. Fermentation + packaging heavily automated.
- **Cold-chain logistics** — Frigo Transport, various 3PL operators. Refrigerated warehouses + delivery networks critical for dairy, meat, produce.

---

## NL competent authority

**Cybersecurity oversight:**
- **NCSC-NL** — Primary registration point and incident reporting (NIS2 CSIRT). Contact: [`www.ncsc.nl`](https://www.ncsc.nl).
- **RDI (Rijksdienst voor Identiteitsgegevens)** — Likely technical cyber competent authority under the Cyberbeveiligingsbesluit (pending entry into force).

**Sector-specific regulators (parallel to NIS2):**
- **NVWA (Nederlandse Voedsel- en Warenautoriteit)** — Primary food-safety regulator; oversees HACCP, traceability, hygiene, allergen control, veterinary controls, and recalls. Cyber incidents affecting food safety (e.g., temperature-monitoring system failure) fall under NVWA jurisdiction.
- **LNV (Ministerie van Landbouw, Natuur en Voedselkwaliteit)** — Policy; food fraud / import oversight.
- **RDI** — Technical cyber competent authority (overlaps with NVWA on incident response for food-safety-relevant cyber events).
- **NCSC-NL CSIRT** — Primary contact for NIS2 art. 23 significant incident reporting.
- **Customs (Douane)** — Supply-chain integrity, import controls.

**Action:** Confirm whether your primary regulator is NVWA (food-safety focus) or NCSC-NL (cyber focus). Incident response procedures must satisfy both.

---

## NL / EU adjacent regimes

### EU Food Safety Regulation 178/2002 & 852/2004 / HACCP (Hazard Analysis & Critical Control Points)

**Scope:** All food & beverage businesses in the EU supply chain.

**Cyber implication:** HACCP mandates documented traceability, temperature monitoring, allergen controls, and corrective actions. Cyber incidents affecting these systems (e.g., temperature-sensor spoofing, traceability-database manipulation) are food-safety incidents triggering NVWA investigation + potential product recalls.

**Action:** Map your HACCP critical control points (CCPs) to IT/OT systems (e.g., cold-chain SCADA, MES, labeling software). Incidents here must be logged as HACCP deviations + NIS2 incidents simultaneously.

### Warenwet (Dutch Commodities Act) + RASFF-NL (Rapid Alert System for Food & Feed)

**Scope:** Dutch food-safety law; mandatory notification for food-safety hazards.

**Cyber angle:** A cyber breach resulting in food contamination, allergen tampering, or loss of traceability triggers RASFF-NL notification (to NVWA + EU authorities). Merges with NIS2 incident reporting.

### General Food Law Traceability (Farm-to-Fork)

**One-step forward, one-step back traceability:** All food businesses must identify suppliers and customers for each batch. Digital traceability systems (ERP, MES, labeling) are critical.

**Cyber risk:** Ransomware or data breach affecting traceability databases delays recalls. Immutable audit logs / blockchain-backed systems recommended.

### Food Contact Materials Regulation (FCM) — EU 1935/2004 & 10/2011

**Scope:** Plastics, coatings, inks used in food packaging.

**Cyber implication:** Indirect. Cyber tampering with FCM-compliance documentation or formulation data could introduce non-compliant materials. Not a direct cyber risk unless your formulation/material IP is stored in vulnerable systems.

### AVG (GDPR) — Loyalty & e-commerce data

**Scope:** Personal data from loyalty programs (supermarkets, delivery apps), customer orders, dietary restrictions.

**Cyber risk:** Breach of customer loyalty database or e-grocery platform → GDPR art. 33 notification (72 hours to DPA) + NIS2 art. 23 (48 hours to NCSC-NL if significant). Converging timelines.

### Sector-specific standards: BRCGS, IFS, FSSC 22000 (GFSI)

**Scope:** Voluntary food-safety certification schemes (widely adopted by large manufacturers, retailers).

**Cyber angle:** These standards increasingly include cybersecurity as part of food-safety management. BRCGS v6 explicitly covers digital traceability + cyber resilience of critical systems.

---

## OT/ICS angle

Food sector infrastructure blends production automation, cold-chain monitoring, and supply-chain visibility:

- **Packaging & filling lines** — Tetra Pak, Krones (beverage), IMA (pharma/food), Bosch Packaging. PLC-controlled: speed, temperature, pressure, fill-level sensors. HMI (human-machine interface) for line operators.
- **Thermal processing** — Pasteurization, sterilization, UHT plants. Temperature-controlled via PLC + SCADA; critical for food safety. Sensor spoofing → unsafe product.
- **Cold chain & SCADA** — Refrigerated warehouses (−18°C to +4°C), refrigerated trucks, automated high-bay storage. SCADA monitors temperature, humidity, door sensors. Failure = millions in spoilage/day.
- **Milling & grinding** — Flour mills, spice mills, grinding equipment. Vibration sensors, motor controllers, throughput measurement. Cyber tampering → incorrect fineness/composition.
- **Fermentation & brewing tanks** — Yeast/microbial tanks (yogurt, beer, wine). Temperature, pH, pressure controlled via PLC. Cyber sabotage = batch loss.
- **Traceability / MES systems** — Production scheduling, lot tracking, allergen flags, recipe management. ERP (SAP, NetSuite) feeds to plant-floor systems. MES ties together order → recipe → packaging label → cold-chain routing.
- **E-commerce & delivery routing** — Grocery apps, delivery systems. Order → warehouse pick → cold-box → delivery vehicle tracking.

**OT/IT convergence risks:** Ransomware on corporate IT spreads to MES / cold-chain SCADA (e.g., NotPetya on brewery systems). Legacy OT often lacks patching cycles.

---

## Top sector risks

**Ransomware halting cold chain:**
- Encrypted SCADA / refrigeration controller = immediate spoilage. Dairy, meat, frozen goods: €1M–€5M/day loss per facility.
- Recovery: Offline backup of SCADA configs + sensor calibration? Manual override procedures tested?

**Recipe & IP theft:**
- Food formulations, process parameters, flavor profiles are trade secrets worth millions. Insider exfiltration or third-party MES-SaaS breach.
- Threat: Outsourced recipe R&D partner with weak access control; cloud-sync enabled on engineering workstations.

**Traceability system manipulation (HACCP bypass):**
- Manipulate MES or labeling system to hide allergens, batch origins, or expiration dates. Food-safety scandal + criminal liability.
- Threat: Ransomware leaves traceability DB corrupted; insider deliberately modifies batch records.

**Supply-chain cold-chain SaaS compromise:**
- Third-party temperature-monitoring SaaS (e.g., Sensormatic, Emerson-hosted SCADA) breach = real-time visibility into competitor operations + opportunity to spoof sensor data.
- Mitigation: Redundant on-site temperature monitoring; immutable audit logs; incident-response contract with provider.

**E-commerce platform tampering (delivery apps, grocer sites):**
- Compromised Picnic, AH.nl, Jumbo.com order system → wrong items picked / wrong cold-chain routing → customer receives unsafe product.
- Threat: SQL injection in delivery-route optimization; MFA failure on warehouse pick-system admin.

**Allergen labeling tampering:**
- Cyber attack on labeling software → incorrect allergen flags printed → product shipped without "Contains: peanuts" warning → patient anaphylaxis.
- Threat: Malware on label-printer network; tampering with MES allergen field.

**IT–OT pivot from corporate to plant floor:**
- Ransomware on corporate email spreads via compromised supplier VPN gateway → gains access to plant MES / SCADA → production halt. NotPetya-class attack.
- Mitigation: Firewall + DMZ; MFA on MES; incident response drills.

---

## 12-15 quick-win checklist

1. **Cold-chain monitoring redundancy** — Primary SCADA + backup on-site sensors (Lascar, Testo, etc.) logging to isolated storage. Annual validation of sensor accuracy.

2. **OT asset inventory tagged by food-safety criticality** — All PLC, SCADA, HMI, packaging controllers, cold-storage monitors, labeling systems listed with: criticality (critical vs. non-critical for food safety), firmware version, last patch date, network isolation status.

3. **Immutable HACCP audit logs** — Traceability DB + MES allergen/batch records append-only (no delete/edit after production). Consider blockchain or write-once storage for critical records.

4. **IT/OT segmentation** — Firewall between corporate ERP (IT) and plant-floor systems (OT, MES, SCADA). DMZ for historian, remote-access VPN.

5. **MFA on MES + traceability + e-commerce admin** — All system admins + operators with batch/allergen authority use MFA (YubiKey, authenticator). Especially e-commerce sites (Picnic, Jumbo backend).

6. **Ransomware tabletop including spoilage scenario** — "Cold-chain SCADA encrypted; 10,000 tons of product spoiling; recall initiated; customer notification?" Run annually. Document roles, decision tree, communication cascade.

7. **Supplier register including SaaS providers + cold-chain telematics** — List all third-party systems: MES host, temp-monitoring SaaS, delivery-routing software, loyalty-program vendor. Include incident-response SLAs + breach notification timelines.

8. **Recipe access + PAM (Privileged Access Management) + masking** — Formulations stored in secrets manager (HashiCorp Vault, AWS Secrets Manager). Access logs searchable. Non-prod environments use masked/anonymized recipes.

9. **Joint NVWA + AP (Autoriteit Persoonsgegevens, now UAID) + NCSC-NL incident playbook** — Converging regulatory timelines: HACCP deviation (NVWA 24h), GDPR breach notification (72h to AP), NIS2 art. 23 significant incident (48h to NCSC-NL). Unified communication plan avoids duplicate/conflicting statements.

10. **Batch recall procedure with cyber-event scenario** — Test annually: "Allergen tampering suspected in batch XYZ; supply chain notification; product recovery; press release?" Coordinate with NVWA, customers, logistics partners.

11. **Offline backup of SCADA + MES configs + thermal-process setpoints** — USB or network-isolated storage. Test restore once per year. Keep in secure physical location (safe).

12. **Temperature-monitoring sensor redundancy + anomaly alerting** — Primary SCADA + independent data logger for critical cold zones. Alert on deviation (±2°C) + missing heartbeat.

13. **Firewall rules for vendor remote access to MES** — All remote-access engineers use VPN + MFA + jump-host with session recording. Audit log searchable. Disable direct RDP/SSH to production MES.

14. **Incident reporting SLA to NVWA + customers** — Written commitment: "Food-safety incidents reported to NVWA within X hours; customer notification within 24–48h per contract."

15. **Food-sector security awareness training** — All staff (production, QA, logistics, e-commerce ops) trained on: phishing targeting suppliers, USB hygiene, allergen-system access controls, incident escalation. Annual refresher.

---

## Incident-reporting nuances under NIS2 + Warenwet + RASFF

**Food-safety incident ≠ NIS2 significant incident:**
- A temperature-monitoring system failure may trigger HACCP corrective action (NVWA) without meeting NIS2 art. 23 significance threshold (impact on essential services / society).
- **Judgment:** If product spoils but no public health risk + no supply-chain cascade → NVWA-only. If cascades to patient harm / widespread recall → both NIS2 + RASFF.

**RASFF-NL mandatory notification (separate from NIS2):**
- Warenwet art. 7: Suspected food-safety hazard → NVWA (24–48h). Merges with NIS2 timeline (NCSC-NL 48h for significant incidents).
- Converging streams: Single incident may trigger dual notification (NVWA + NCSC-NL). Coordinate communication to avoid conflicting public statements.

**GDPR breach from e-commerce platform:**
- Customer loyalty database / e-grocery order data breach → AP (now UAID) notification (72h) + NIS2 (48h). Shortest timeline is 48h → must notify both simultaneously.

**Supply-chain cold-chain SaaS incident:**
- Breach of third-party temp-monitoring provider → Your incident report (NIS2 art. 23) + Supplier incident report (they notify NCSC-NL). Coordinate response: understand provider's timeline + remediation plan before your own notification.

**Cyber + food-safety convergence:**
- Ransomware rendering traceability system inoperative for 24h → potential food-safety scandal (can't prove safety of past batches) + NIS2 significant incident. Single incident triggers dual reporting.

---

## Mapping to corpus

- **Core NIS2 text** → [`eu-directives/md/nis2-2022-2555-NL.md`](../eu-directives/md/nis2-2022-2555-NL.md), Annex II point 4.
- **ENISA guidance** → [`enisa-guidance/md/ENISA_Technical_Implementation_Guidance_v1.0.md`](../enisa-guidance/md/ENISA_Technical_Implementation_Guidance_v1.0.md) (risk assessment, organizational measures).
- **Readiness checklist** → [`CHECKLIST-CISO.md`](../CHECKLIST-CISO.md) — all 10 mandatory measure areas; focus on 2.b (asset inventory + OT criticality tagging), 2.c (BCM/DR for cold-chain resilience), 2.d (supply-chain security for SaaS vendors + logistics), 2.f (internal audits of MES + traceability systems).
- **Related sector** → [`SECTOR-manufacturing.md`](../SECTOR-manufacturing.md) — overlaps on plant-floor automation (OT/IT segmentation, SBOM, vendor management).
- **FAQ** → [`FAQ-compliance-officers.md`](../FAQ-compliance-officers.md) — Q1–Q12 cover scope, obligations, tiers, incident reporting.
- **Quick-start** → [`QUICKSTART-SME.md`](../QUICKSTART-SME.md).

---

## See also

- **README** — [`README.md`](../README.md) — NIS2 in 60 seconds + governance structure.
- **GLOSSARY** — [`GLOSSARY.md`](../GLOSSARY.md) — Key terms (Annex I, Annex II, essential, important, significant incident).
- **TIMELINE** — [`TIMELINE.md`](../TIMELINE.md) — Key dates for Cbw entry into force and supervision ramp-up.
- **Dutch decision tree** — [`nl-overheid-publicaties/md/doorverwijsboom-cyberbeveiligingswet.md`](../nl-overheid-publicaties/md/doorverwijsboom-cyberbeveiligingswet.md).

---

**Last updated:** 2026-05-05  
**Status:** Draft (pending Cyberbeveiligingsbesluit entry into force)
