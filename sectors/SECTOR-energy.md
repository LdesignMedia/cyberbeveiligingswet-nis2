# NIS2 Energy Sector Guide

**Scope:** Transmission system operators (TSOs), distribution system operators (DSOs), electricity retailers, generation operators, recharging point operators, district heating and cooling operators, oil transmission/refining/storage operators, gas suppliers/DSOs/transmission/storage operators, gas market operators, hydrogen production and distribution operators.

**Audience:** Energy company CISOs, operations teams, supervisory boards, procurement teams managing OT/ICS infrastructure, incident response teams.

---

## Are you in scope?

Your organization falls under NIS2 Energy (Annex I point 1) if you operate in one or more of these areas:

| Sub-sector | Scope indicator |
|-----------|-----------------|
| **Electricity TSO** | Operates high-voltage transmission grid. Sole TSO per MS designated. TenneT (NL TSO) is Essential regardless of size. |
| **Electricity DSO** | Operates distribution grid (medium/low voltage). DSOs ≥ 50 FTE or € 10M revenue essential. Examples: Stedin, Liander, Enexis, Westland, Enduris. |
| **Electricity generation** | Hydro, thermal, wind, solar ≥ 50 FTE or € 10M revenue. Large facilities (e.g. nuclear, coal plants) typically Essential. |
| **Electricity retailer/supplier** | Sells electricity to end-consumers. Essential if ≥ 50 FTE or € 10M revenue. |
| **Recharging point operator** | Operates EV charging network ≥ 50 FTE or € 10M revenue. Large fleet operators (>1000 points) typically Essential. |
| **District heating/cooling** | Operates district heating or cooling system. Essential if ≥ 50 FTE or € 10M revenue. |
| **Oil transmission** | Operates oil pipeline network. Sole operator per MS designated. Essential regardless of size. |
| **Oil refining** | Petroleum refining facility ≥ 50 FTE or € 10M revenue. Essential regardless of size (critical infrastructure). |
| **Oil storage** | Strategic oil storage, commercial storage facilities ≥ 50 FTE or € 10M revenue. |
| **Gas supplier** | Sells natural gas, hydrogen, or biogas to end-consumers. Essential if ≥ 50 FTE or € 10M revenue. |
| **Gas DSO** | Operates local distribution network. Essential if ≥ 50 FTE or € 10M revenue. |
| **Gas transmission** | Operates gas pipeline network. Sole operator per MS (Gasunie in NL) designated Essential. |
| **Gas storage** | Natural gas, hydrogen, or other gas storage facility ≥ 50 FTE or € 10M revenue. |
| **Gas market operator** | Operates trading hub or market platform. Usually Essential if domiciled in NL. |
| **Gas refining** | LNG regasification, hydrogen production ≥ 50 FTE or € 10M revenue. |
| **Hydrogen producer/operator** | Green or grey hydrogen production ≥ 50 FTE or € 10M revenue; hydrogen pipeline operator. |

**Tier:** All energy operators are **Essential**. Energy is listed in NIS2 Annex I point 1 without SME exception.

---

## NL competent authority & supervision split

**ACM (Autoriteit Consument & Markt)** — Leads sectoral supervisory engagement for NIS2 + market-integrity oversight.

**RDI (Rijksinspectie Digitale Infrastructuur)** — Responsible for technical & cyber-security compliance assessment under Cbw (once in force).

**NCSC-NL** — National CSIRT for incident reporting (NIS2 art. 23) and crisis coordination.

**NCTV (Nationaal Coördinator Terrorismebestrijding)** — May engage on national-security overlay if incident affects grid stability or critical services.

**NEa (Netherlands Enterprise Agency)** — May advise on emissions + sustainability overlap (secondary).

**Supervisory model:** ACM + RDI conduct **proactive supervision** (audits, inspections, information requests). Essential entities have no opt-out.

---

## NL adjacent regimes

### Wbni → Cbw transition

Pre-existing designations under Wbni (vital-aanbieder status) carry forward into Cbw. If you were vital-aanbieder under Wbni (Electrical Safety Act, Gas Act, etc.), confirm your essential-entity registration with NCSC-NL covers the same scope under Cbw.

### Network Code on Cybersecurity for Electricity (EU 2024/1366)

**Binding sector-specific overlay** on top of NIS2. Sets operational security requirements for:
- Voltage/frequency stability (protective relays, synchronization, loss-of-control scenarios).
- SCADA/EMS/DMS cybersecurity hardening.
- Incident reporting thresholds for grid-destabilizing events (e.g. frequency deviation > ±1 Hz).

Compliance deadline: ~Q1 2025 for initial implementation roadmap, Q4 2025 for full measures.

Reference: EU 2024/1366 text (not yet in corpus at snapshot date; consult EUR-Lex + ENTSO-E guidance).

### Wwke (Civil Emergency Act, CER transposition)

Complements NIS2 with physical resilience, backup power, emergency communications, and critical-infrastructure continuity. Entities subject to both Cbw and Wwke must align BCM + incident-response plans across both regimes.

