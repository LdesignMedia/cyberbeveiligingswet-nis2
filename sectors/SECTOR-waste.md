# NIS2 Waste Sector Guide

**Scope:** Waste management operators including waste-to-energy (incineration), sorting facilities, landfill operators, hazardous-waste handlers, collection and transport services, recycling specialists, and omgevingsdiensten (regional environmental authorities) operating direct collection services.

**Audience:** Waste management company CISOs, operations teams, supervisory boards, procurement teams managing OT/ICS infrastructure for incineration and sorting plants, incident response teams.

---

## Are you in scope?

Your organization falls under NIS2 Waste (Annex II.2) if you operate in one or more of these areas:

| Sub-sector | Scope indicator |
|-----------|-----------------|
| **Waste-to-energy (incineration)** | Operates thermal conversion facility with electricity grid tie and/or district heating. Essential if ≥ 50 FTE or € 10M revenue. Examples: AEB Amsterdam, Renewi waste-to-energy, HVC, Twence. |
| **Hazardous-waste incineration** | Operates facility handling chemically contaminated waste streams. Essential if ≥ 50 FTE or € 10M revenue. |
| **Waste sorting + recycling** | Operates optical sorter, magnetic separator, or eddy-current lines. Essential if ≥ 50 FTE or € 10M revenue. Examples: large Renewi sorting facilities, ASR Group, specialized recyclers. |
| **Landfill + leachate management** | Operates licensed landfill with active leachate and biogas systems. Essential if ≥ 50 FTE or € 10M revenue. |
| **Organic-waste digestion** | Anaerobic digestion facility with biogas generation. Essential if ≥ 50 FTE or € 10M revenue. |
| **Collection + transport** | Collection services for municipal waste, recyclables, or hazardous waste. Essential if ≥ 50 FTE or € 10M revenue; typically includes vehicle tracking, route optimization, weighbridge systems. |
| **Regional authority (omgevingsdienst)** | Direct operation of waste collection or transfer stations. May fall under Essential if ≥ 50 FTE or € 10M revenue in waste operations. |

**Tier:** Most waste operators are **Important** (Annex II.2) unless additionally designated as Essential. Size threshold: ≥ 50 FTE or € 10M annual revenue.

---

## NL competent authority & supervision split

**ILT (Inspectie Leefomgeving en Transport)** — Leads sectoral supervisory engagement for NIS2 compliance + environmental-permit enforcement.

**RDI (Rijksinspectie Digitale Infrastructuur)** — Responsible for technical & cyber-security compliance assessment under Cbw (once in force).

**Omgevingsdiensten** — Regional authorities responsible for environmental-permit issuance (Wet milieubeheer, Activiteitenbesluit enforcement); coordinate with local ILT office on cyber incidents affecting permitted operations.

**NCSC-NL** — National CSIRT for NIS2 incident reporting (art. 23) and crisis coordination.

**MinIenW (Ministry of Infrastructure & Water Management)** — Sets national waste-management policy (LAP3, EVOA coordination).

**Supervisory model:** ILT + RDI conduct **proactive supervision** (audits, inspections, information requests). Important entities have mandatory compliance; omgevingsdiensten co-engage on environmental-permit intersection.

---

## NL adjacent regimes

### Wet milieubeheer (Wm, Environmental Management Act)

Waste facilities require environmental permits (milieuvergunning) under Wm. Cyber incidents leading to emission-control failures (baghouse, scrubber offline, DCS compromise) trigger dual reporting: NIS2 art. 23 + Wm emission-incident notification to omgevingsdienst.

### LAP3 (Landelijk Afvalbeheerplan, National Waste Management Plan)

NL's strategic waste-management framework. Waste-handling data (tonnages, treatment routes, cross-border shipments) flow through LMA (Landelijk Meldpunt Afvalstoffen). Cyber compromise of LMA reporting systems or weighbridge manipulation affects LAP3 compliance.

### EVOA (European Waste Shipment Regulation, EU 1418/2007)

Governs transboundary waste export. Digital manifests (Europese Afvalstoffenpas) and pre-notification systems must remain tamper-proof. Data integrity breach enabling illegal e-waste or plastic export is a joint cyber + environmental crime.

### Brzo+ / Seveso III

Hazardous-waste incineration and chemical-storage sites with quantities exceeding Seveso thresholds require additional safety-management and emergency-planning obligations overlapping with cyber resilience requirements.

### ARIE (Registry of Industrial Emissions)

Large incineration and waste facilities file annual emissions data. Cyber manipulation of emissions monitoring (continuous-emission-monitoring system, CEMS) affects ARIE reporting accuracy.

### Activiteitenbesluit (Activity Decree)

