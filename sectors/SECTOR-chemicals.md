# NIS2 Chemicals Sector Guide

**Scope:** Manufacture, processing, storage, and distribution of chemical substances and mixtures; chemical distributors; tank-farm operators; terminal operators; logistics service providers handling hazardous chemicals.

**Audience:** Chemical industry CISOs, plant security managers, operations teams, DCS/SIS engineers, supply-chain compliance teams, incident response coordinators.

---

## Are you in scope?

Your organization falls under NIS2 Chemicals (Annex II point 3) if you engage in one or more of these activities:

| Activity | Scope indicator |
|----------|-----------------|
| **Chemical manufacture** | Production of chemical substances or mixtures as primary business. Essential if ≥ 50 FTE or € 10M revenue. |
| **Chemical processing** | Formulation, blending, repackaging of chemicals into finished products. Essential if ≥ 50 FTE or € 10M revenue. |
| **Chemical distribution** | Wholesale/retail distribution of chemical products. Essential if ≥ 50 FTE or € 10M revenue. |
| **Tank-farm operator** | Storage of bulk chemicals (flammable, toxic, corrosive). Essential if ≥ 50 FTE or € 10M revenue. |
| **Terminal operator** | Loading/unloading terminals handling hazardous liquids or gases. Essential if ≥ 50 FTE or € 10M revenue. |
| **Logistics provider** | Transport, warehousing, or handling of hazardous chemicals for third parties. Essential if ≥ 50 FTE or € 10M revenue. |

**Tier:** Important Entity (NIS2 article 2(17)). Size threshold applies; no blanket Essential designation for all chemicals operators.

---

## NL competent authority & supervision split

**NVWA (Dutch Food and Consumer Product Safety Authority)** — Primary sectoral oversight for chemical product safety under NIS2 + REACH/CLP enforcement.

**ILT-chemie (Inspection Transport and Logistics – Chemicals)** — Specialized for hazardous-chemical transport cybersecurity compliance.

**RDI (Rijksinspectie Digitale Infrastructuur)** — Technical & cyber-security compliance assessment under Cbw.

**NCSC-NL** — National CSIRT for incident reporting (NIS2 art. 23) and coordination with safety authorities.

**Brzo+ regime authority** — Seveso directive (major-accident prevention) coordination. Incident triggering both Brzo and NIS2 requires dual notification.

**MinIenW (Ministry Infrastructure & Water Management)** — Environmental permits (Wabo) and chemical facility siting.

**MinSZW (Ministry Social Affairs)** — Worker safety overlay (chemical exposure, industrial accident prevention).

**MinJenV (Ministry Justice & Security)** — Cyber-critical infrastructure designation for high-consequence facilities.

**Supervisory model:** NVWA + RDI conduct proactive supervision (inspections, information requests). Important entities must respond to compliance audits. Dual oversight (Brzo + NIS2) creates coordination burden.

---

## NL adjacent regimes

### Brzo+ (Seveso III directive transposition)

**Binding for facilities handling threshold quantities of hazardous chemicals.** Establishes major-accident-prevention requirements (safety report, safety case, emergency planning) that interact with NIS2 cyber controls:

- Cyber incident triggering loss-of-containment must be reported to Brzo authority (ILT-chemie, omgevingsdienst, brandweer) within **hours** under Brzo + NIS2 art. 23 within **24h** (early warning).
- Safety case must now integrate cyber risk (IEC 61511 Ed3 approach for SIS).
- Major-accident scenarios include cyber-induced HAZMAT release (e.g. operator workstation hijack → unauthorized discharge).

### REACH (Registration, Evaluation, Authorisation & restriction of Chemicals)

EU chemical substance regulation. Cybersecurity overlap:
- Supply-chain data (substance identity, hazard, use) stored in REACH databases. Confidentiality breach of restricted/carcinogenic substance data triggers both REACH + NIS2 reporting.
- Distributors must maintain supply-chain traceability; cyber disruption of supply-chain records may affect REACH compliance.

### CLP (Classification, Labelling, Packaging)

Chemical labelling regulation. Cybersecurity impact:
- LIMS (Laboratory Information Management System) manipulation hiding off-spec substance classification = safety + legal risk.
- Fake labelling data poisoning supply chain (fake SDS — Safety Data Sheets).

### CSDDD (Corporate Sustainability Due Diligence Directive)

Large chemical distributors + manufacturers must audit supply-chain for environmental/labour risks. Cybersecurity governance overlaps with due-diligence audits.