### REMIT (Regulation on Energy Market Integrity + Transparency)

Market-operator entities (gas hubs, electricity exchanges) must report suspicious transactions to ACER. Overlap with NIS2 incident reporting on confidentiality breaches affecting market data.

---

## OT/ICS angle: IEC 62443 as the NIS2 framework

Energy operators historically relied on **IEC 62443** (industrial-control-system security standard). NIS2 art. 21 measures map directly to IEC 62443 zones, conduits, and security levels (SL-T):

| IEC 62443 component | NIS2 art. 21 mapping |
|-------------------|-------------------|
| **Zone definition** (SCADA, EMS, RTU, relay network, corporate IT) | Risk analysis + segmentation (art. 21(2)(a)) |
| **Conduit security** (firewalls, data diodes, IPSec) | Network security + encryption (art. 21(2)(h), (j)) |
| **SL-T target per zone** (1=basic, 2=focused, 3=advanced, 4=maximum) | Risk assessment calibration (art. 21(2)(a)) |
| **Secure engineering workstation (jump host)** | Access control + PAM (art. 21(2)(i), (j)) |
| **Patch + patch testing protocols** | Secure development + maintenance (art. 21(2)(e)) |

**Reality check:** Most energy OT is no longer air-gapped. Remote maintenance via vendor tunnels, engineering workstation connections to corporate IT, and wide-area networks (WANs) create indirect connectivity. Assume each interface is a potential attack surface.

---

## Top sector-specific risks

**Industroyer-class targeted malware (SCADA/EMS attack):**
- Malware specifically designed to trip breakers, desynchronize generators, cause cascading outages.
- **Mitigation:** IEC 62443 SL-3+ architecture; egress filtering on OT-to-IT boundaries; protective-relay hardening (secure boot, firmware signing).

**Ransomware via IT-OT crossing (Colonial Pipeline class):**
- Attacker enters corporate IT, pivots to OT via engineering workstations or shared databases. Threatens grid availability (not just data).
- **Mitigation:** Network segmentation with monitored data diodes; MFA on all OT access points; incident-response plan explicitly covering loss-of-control scenarios.

**Supply-chain via inverter/EMS firmware:**
- Compromised solar inverters, energy-management-system software, protective relay firmware.
- **Mitigation:** SBOM (Software Bill of Materials) requirement in contracts; firmware signature verification; vendor security assessments before procurement.

**Smart-meter PII + remote-disconnect risk:**
- Meters expose customer consumption patterns; remote commands could enable mass disconnect (economic attack).
- **Mitigation:** Encrypted meter-to-head-end channels; role-based access control on disconnect commands; audit logging.

**Vendor remote-access compromise:**
- Vendors (Siemens, ABB, Schneider, etc.) maintain remote tunnels for maintenance. Compromised tunnel = full OT visibility.
- **Mitigation:** PAM with session recording; IP allow-listing; time-bound access grants; out-of-band approval for remote sessions.

**GPS time-spoofing on protective relays:**
- Relays synchronize on GPS time. Spoofed time ± seconds can desynchronize protective actions across the grid.
- **Mitigation:** Secure time sources (NTP with authentication, GPS anti-jamming); local time backup; frequency-based triggering (not just time).

**Insider risk in 24/7 control-room shifts:**
- Operator with legitimate access performs unsafe actions (deliberate or compromised). Limited oversight in overnight shifts.
- **Mitigation:** Segregation of duties (approval gates); session recording + later review; KPI monitoring for unsafe patterns.

**BPL/PLC-layer attacks (Broadband Power Line):**
- Power-line communication (PLC) on the grid can be intercepted or spoofed, especially on low-voltage distribution.
- **Mitigation:** Encryption + authentication on PLC protocols where supported; air-gap sensitive control functions from PLC.

---

## Quick-win checklist

- [ ] **IT-OT segmentation documented** — Network diagram showing zones, conduits, data flows. Firewalls/data diodes at each boundary with traffic rules logged.
- [ ] **Vendor remote-access via PAM** — All vendor tunnels routed through PAM (Privilege Access Management) with session recording, IP allow-list, time-bound grants.
- [ ] **OT asset inventory with firmware baseline** — Spreadsheet of SCADA, EMS, DMS, RTUs, IEDs, smart-meter head-ends, inverters with firmware versions, SBOM where available.
- [ ] **Patch management policy for OT** — Explicit change-window procedures (e.g. weekend, off-peak hours); testing protocol on isolated test bed before production deployment.
- [ ] **IEC 62443 SL-T target per zone** — For each zone (SCADA, EMS, relay, corporate), document security-level target (1–4) and justify basis.
- [ ] **Secure engineering workstations** — Dedicated machines for OT engineering (no USB, printer, external media); air-gapped or on isolated VLAN; multi-factor access.
- [ ] **EMS/SCADA configuration backup** — Encrypted, versioned, stored offline or in geo-distributed vault. Restore test ≥ annually.
- [ ] **Tabletop: loss-of-control scenario** — Simulate attacker gains SCADA write access; practice manual failover, grid-isolation, customer comms. Document lessons learned.
- [ ] **Smart-meter cybersecurity** — Meter-to-head-end encryption enabled; remote-disconnect command access restricted to named roles; audit log of all disconnect events.
- [ ] **Protective relay hardening** — Firmware signed + verified on boot; time source redundancy (NTP + GPS with anti-spoofing); frequency-based trip backup.
- [ ] **Supplier SBOM + security assessment** — For all COTS inverters, EMS, relay firmware: require SBOM, vulnerability history, patch cadence from vendor before procurement.
- [ ] **Network Code compliance roadmap** — Document measures for frequency stability, SCADA hardening, loss-of-control scenario per EU 2024/1366 timeline.
- [ ] **24/7 incident escalation** — Contact tree with NCSC-NL, ACM, RDI, ENTSO-E (if TSO), grid operators. Test escalation path annually.
- [ ] **Multi-stage incident reporting** — 24h early warning (unlawful/malicious suspected), 72h notification (severity + impact), 1mo final report with root cause + Network Code thresholds checked.

