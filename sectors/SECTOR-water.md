# NIS2 Water Sector Guide

**Scope:** Drinking water operators, wastewater treatment and collection operators, flood-defence and water-management authorities.

**Audience:** Water company CISOs, operations teams, supervisory boards, procurement teams managing SCADA/DCS infrastructure, incident response teams, water-board (waterschap) security leads.

---

## Are you in scope?

Your organization falls under NIS2 Water (Annex I points 6–7) if you operate in one or more of these areas:

| Sub-sector | Scope indicator |
|-----------|-----------------|
| **Drinking water supply** | Operates production, treatment, or distribution network serving ≥ 50,000 population or ≥ 5,000 m³/day. Essential designation applies; sole providers (< 50k population) may be Essential if critical regional supply. Examples: Vitens, Brabant Water, PWN, WMD, Evides, Dunea, Waternet. |
| **Wastewater treatment** | Operates WWTP serving ≥ 2,000 PE (population equivalent) or discharges > 600m³/day. Examples: WWTPs operated by 21 Dutch water boards (waterschappen). |
| **Wastewater collection** | Operates sewer network + pump stations, serves ≥ 2,000 PE. Note: gemeenten own municipal sewer pumps; waterschappen typically operate regional networks. |
| **Water-board (waterschap)** | Manages wastewater collection, treatment, flood defence, surface-water management. 21 waterschappen across NL. All designated Essential. |
| **Flood-defence & water-management** | Operates dikes, dams, sluice gates, storm-surge barriers, water-level control systems. Critical for coastal + delta regions. |

**Tier:** All drinking water + wastewater operators ≥ threshold are **Essential**. Sole providers (drinking water, <50k population) and water boards are **Essential regardless of size**. No SME exception.

---

## NL competent authority & supervision split

**ILT (Inspectie Leefomgeving en Transport)** — Leads sectoral NIS2 supervision + technical compliance assessment for drinking water + wastewater systems. Conducts audits, inspections, and information requests.

**NCSC-NL** — National CSIRT for NIS2 incident reporting (art. 23) and crisis coordination.

**Inspectie Leefomgeving + Transport (ILT watersectie)** — Technical authority for Drinkwaterwet + Waterwet compliance; coordinates with NCSC-NL on cyber incidents affecting public health.

**RIVM (National Institute for Public Health & Environment)** — May engage on water-quality breaches; triggers public-health response (boil-water advisories, GGD outreach).

**GGD (Municipal Health Services)** — Regional public-health authority; notified if incident affects drinking-water safety for population > threshold.

**Gemeente (municipality)** — Owns municipal sewer systems + storm-water pumps; coordination point for local incident response.

**Supervisory model:** ILT conducts **proactive supervision**; Essential entities have no opt-out. Multi-authority coordination required for public-health overlay.

---

## NL adjacent regimes

### Drinkwaterwet & Drinkwaterbesluit

Pre-existing drinking-water quality + supply-security regime. NIS2 overlays cybersecurity on top:
- Contamination threshold (≥ 1% of system population affected) triggers mandatory Drinkwaterwet reporting to ILT *separately* from NIS2 incident report.
- Drinking-water quality parameters (chlorine, turbidity, microbial) must be monitored; anomalous changes (e.g. dosing system tampering) are dual-reportable.
- SME exception under Drinkwaterwet does NOT carry over to NIS2; NIS2 scope is stricter.

### Waterwet & Waterschappen

Governing law for wastewater + water-board operations:
- Waterschappen designated as Essential entities under NIS2.
- Dual responsibility: wastewater + flood defence (dikes, sluice gates, water-level control).
- Incident affecting wastewater treatment or flood-defence control is jointly notifiable under NIS2 + Waterwet.

### CER (Wwke) — Civil Emergency Act transposition

Complements NIS2 with physical resilience, emergency comms, backup power, and critical-infrastructure continuity. Water operators subject to both NIS2 + Wwke must align:
- Backup power for treatment plants + pump stations (minimum 48-72h).
- Manual override procedures for automated gates + dosing systems.
- Emergency communications plan (independent of IT).
- Continuity of essential services (e.g. minimum water supply during incident).