### Wwke (Civil Emergency Act, CER transposition)

Physical resilience, backup systems, emergency-response coordination. Chemicals sector must align BCM with Wwke + NIS2.

### Wabo (Environmental Permits), ARIE-regelgeving (Spatial Planning)

Chemical facility siting + zoning. Cyber incident affecting emergency services' ability to isolate facility may trigger Wabo non-compliance.

---

## NL Chemical Industry Centers

**Rotterdam-Botlek/Pernis:** ~350 companies; Shell, BP, ExxonMobil, Lyondell, Huntsman. Largest integrated refining + chemicals complex in NL.

**Moerdijk:** ~80 companies; Shell, Basell, Total, Nouryon. Polyolefins + caustic-chlor focus.

**Chemelot Geleen:** ~150 companies; DSM, OCI, Sabic, AkzoNobel. Life sciences + specialty chemicals.

**Delfzijl:** ~30 companies; Chemiepark Delfzijl, AkzoNobel, BioMCN. Chlor-alkali + bioplastics.

**Terneuzen:** ~40 companies; Dow, INEOS, Nouryon. Polyurethanes + basic organics.

**Logistics hubs:** Amsterdam, Schiphol, Moerdijk, Rotterdam docks (cross-border chemical truck/rail flows).

---

## OT/ICS angle: Safety-Critical Control Systems

**DCS (Distributed Control System)** — Honeywell Experion, ABB, Emerson DeltaV, Yokogawa ProSafe. Centralized recipe + process monitoring. Compromise = uncontrolled reaction, temperature runaway, pressure excursion.

**SIS (Safety Instrumented System)** — Triconex, Emerson ProSafe-RS, ABB SafetyPLC. IEC 61511 / IEC 61508 certified independent safety layer. Trip pump shutdown, emergency vent, ESD (emergency shutdown). **Must remain offline from BPCS (Business Process Control System).**

**Tank-farm SCADA** — Level, temperature, pressure sensors on storage tanks + loading arms. Autonomous interlocks prevent overfill. Remote fill-valve commands must require multi-factor approval.

**Terminal automation** — Pump scheduling, valve sequencing, pressure relief on loading racks. Loss of automation = manual operation, slow response to upset conditions.

**Process historians** — Time-series database (OSIsoft PI, Wonderware) logging process variables. Manipulation hides evidence of off-spec operation.

**F&G (Fire & Gas Detection)** — Flame + gas detectors networked to PLC. Mute or spoofing disables alarm escalation.

**ESD (Emergency Shutdown System)** — Hardwired or safety-certified networked shutdown. Cyber bypass = loss of rapid containment option.

---

## Top sector-specific risks

**Process manipulation (Triton/TRISIS class):**
- Attacker gains write access to DCS, alters setpoints (temperature ↑, pressure ↑, flow ↓). SIS designed to trip, but if SIS is compromised or network-isolated from reading true condition, reaction goes uncontrolled → HAZMAT release / explosion.
- **Mitigation:** SIS air-gapped from BPCS; SIS reads directly from field sensors; field wiring encrypted or hardened against man-in-the-middle.

**SIS network compromise:**
- SIS integrated with network (IEC 61511 Ed3 permits supervised networked SIS). Attacker disables safety interlocks or spoofs sensor readings.
- **Mitigation:** Safety case mandates SIS isolation; if networked, require certified secure channels + out-of-band approval for SIS parameter changes.

**IP theft of formulations:**
- LIMS, recipe servers, ERP contain proprietary formulations + process know-how. Exfiltration = competitive loss + supply-chain risk (stolen process used by competitors/rogue actors).
- **Mitigation:** Data loss prevention on LIMS servers; formula data encrypted at rest + in transit; access logs audited.

**Tank-farm over-fill / ESD bypass:**
- Attacker remotely opens fill valve beyond tank capacity (pressure vessel rupture) or bypasses ESD during loading upset.
- **Mitigation:** Tank-level interlocks hardwired; ESD circuit independent; remote commands require dual-operator approval + safety-engineer sign-off.

**Supply-chain precursor control:**
- Attacker manipulates supply-chain data (SDS, CoA — Certificate of Analysis) to introduce counterfeit or adulterated chemical precursors (CWC dual-use chemicals, pharmaceutical intermediates).
- **Mitigation:** Supplier SBOM + material verification; blockchain-backed CoA tracking; third-party lab spot-checks.