---

## Incident-reporting nuances

**Network Code thresholds (grid-destabilizing events):**
- Frequency deviation ≥ ±1 Hz sustained > 5 seconds triggers mandatory reporting to TSO / ENTSO-E.
- Voltage deviation ≥ ±10% sustained > 2 seconds at bulk-supply points.
- Cascading trip of ≥ 3 critical assets or ≥ 500 MW loss in 1 minute.

These thresholds may differ from NIS2's generic "significant incident" definition; energy operators must monitor *both*.

**National-security overlay (NCTV engagement):**
- Grid-destabilizing incidents may trigger NCTV involvement (critical infrastructure protection).
- NCTV may request containment of incident details for operational security (e.g. zero-day in relay firmware).
- Coordinate with NCSC-NL + ACM on sensitive disclosure.

**Cross-border coordination:**
- TSOs in adjacent Member States (e.g. German, Belgian grids electrically coupled to NL) must notify ENTSO-E + relevant CSIRTs.
- Gas transmission incidents (Gasunie) affecting EU networks escalate to ACER + relevant gas authorities.

**Customer impact reporting:**
- Retail suppliers + DSOs must notify customers if incident affects supply for > 1 hour (per Energy Directive requirements).
- Format: estimated duration, cause (if safe to disclose), compensation eligibility.

---

## Mapping to corpus

| Resource | Purpose |
|----------|---------|
| [`eu-directives/md/nis2-2022-2555-NL.md`](../eu-directives/md/nis2-2022-2555-NL.md) | NIS2 Annex I point 1 (energy scope). Background on Essential designation. |
| [`eu-directives/md/cer-2022-2557-NL-html.md`](../eu-directives/md/cer-2022-2557-NL-html.md) | CER (Civil Emergency Act, Wwke transposition). Physical resilience + emergency comms overlap. |
| [`enisa-guidance/md/ENISA_Technical_Implementation_Guidance_v1.0.md`](../enisa-guidance/md/ENISA_Technical_Implementation_Guidance_v1.0.md) | Practical evidence mapping for NIS2 art. 21 measures (applies to energy sector baseline). |
| [`CHECKLIST-CISO.md`](../CHECKLIST-CISO.md) | Sections 2.a–2.j (art. 21 measures) + section 4 (incident reporting). Energy sector gap-analysis template. |
| [`FAQ-compliance-officers.md`](../FAQ-compliance-officers.md) | Q1 (scope test), Q6–14 (obligations + incident reporting), Q18 (ACM/RDI supervision). |
| EU 2024/1366 | Network Code on Cybersecurity for Electricity Sector (binding ~Q4 2025). Consult ENTSO-E guidance + EUR-Lex for sector-specific thresholds. |

---

## See also

- [`README.md`](../README.md) — Corpus overview + "About NIS2 in 60 seconds."
- [`GLOSSARY.md`](../GLOSSARY.md) — Terminology (TSO, DSO, EMS, SCADA, DMS, IEC 62443, SL-T, RTU, IED, OT/ICS).
- [`TIMELINE.md`](../TIMELINE.md) — NL Cbw entry-into-force (~July 2026), Network Code 2024/1366 compliance timeline.
- [`CHECKLIST-CISO.md`](../CHECKLIST-CISO.md) — Full readiness checklist; section 0 (scope confirmation), section 2 (art. 21 measures).
- [`FAQ-compliance-officers.md`](../FAQ-compliance-officers.md) — Practical Q&A on scope, supervision, incident reporting.
- [`templates/`](../templates/) — CSV templates for asset inventory, risk register, supplier assessment, incident register.

---

> **Disclaimer:** This guide is not legal advice. NIS2 + EU 2024/1366 are binding. NL Cbw + Cyberbeveiligingsbesluit entry-into-force expected ~Q2 2026. Verify against live ACM, RDI, NCSC-NL, ENTSO-E, and EUR-Lex sources before board-level decisions.