### Kaderrichtlijn Water (KRW) & Environmental Compliance

EU Water Framework Directive compliance overlaps on water-quality monitoring. Cyber incidents affecting monitoring data integrity must be reported to RIVM + ILT simultaneously.

### Bestrijdingsmiddelenwet (Plant Protection Act)

Governs use of chlorine + disinfection chemicals. Cyber tampering with dosing systems is dual-reportable: NIS2 + chemical-safety authority.

---

## OT/ICS angle: SCADA/DCS environments in water treatment

Water operators depend on decades-old SCADA and DCS (Distributed Control Systems) for:
- **Treatment plants:** Membrane filtration, UV disinfection, chlorine dosing, pH adjustment, turbidity monitoring.
- **Distribution:** Pump stations, pressure-control valves, tank-level sensors, automated isolation points.
- **Wastewater:** Collection pumps, flow-balance systems, grit removal, aeration blowers, sludge-handling automation.
- **Flood defence:** Sluice gates, dike-level sensors, storm-surge barriers, water-level automation, wind-speed monitoring.

**Connectivity reality:** Most SCADA systems are no longer air-gapped. Remote maintenance via vendor tunnels, SCADA historian connections to corporate IT, telemetry to central control rooms, and mobile access (operator tablets) create continuous attack surfaces. Assume each interface is a breach vector.

**Legacy systems challenge:** Treatment-plant DCS can be 20–30 years old; vendor support may be minimal; patching impossible without downtime. ICS security (IEC 62443) is assumed but often not verified.

---

## Top sector-specific risks

**Water-quality manipulation (Oldsmar-Florida class):**
- Attacker gains write access to dosing-system SCADA, increases chlorine / alum concentration, or falsifies water-quality sensor readings.
- **Mitigation:** Anomaly detection on water-quality parameters; redundant independent sensors; manual verification protocols; access control on all dosing commands.

**Ransomware halting treatment production (Colonial Pipeline analogy):**
- Attacker encrypts SCADA historian + control-room workstations; operators cannot read tank levels, cannot adjust pumping, cannot verify treatment.
- **Mitigation:** Offline backups of SCADA configuration; manual operating procedures (do not rely on SCADA display); incident-response plan for loss-of-control scenario.

**Vendor remote-access compromise:**
- Vendors (Siemens, ABB, Xylem, Schneider) maintain remote tunnels for engineering changes (firmware updates, dosing-pump commissioning, sluice-gate calibration). Compromised tunnel exposes full SCADA access.
- **Mitigation:** PAM (Privilege Access Management) with session recording; IP allow-listing; time-bound access; out-of-band approval (SMS to supervisor) for remote sessions.

**GPS spoofing on telemetry timing (water-level sensor sync):**
- Sluice gates, dike-level sensors, flood-surge systems synchronize on GPS time. Spoofed time ± seconds can cause gates to close at wrong time, triggering flood or overflow.
- **Mitigation:** Redundant time sources (NTP + GPS + local atomic clock); anti-jamming measures; independent (non-GPS) triggers for critical gates.

**Supply-chain via dosing-pump firmware:**
- Compromised firmware update for chlorine-dosing pump or pH-control DCS embedded malware that slowly manipulates set-points over weeks, degrading water quality.
- **Mitigation:** SBOM (Software Bill of Materials) requirement in contracts; firmware signature verification; patch-management protocol with testing on isolated testbed before production deployment.

**Insider threat in 24/7 shift operations:**
- Operator or engineer with legitimate SCADA access performs unsafe actions (intentional sabotage or coercion). Overnight / low-supervision shifts increase risk.
- **Mitigation:** Segregation of duties (approval gates for treatment changes); session recording + later review; anomaly detection on parameter changes; KPI monitoring.

**Network segmentation failure between IT + SCADA:**
- Shared databases (historian) or jump-host compromise allows pivot from corporate network to treatment-plant SCADA.
- **Mitigation:** Network segmentation with monitored data diodes (one-way): SCADA → historian, not bidirectional. No shared credentials.