Plant-level operational rules for emission limits, waste-handling procedures, and monitoring. OT/ICS systems enforcing these rules (baghouse airflow, scrubber chemical dosing, leachate pH) are cyber-critical.

---

## OT/ICS angle: Waste-to-energy & sorting line DCS

### Waste-to-energy (incineration) DCS

Grid-tied waste-to-energy plants operate:
- **Distributed control system (DCS)** managing furnace temperature, combustion-air regulation, steam-cycle turbine, electrical output.
- **SCADA** for real-time furnace monitoring, energy meter, grid export interface.
- **Continuous Emission Monitoring System (CEMS)** for stack NO_x, CO, particulates (regulatory compliance).
- **Weighbridge + LMA interface** for incoming waste tonnage logging.

Compromise of the DCS can halt electricity generation (grid impact) and force waste diversion to municipal backup, cascading operational failure.

### Sorting line OT

Optical sorters, magnetic separators, eddy-current machines, and conveyor logic controllers:
- **Programmable Logic Controller (PLC)** sequencing material flow, separator frequency, ejector timing.
- **Vision system** (camera + analysis) identifying material type; poisoning the vision model enables hazardous contamination into recyclate stream.
- **Weighbridge + dispatch system** tracking output tonnage and customer shipment.

Compromise risks both operational loss and safety (hazardous material contamination in outbound recyclate).

### Leachate & biogas management

Organic-waste digestion and landfill sites operate:
- **Biogas SCADA** monitoring digester temperature, pressure, methane output.
- **Leachate management** (pH control, pump sequencing, discharge valve logic).
- **ATEX-compliant** instrumentation in biogas zones (explosion risk).

---

## Top sector-specific risks

**Ransomware halting waste-to-energy DCS:**
- Attacker encrypts control system; furnace shuts down, electricity generation stops, grid loses supply, waste accumulates at municipal level.
- **Mitigation:** DCS air-gap or data-diode isolation; immutable backup with tested restore procedure; 24/7 ransomware incident playbook.

**Sorting-line OT compromise enabling hazardous contamination:**
- Attacker manipulates PLC ejector logic or poisons vision AI; hazardous waste (e.g. batteries, medical sharps) crosses into recyclate stream destined for consumers.
- **Mitigation:** Offline vision-model validation; PLC firmware signing; manual inspection checkpoints; rapid OT asset isolation procedure.

**Weighbridge fraud and LAP3 breach:**
- Attacker modifies weighbridge calibration or tampers with LMA reporting data; customer tonnages under/over-reported, LAP3 compliance metrics corrupted, revenue manipulation.
- **Mitigation:** Immutable weighbridge logs with timestamp + cryptographic signature; segregated LMA reporting gateway; third-party calibration audit trail.

**EVOA cross-border shipment-document falsification:**
- Attacker forges digital Europese Afvalstoffenpas or pre-notification; illegal e-waste / plastic exported under guise of legitimate shipment.
- **Mitigation:** Digital signature on all EVOA documents; audit trail of document lifecycle; manual spot-check of physical shipments against digital records.

**Supply-chain compromise via tracking SaaS:**
- Route-optimization, customer-portal, and vehicle-tracking SaaS systems store waste-handling data and customer PII. Compromise exposes confidential logistics + enables manipulation of collection routes or billing.
- **Mitigation:** Vendor security assessments before procurement; data segregation (waste data ≠ customer identity); API rate-limiting + anomaly detection on tracking system.

**Biogas digester SCADA safety event:**
- Attacker modifies digester temperature setpoint or pressure limits; thermal runaway or explosion risk in ATEX zone.
- **Mitigation:** Hardened SCADA with secure boot; protective interlocks (logic performed locally on safety PLC, not remotely); pressure relief validation; regular pressure-vessel inspection.

**Leachate-system manipulation causing groundwater contamination:**
- Attacker disables pH control or manipulates discharge valve logic; contaminated leachate released into groundwater or surface water.
- **Mitigation:** Segregated safety-instrumented system (SIS) for valve logic; redundant pH monitoring; offline backup control; environmental sampling audit trail.

---

## Quick-win checklist