**Ransomware halting refining + production:**
- Attacker encrypts LIMS + ERP, halts batch-processing workflows. Cascades to downstream (formulation pauses → supply commitment failures).
- **Mitigation:** Offline backup of batch queues; manual failover procedures; 24/7 monitoring with alert thresholds on task-completion latency.

**Vendor remote-access tunnel compromise:**
- Vendors (Honeywell, ABB, Emerson) maintain SSH/RDP tunnels into DCS for commissioning + maintenance. Tunnel compromised = attacker can inspect/manipulate control logic without physical presence.
- **Mitigation:** PAM with session recording; IP allow-listing; time-bound access; mandatory safety-engineer co-approval for DCS/SIS parameter changes.

**OT asset visibility gap:**
- Facility has no inventory of DCS, SIS, SCADA, sensor hardware + firmware versions. Vulnerability assessment impossible.
- **Mitigation:** Conduct quarterly asset discovery (network scan + physical walkdown); baseline SIL rating + patch status per zone.

**Malicious LIMS/QC manipulation:**
- Insider or attacker modifies test results in LIMS (hiding off-spec batches). Contaminated product ships to customer (customer safety + regulatory exposure).
- **Mitigation:** Audit trail on all LIMS parameter changes; QC workflow approvals (analyst + supervisor); periodic third-party lab verification.

**Unauthorized shipping/release:**
- Attacker modifies warehouse management system (WMS) to authorize release of batch without QA signature.
- **Mitigation:** Shipping approval requires physical + digital signature (non-repudiation); cross-check batch ID on WMS vs. physical label before dispatch.

---

## Quick-win checklist

- [ ] **SIS isolation confirmed** — Safety-instrumented systems (Triconex, ProSafe-RS) network-isolated from BPCS. Air-gapped sensor feeds or certified secure channels only. Document wiring diagram.
- [ ] **OT asset inventory with SIL rating** — Spreadsheet of DCS, SIS, SCADA, tank sensors, F&G, ESD with firmware version, SIL rating (per IEC 61511), patch status.
- [ ] **Vendor remote-access via PAM** — All Honeywell, ABB, Emerson, Yokogawa maintenance tunnels routed through PAM (session recording, IP allow-list, time-bound). Safety-engineer co-approval for SIS/DCS edits.
- [ ] **IEC 62443 zoning per Purdue model** — Network diagram documenting L0 (field sensors/actuators), L1 (DCS/SIS), L2 (historian, LIMS, batch controllers), L3 (corporate IT). Firewall rules explicit at each boundary.
- [ ] **Safety case integrating cyber risk** — Update Brzo safety report to include cyber-induced HAZMAT scenarios (e.g. DCS hijack, SIS disablement). IEC 61511 Ed3 cyber-risk analysis per zone.
- [ ] **Tank-farm interlocks hardwired** — Level + pressure limits on loading arms do not depend on networked SCADA; hardwired solenoid cutoff on overpressure. ESD button hardwired independent circuit.
- [ ] **LIMS audit trail enabled** — All parameter changes (test method, threshold, approval signature) logged with immutable timestamp. Monthly review of high-risk changes (thresholds lowered, signatures spoofed).
- [ ] **Engineering workstations air-gapped or VLAN-isolated** — USB-disabled; no external media; VPN-only access to DCS. Two-person access rule for SIS changes.
- [ ] **DCS configuration backup (offline)** — Version-controlled, encrypted, stored in geo-distributed vault (not connected to plant network). Restore-test ≥ annually.
- [ ] **Tabletop: loss-of-containment scenario** — Simulate attacker disables SIS via DCS. Practice manual ESD, emergency vent, plant evacuation, external emergency services notification. Document lessons.
- [ ] **Supplier SBOM + security assessment** — For all COTS DCS, SIS, SCADA, historian: require SBOM, CVE history, patch cadence before procurement. Include cyber-risk clauses in contracts.
- [ ] **Supply-chain data verification** — CoA (Certificate of Analysis) for incoming chemical precursors cross-checked with supplier LIMS. Spot-check laboratory verification ≥ quarterly.
- [ ] **Brzo + NIS2 dual incident playbook** — Procedure for simultaneous reporting: NIS2 art. 23 (24h + 72h to RDI/NCSC-NL) + Brzo (hours to ILT-chemie + omgevingsdienst + brandweer). Test escalation path annually.
- [ ] **24/7 incident escalation tree** — Contact list for NVWA, RDI, NCSC-NL, local fire/hazmat, Brzo authority, legal, crisis comms. Test ≥ annually.
- [ ] **F&G + ESD functionality test** — Quarterly verification that flame/gas detectors trigger alarm + interlock independently. Hardwired ESD circuit operational test ≥ semi-annually.