**Wastewater overflow as triggered nuisance:**
- Attacker closes overflow gates or increases pumping set-point beyond capacity; forces wastewater into streets / waterways; environmental + public-health impact.
- **Mitigation:** Flow-based monitoring + automatic safety shutdowns; manual gate override procedures; backup pump capacity; alert threshold for abnormal flow patterns.

---

## Quick-win checklist

- [ ] **Scope confirmation** — Check population served, PE treated, daily volume. Confirm Essential status + any SME exceptions under Drinkwaterwet do not apply to NIS2.
- [ ] **SCADA/DCS asset inventory with vendor + firmware** — Spreadsheet of all treatment-plant systems (dosing pumps, membrane units, UV, aeration), distribution SCADA, wastewater collection pumps, sluice gates; list vendor, firmware version, last patch date, support end-of-life.
- [ ] **OT-IT segmentation documented** — Network diagram showing SCADA zones, historian, control room, corporate IT, external remote-access entry points. Firewalls + data diodes at each boundary with traffic rules logged.
- [ ] **Vendor remote-access via PAM** — All vendor tunnels routed through PAM with session recording, IP allow-list, time-bound grants (e.g. 2-hour window), out-of-band approval.
- [ ] **Water-quality anomaly detection** — Automated alerts if chlorine, pH, turbidity, microbial parameters deviate > ±10% from expected baseline. Independent sensor verification for critical parameters.
- [ ] **SCADA configuration backup** — Encrypted, versioned, stored offline or geo-distributed vault. Annual restore test with recovery-time objective (RTO) ≤ 4 hours.
- [ ] **Manual operating procedures document** — Step-by-step guide for operators to run treatment plant + distribution without SCADA (e.g., manual tank-level checks, pump start/stop, dosage verification). Print + post on office wall.
- [ ] **Tabletop exercise: loss of SCADA control** — Simulate attacker gains write access to dosing or pumping systems. Practice manual failover, grid isolation, water-quality spot-checks, customer/health-authority notification. Document lessons learned.
- [ ] **Patch management policy for OT** — Explicit change windows (off-peak hours, coordinated with operations); testing protocol on isolated testbed before production; vendor patch cadence (monthly, quarterly?).
- [ ] **Wastewater level + flow monitoring with auto-shutoff** — Automated alert if pumping rate exceeds design capacity or tank level > safe threshold; automatic stop-pumping signal; alarm escalation to duty operator.
- [ ] **Supplier SBOM + security assessment** — For all COTS dosing pumps, DCS, telemetry gateway firmware: require SBOM, CVE history, patch cadence from vendor before procurement + annual thereafter.
- [ ] **Incident escalation tree** — Contact list: ILT (drinking water) / Waterschappen (wastewater), RIVM (if water-quality threshold), GGD (if public health), NCSC-NL (NIS2 CSIRT), Gemeente (municipal coordination). Test annually.
- [ ] **Multi-stage incident reporting pathway** — 24h early warning (unlawful/malicious suspected), 72h notification (ILT, NCSC-NL, RIVM/GGD as needed), 1mo final report with root cause + Drinkwaterwet contamination threshold check.
- [ ] **Dual-regime compliance mapping** — Document which incidents trigger Drinkwaterwet reporting (quality breach) vs NIS2 reporting (confidentiality/availability/integrity); ensure both pathways activated.
- [ ] **Joint ILT + water-board + NCSC-NL incident playbook** — Coordinate response procedures, communication templates, legal holds, chain-of-custody for forensics. One shared document; annual refresh.

---

## Incident-reporting nuances

**Drinkwaterwet quality threshold (separate from NIS2):**
- If incident affects water quality (chlorine residual, turbidity, microbial contamination) for ≥ 1% of population served, mandatory Drinkwaterwet reporting to ILT *in addition to* NIS2 report.
- Trigger: incident must be plausibly water-quality-related (e.g., dosing-system compromise, sensor tampering). Unconfirmed cyber incidents alone may not trigger Drinkwaterwet unless water-quality parameters are affected.