- [ ] **OT asset inventory tagged by criticality** — Spreadsheet of all DCS, PLC, weighbridge, CEMS, SCADA, biogas controllers, sorting-line vision systems with firmware versions and grid/safety-tie criticality.
- [ ] **IT/OT segmentation documented** — Network diagram showing zones (furnace DCS, sorting PLC, corporate IT, customer portal), conduits (firewalls, data diodes), traffic rules logged.
- [ ] **Weighbridge tamper detection** — Calibration seal + cryptographic signature on all tonnage logs; audit trail of calibration changes; offline backup totals.
- [ ] **Immutable LMA/EVOA logs** — Waste-shipment reporting data stored in append-only system (e.g. blockchain-backed or WORM storage); digital signature on all EVOA documents.
- [ ] **MFA on all control-plane access** — Permits portal, customer portal, grid-tie export portal, LMA submission, vendor remote-access all require multi-factor authentication.
- [ ] **Vendor remote-access via PAM** — All vendor tunnels (DCS engineering, EMS maintenance, weighbridge support) routed through Privilege Access Management with session recording, IP allow-list, time-bound grants.
- [ ] **Joint ILT + omgevingsdienst + AP + NCSC-NL incident playbook** — Documented escalation path, roles, notification timelines for cyber incident affecting permitted operations or grid supply.
- [ ] **Ransomware tabletop including waste build-up scenario** — Simulate DCS encryption; practice manual failover, grid isolation, waste reroute, customer comms. Document lessons learned.
- [ ] **Supplier register including SaaS tracking + dispatch** — Vendor assessment form covering route-optimization SaaS, customer-portal providers, vehicle-tracking systems; data-residency + encryption requirements.
- [ ] **Secure code review for customer portals** — Web application security review (OWASP Top 10: injection, authentication, CSRF, sensitive data) before production deployment.
- [ ] **CEMS data integrity** — Continuous-emission-monitoring system logs stored offline + signed; anomaly detection on reported vs. sensor values; annual third-party CEMS audit.
- [ ] **Biogas SCADA interlocks** — Safety-instrumented system (SIS) for pressure + temperature relief logic independent of main SCADA; protective relay backup for valve closure.

---

## Incident-reporting nuances

**NIS2 art. 23 + Wm/Activiteitenbesluit overlap:**
- Cyber incident halting waste-to-energy furnace = NIS2 significant incident (loss of availability) + Wm emission-control failure (permit breach).
- Notify NCSC-NL (24h early warning, 72h detailed notification) + omgevingsdienst (environmental incident, 24h if emissions affected).

**LAP3/LMA data-integrity events:**
- Weighbridge manipulation or forged LMA reports = NIS2 confidentiality/integrity breach + LAP3 compliance violation.
- Report to ILT, MinIenW Meldpunt, and NCSC-NL.

**EVOA reciprocity:**
- Falsified digital Europese Afvalstoffenpas affecting transboundary shipment = NIS2 incident + EVOA enforcement request to receiving Member State CSIRT + recipient's waste authority.
- Coordinate with MinIenW international affairs office.

**Environmental contamination (leachate, emissions):**
- Cyber-caused environmental harm (groundwater spill, unauthorized air emission) triggers concurrent reporting under Wm + NIS2.
- Criminal liability may apply; involve legal counsel + law enforcement (KLPD, Openbaar Ministerie).

---

## Mapping to corpus

| Resource | Purpose |
|----------|---------|
| [`eu-directives/md/nis2-2022-2555-NL.md`](../eu-directives/md/nis2-2022-2555-NL.md) | NIS2 Annex II.2 (waste scope). Background on Important / Essential designation. |
| [`CHECKLIST-CISO.md`](../CHECKLIST-CISO.md) | Sections 2.a–2.j (art. 21 measures) + section 4 (incident reporting). Waste sector gap-analysis template. |
| [`FAQ-compliance-officers.md`](../FAQ-compliance-officers.md) | Q1 (scope test), Q6–14 (obligations + incident reporting), Q18 (ILT supervision). |
| [`SECTOR-energy.md`](./SECTOR-energy.md) | Waste-to-energy grid tie: overlapping OT/ICS architecture (DCS, SCADA, grid export). |
| [`SECTOR-chemicals.md`](./SECTOR-chemicals.md) | Hazardous-waste incineration + Seveso III overlap; REACH + chemical storage. |

---

## See also

- [`README.md`](../README.md) — Corpus overview + "About NIS2 in 60 seconds."
- [`GLOSSARY.md`](../GLOSSARY.md) — Terminology (DCS, SCADA, CEMS, PLC, ATEX, LMA, EVOA, omgevingsdienst).
- [`TIMELINE.md`](../TIMELINE.md) — NL Cbw entry-into-force (~July 2026).
- [`CHECKLIST-CISO.md`](../CHECKLIST-CISO.md) — Full readiness checklist; section 0 (scope confirmation), section 2 (art. 21 measures).
- [`FAQ-compliance-officers.md`](../FAQ-compliance-officers.md) — Practical Q&A on scope, supervision, incident reporting.
- [`templates/`](../templates/) — CSV templates for asset inventory, risk register, supplier assessment, incident register.

---

> **Disclaimer:** This guide is not legal advice. NIS2 + Wet milieubeheer are binding. NL Cbw entry-into-force expected ~Q2 2026. Verify against live ILT, RDI, NCSC-NL, MinIenW, omgevingsdienst, and EUR-Lex sources before board-level decisions.