---

## Incident-reporting nuances

**Brzo major-accident threshold:**
- HAZMAT release (any quantity), fire, explosion, or uncontrolled reaction → **immediate notification (hours)** to ILT-chemie (transport incident) or omgevingsdienst (plant-based) + brandweer + emergency services.
- Cyber incident directly causing loss-of-containment or SIS failure is a reportable major accident.

**NIS2 art. 23 + Brzo interaction:**
- 24-hour early warning to NCSC-NL (suspected unlawful/malicious activity).
- 72-hour notification with severity + impact assessment.
- Brzo report may satisfy 24h/72h thresholds if both authorities are notified simultaneously.
- Coordinate disclosure timing with NCSC-NL + Brzo authority to avoid conflicting messaging.

**AVG (GDPR) overlap:**
- If incident involves employee or customer PII in LIMS (e.g. customer formulation tied to contact name), GDPR data-breach notification applies (within 72h of discovery).

**Cross-border coordination:**
- Chemical release affecting air/water quality across NL borders → notify relevant EU Member State environmental authorities + ENTSO-E (if affecting energy infrastructure).
- Supply-chain compromise (counterfeit precursor from foreign supplier) may escalate to INTERPOL/EU supply-chain task forces.

**Customer notification:**
- If product recall triggered by cyber incident (e.g. LIMS falsification revealing off-spec batch), customer notification follows CLP + product-liability timeline (days, not hours).

---

## Mapping to corpus

| Resource | Purpose |
|----------|---------|
| [`eu-directives/md/nis2-2022-2555-NL.md`](../eu-directives/md/nis2-2022-2555-NL.md) | NIS2 Annex II point 3 (chemicals scope). Important Entity definition + size thresholds. |
| [`eu-directives/md/cer-2022-2557-NL-html.md`](../eu-directives/md/cer-2022-2557-NL-html.md) | CER (Civil Emergency Act, Wwke transposition). Emergency response + business continuity overlap. |
| [`enisa-guidance/md/ENISA_Technical_Implementation_Guidance_v1.0.md`](../enisa-guidance/md/ENISA_Technical_Implementation_Guidance_v1.0.md) | Technical measures for NIS2 art. 21 (applies to chemicals OT/ICS baseline). |
| [`CHECKLIST-CISO.md`](../CHECKLIST-CISO.md) | Section 2 (art. 21 measures) + section 4 (incident reporting). Chemicals sector risk-assessment template. |
| [`FAQ-compliance-officers.md`](../FAQ-compliance-officers.md) | Q1 (scope test), Q6–14 (obligations + incident reporting), Q18 (NVWA/RDI supervision). |
| IEC 61511 Ed3 | Functional Safety of Electrical/Electronic/Programmable Electronic Safety-Related Systems. Required for SIS cyber-risk integration. |
| IEC 62443 | Industrial Control System Security. Baseline for Purdue zoning in chemicals plants. |

---

## See also

- [`README.md`](../README.md) — Corpus overview + "About NIS2 in 60 seconds."
- [`GLOSSARY.md`](../GLOSSARY.md) — Terminology (DCS, SIS, SCADA, LIMS, Brzo, Seveso, IEC 61511, Purdue model).
- [`TIMELINE.md`](../TIMELINE.md) — NL Cbw entry-into-force (~July 2026). Brzo+ ongoing.
- [`CHECKLIST-CISO.md`](../CHECKLIST-CISO.md) — Full readiness checklist; section 0 (scope), section 2 (art. 21 measures).
- [`FAQ-compliance-officers.md`](../FAQ-compliance-officers.md) — Q&A on scope, Brzo/NIS2 dual reporting, supervision.
- [`templates/`](../templates/) — CSV templates for OT asset inventory, risk register, supplier assessment, incident register.
- [`SECTOR-energy.md`](./SECTOR-energy.md) — OT/ICS baseline overlaps (DCS, SCADA, remote access, vendor tunnels).

---

> **Disclaimer:** This guide is not legal advice. NIS2 + Brzo+ are binding. NL Cbw entry-into-force expected ~Q2 2026. Verify against live NVWA, RDI, NCSC-NL, ILT-chemie, and EUR-Lex sources before board-level decisions. Chemical safety + cybersecurity are inseparable; consult process-safety engineers alongside CISO teams.