**Public-health overlay (RIVM + GGD):**
- If incident affects drinking-water safety (contamination confirmed or unconfirmed breach of treatment integrity), notify RIVM + relevant GGD immediately.
- GGD may issue boil-water advisory or other public-health instructions. Coordinate messaging with ILT + NCSC-NL on timing + content.

**Wastewater overflow reporting:**
- Environmental agency (typically Waterschappen + Gemeente) must be notified if cyber-triggered overflow exceeds discharge permits. Dual-reportable: NIS2 (availability breach) + environmental authority.

**Cross-border groundwater incidents:**
- If drinking-water source is shared groundwater body with adjacent EU Member States, coordinate with relevant CSIRTs + water authorities (e.g., Belgian Meuse River shared with NL).

**Boil-water advisory communications:**
- If incident confirmed to affect drinking-water safety, issue clear public advisory: boiling temperature + duration, affected postal codes, expected duration. Coordinate with GGD + Gemeente communication teams.

**Timeline nuances:**
- 24h early warning: if malice/unlawful access suspected (ransomware note, breach of dosing SCADA, suspicious firmware change).
- 72h notification: once impact confirmed or unconfirmed access window established (e.g., attacker in SCADA historian for 3 days).
- 1mo final report: root-cause analysis + evidence of remediation. Drinkwaterwet contamination threshold explicitly assessed.

---

## Mapping to corpus

| Resource | Purpose |
|----------|---------|
| [`eu-directives/md/nis2-2022-2555-NL.md`](../eu-directives/md/nis2-2022-2555-NL.md) | NIS2 Annex I points 6–7 (drinking water + wastewater scope). Background on Essential designation. |
| [`eu-directives/md/cer-2022-2557-NL-html.md`](../eu-directives/md/cer-2022-2557-NL-html.md) | CER (Wwke transposition). Physical resilience + backup power + emergency comms for water operators. |
| [`enisa-guidance/md/ENISA_Technical_Implementation_Guidance_v1.0.md`](../enisa-guidance/md/ENISA_Technical_Implementation_Guidance_v1.0.md) | Practical evidence mapping for NIS2 art. 21 measures; applies to water sector baseline. |
| [`CHECKLIST-CISO.md`](../CHECKLIST-CISO.md) | Sections 2.a–2.j (art. 21 measures) + section 4 (incident reporting). Water sector gap-analysis template. |
| [`FAQ-compliance-officers.md`](../FAQ-compliance-officers.md) | Q1 (scope test), Q6–14 (obligations + incident reporting), Q18 (ILT supervision). |
| Drinkwaterwet + Drinkwaterbesluit | Drinking-water quality + supply-security regime. Overlaps with NIS2 on contamination reporting. Consult ILT guidance. |
| Waterwet | Wastewater + water-board governing law. Consult water-board + Gemeente for incident-response coordination. |

---

## See also

- [`README.md`](../README.md) — Corpus overview + "About NIS2 in 60 seconds."
- [`GLOSSARY.md`](../GLOSSARY.md) — Terminology (SCADA, DCS, WWTP, PE, waterschap, ILT, RIVM, GGD, sluice gate, dosing pump).
- [`TIMELINE.md`](../TIMELINE.md) — NL Cbw entry-into-force (~July 2026).
- [`CHECKLIST-CISO.md`](../CHECKLIST-CISO.md) — Full readiness checklist; section 0 (scope confirmation), section 2 (art. 21 measures).
- [`FAQ-compliance-officers.md`](../FAQ-compliance-officers.md) — Practical Q&A on scope, supervision, incident reporting.
- [`templates/`](../templates/) — CSV templates for asset inventory, risk register, supplier assessment, incident register.

---

> **Disclaimer:** This guide is not legal advice. NIS2 is binding. NL Cbw + Cyberbeveiligingsbesluit entry-into-force expected ~Q2 2026. Verify against live ILT, RIVM, NCSC-NL, Waterschappen, and water-board sources before board-level decisions.
