# NIS2 Space Sector Guide

**Scope:** Operators of ground-based infrastructure that supports the provision of space-based services. Essential tier. Focus: mission control, tracking/telemetry/command (TT&C) facilities, ground stations, antenna farms, satellite integration facilities, and related Earth-observation downlink operations.

**Audience:** Space company CISOs, mission-control teams, ground-segment operations staff, procurement teams managing RF + command infrastructure, incident response teams, satellite operators with NL ground presence.

---

## Are you in scope?

Your organization falls under NIS2 Space (Annex I point 11) if you operate ground-based infrastructure supporting space services:

| Infrastructure type | Scope indicator |
|-------------------|-----------------|
| **Mission control + flight dynamics** | Command center operating satellites, managing orbital data, executing command sequences. Essential if supporting essential services downstream (comms, navigation, Earth observation). |
| **TT&C ground station** | Facility providing tracking, telemetry reception, or command uplink to orbital assets. Essential if supporting essential downstream services. |
| **Ground antenna farm** | Multiple antennas for satellite RF reception/transmission. Essential if supporting essential services. |
| **Satellite integration facility** | Payload integration, testing, pre-launch operations. Essential if supporting space services designated Essential. |
| **Earth-observation downlink ops** | Ground station receiving and processing imaging/sensor data from satellites. Essential if supporting essential downstream services (crisis response, agriculture regulation, etc.). |
| **Satellite operator with NL ground segment** | Entity operating satellite with TT&C or command infrastructure in NL. Essential if satellite provides essential services (navigation, emergency comms, critical infrastructure PNT). |

**Scope boundary:** On-orbit assets (satellites themselves) are NOT in scope. Ground infrastructure supporting them IS. If your entity operates only the spacecraft and leases ground services, you are out of scope for NIS2 Space; your ground-service provider is in scope.

**Tier:** Space operators designated Essential are subject to full NIS2 art. 21 measures (no SME carve-out).

---

## NL competent authority & supervision split

**RDI (Rijksinspectie Digitale Infrastructuur)** — Leads technical cyber-security compliance assessment under Cbw.

**Agentschap Telecom** — Radio-spectrum licensing + RF interference authority; may investigate jamming or spoofing incidents.

**NCSC-NL** — National CSIRT for NIS2 incident reporting (art. 23) and crisis escalation.

**ESA (European Space Agency)** — Security framework for funded missions; may request incident notification for ESA-contracted payloads or TT&C support.

**AIVD / MIVD** — Foreign intelligence + military intelligence may engage if incident involves state-sponsored RF attack, supply-chain compromise, or classified payload data compromise.

**EU Space ISAC** — Voluntary information-sharing on space-sector incidents (expected, not mandatory, but culturally expected).

**Supervisory model:** RDI conducts proactive supervision (audits, inspections). Essential entities have no opt-out.

---

## NL adjacent regimes

### Wet ruimtevaartactiviteiten (Space Activities Act)

Pre-existing operator-license regime. Cyber-causing-loss-of-orbital-asset triggers mandatory reporting to Ministry + loss-of-asset insurance claims. NIS2 Cbw + Wet ruimtevaartactiviteiten must be aligned for incident classification.

### ITU Radio Regulations + Agentschap Telecom enforcement

NL ground stations must comply with ITU spectrum allocations + avoid interference with other users. RF jamming or spoofing incidents may trigger Agentschap-Telecom investigation (cross-border notification to ITU).

### EU Space Regulation 2021/696 (Galileo, Copernicus, IRIS²)

If operating ground segments for EU flagship missions (Galileo receiver networks, Copernicus downlink, IRIS² secure comms), EU Security Policy + ESA-specific incident reporting applies on top of NIS2.

### GNSS PRS Access Agreements

Organizations accessing encrypted GNSS Public Regulated Service (Galileo PRS for critical infrastructure) sign security agreements with ESA + EC. GNSS spoofing incidents trigger GNSS PRS authority notification.

### Dual-use Export Controls (EU 2021/821 + NL Sgda)

Certain RF equipment, satellite payloads, and mission-control software may require dual-use export license if transferred abroad. Cyber-caused data exfiltration triggering export-control review must be disclosed to MIVD + Ministry (Interior/Justice/Defense as applicable).

### ITAR (International Traffic in Arms Regulations)

US-origin hardware or software (common in satellite RF front-ends, tracking algorithms, command language) prohibits export to NL without ITAR license. Cyber breach affecting US-licensed tech must be reported to US State Department + DDTC.

### ESA Security Regulations

For ESA-contracted missions or ESA-funded ground segments: mandatory security incident reporting to ESA Security Officer. Thresholds may differ from NIS2 (e.g. loss of confidentiality on payload data triggers ESA report even if NIS2 severity threshold not met).

---

## Top sector-specific risks

**GNSS spoofing + downstream PNT cascade:**
- Attacker broadcasts false GPS signals near mission control or ground stations. Relays desynchronize, command timing fails, satellite commands execute at wrong epochs.
- Downstream: power grids, financial settlement systems, telecom base-station timing all depend on GNSS. Loss of accurate position/time at satellite TT&C can trigger cascading outages.
- **Mitigation:** GNSS anti-jam receiver; secondary time source (atomic clock or secure NTP); GNSS signal authentication (Galileo PRS where authorized); local-time redundancy for command synchronization.

**TT&C uplink hijack + command injection:**
- Attacker spoofs or compromises TT&C uplink, injects malicious command sequence (propellant dump, payload shutdown, deorbit).
- **Mitigation:** Command authentication (cryptographic signatures on every command); replay protection (lockstep command counters); ground-to-spacecraft encrypted link; dual-control approval (two operators for critical commands).

**Mission-control software supply-chain compromise:**
- Satellite mission-control software (Kratos, Cortex, Cobham, or smaller COTS packages) contains backdoor or supply-chain vulnerability. Attacker gains read/write access to TT&C authority.
- **Mitigation:** SBOM (Software Bill of Materials) from vendor; source-code escrow for critical tools; signed release verification; isolated test environment for all updates before production deployment.

**Telemetry confidentiality breach:**
- Ground station receives encrypted or obfuscated telemetry revealing payload capabilities, operational status, or classified sensor parameters. Breach exfiltrates data to adversary.
- **Mitigation:** Telemetry data classification per NL-rubricering + ESA/NATO levels; encrypted storage at rest; role-based access to telemetry viewing; audit log of all telemetry access.

**Ransomware vs. mission-control SCADA:**
- Attacker infiltrates mission-control corporate IT (email, VPN), pivots to OT-like mission-planning systems, encrypts databases or command-generation workflows.
- **Mitigation:** Network segmentation (mission IT vs. corporate IT); MFA on all VPN + mission-system access; immutable backups of command history + mission state; incident-response playbook for loss-of-control.

**Insider risk: rogue operator console access:**
- Mission-control operators work 24/7 shifts. Insider with legitimate console access executes unsafe commands (deliberate or coerced). Limited oversight during off-hours.
- **Mitigation:** Segregation of duties (multi-person approval for critical commands); session recording + later review; abnormal-access alerting; psychological-security vetting.

**Ground-station RF front-end compromise:**
- Antenna receiver front-end firmware (likely ITAR-restricted, provided by US vendor) contains supply-chain backdoor or is remotely updated with malware. Attacker can jam, spoof, or eavesdrop on uplink/downlink.
- **Mitigation:** Firmware signature verification on boot; ITAR compliance audit of US suppliers; secure update mechanism (offline USB on isolated workstation); RF spectrum monitoring for anomalous signals.

**Anti-satellite RF interference + spoofing:**
- Attacker or state actor broadcasts high-power RF to disrupt uplink (denial of service) or spoof downlink (false telemetry/command confirmation).
- **Mitigation:** RF spectrum monitoring (passive + active scanning); antenna pattern hardening; frequency-agility where design permits; escalation matrix for cross-border RF incidents (Agentschap Telecom + ITU).

**ITAR/EU dual-use export-control leakage:**
- Cyber breach exfiltrates mission-control software, RF design docs, or payload specs subject to ITAR/EU 2021/821. Attacker sells or transfers to non-authorized end-user, triggering export-control violation.
- **Mitigation:** Data classification (ITAR, EU-DUE, NL-rubricering) on all design docs + mission data; DLP (Data Loss Prevention) on email + cloud storage; vendor ITAR agreements in procurement contracts.

**Supply-chain via subcontracted antenna-pointing / RF-firmware:**
- Small subcontractor providing antenna-control firmware, RF-amplifier code, or signal-processing algorithms. Subcontractor lacks security practices; vulnerability introduced into main ground segment.
- **Mitigation:** Vendor security assessment before contract signature; SBOM requirement in SOW; code-review for critical functions; security incident notification clause in subcontractor agreement.

---

## Quick-win checklist

- [ ] **Ground-segment network diagram** — Document mission-control, TT&C, antenna-farm, corporate-IT zones. Show firewalls, data diodes, VPN access points, vendor-remote-access gateways.
- [ ] **TT&C link security design doc** — Specify command authentication (cryptographic scheme, key rotation), replay protection (counter, timestamp), encrypted downlink (if applicable). Design review signed by CTO + mission-assurance lead.
- [ ] **Ground-station asset inventory** — Spreadsheet of antennas, RF equipment, mission-control hosts, TT&C software with firmware versions, SBOM for critical packages, ITAR/export-control tags.
- [ ] **GNSS dependency map** — Identify which systems rely on GPS time/position (mission control, command-timing sync, antenna pointing). Document GNSS spoofing risk. Plan secondary time source (atomic clock or NTP).
- [ ] **Mission-control PAM (Privilege Access Management)** — All ground-station + mission-control console access routed through PAM. Multi-factor auth on PAM. Session recording enabled. Review logs weekly for anomalies.
- [ ] **Data classification policy** — Assign NL-rubricering + ESA/NATO classification to all mission data (commands, telemetry, payload data, RF design docs). Apply DLP rules to email + cloud storage.
- [ ] **Dual-use export-control audit** — List all RF equipment, mission-control software, payload data with ITAR/EU 2021/821 status. Ensure procurement + export-compliance team sign off. Plan incident-reporting to MIVD if breach occurs.
- [ ] **Satellite + ground-segment software supply chain** — For mission-control software, ground-station firmware, and RF tools: require vendor SBOM, vulnerability-history disclosure, patch-cadence commitment. Establish code-escrow for critical tools.
- [ ] **Vendor remote-access policy** — All vendor tunnels (maintenance, updates) routed through PAM with IP allow-list, time-bound session windows, and out-of-band approval. Document rationale + approve exceptions with CISO sign-off.
- [ ] **RF spectrum monitoring** — Deploy passive RF monitor near ground stations to detect jamming/spoofing. Escalation procedure to Agentschap Telecom if anomalies detected. Test escalation path ≥ annually.
- [ ] **Mission-control tabletop: command-injection scenario** — Simulate attacker gains write access to TT&C command stream. Practice manual failover (ground-only control), safe-state commands, notifications to satellite manufacturer + ESA (if applicable). Document lessons learned.
- [ ] **Anti-replay telemetry clock** — Ensure telemetry reception + storage includes tamper-resistant timestamp (e.g. HSM-backed NTP). Document time-sync protocol + tolerance for clock skew.
- [ ] **NCSC-NL + RDI + Agentschap Telecom + AIVD/MIVD escalation matrix** — Contact tree for incident reporting. Include ESA Security Officer + EU Space ISAC point of contact. Test escalation path ≥ annually.
- [ ] **Dual-control procedure for critical commands** — Document process: two authorized operators must approve (independently) before execution of deorbit, propellant-dump, or payload-shutdown commands. Implement in mission-control software via access control.
- [ ] **Incident plan for loss-of-contact** — Procedures for spacecraft unresponsive (TT&C jammed, command failure, hostile takeover scenario). Role assignments, communication templates, external notification chain (NCSC-NL, RDI, ESA, Agentschap Telecom).

---

## Incident-reporting nuances

**NIS2 art. 23 triggers:**
- Cyber-caused loss of mission-control confidentiality (telemetry breach, command-history exfiltration).
- Cyber-caused loss of TT&C availability (ground station offline, antenna damaged, software crash).
- Cyber-caused loss of spacecraft (propellant dump, deorbit command, control handover to attacker).

**ESA security incident reporting (if ESA mission / ESA-funded ground segment):**
- ESA Security Officer notification required (may differ from NIS2 timeline). Thresholds: any confidentiality loss on payload data, any loss of ground-segment availability > 1 hour, any suspected state-sponsored intrusion.

**EU Space ISAC reporting (voluntary but culturally expected):**
- Space community intelligence sharing. Incident summaries (without operational details) shared to detect sector-wide patterns. Coordination with other EU operators on similar threats.

**Export-control notification (if ITAR/EU 2021/821 data breached):**
- US State Department DDTC notification (if ITAR software/hardware exfiltrated).
- MIVD notification (NL Ministry of Defense, if dual-use technology or state-sponsored attack suspected).
- Agentschap Telecom (if RF design or spectrum-sensitive information breached).

**Cross-border RF incident (jamming / spoofing):**
- Agentschap Telecom coordinates with ITU + adjacent-country spectrum authorities.
- ESA may coordinate with EU Border & Coast Guard or other national authorities if incident affects multiple countries.

**Operator-license impact (Wet ruimtevaartactiviteiten):**
- Loss of spacecraft triggers mandatory reporting to Ministry (Interior/Defense/MIVD as applicable). Insurance claim + root-cause investigation required.
- Cyber-caused loss may affect operator-license renewal + impose remediation conditions.

---

## Mapping to corpus

| Resource | Purpose |
|----------|---------|
| [`eu-directives/md/nis2-2022-2555-NL.md`](../eu-directives/md/nis2-2022-2555-NL.md) | NIS2 Annex I point 11 (space sector scope). Background on Essential designation. |
| [`CHECKLIST-CISO.md`](../CHECKLIST-CISO.md) | Sections 2.a–2.j (art. 21 measures) + section 4 (incident reporting). Space-sector gap-analysis template. |
| [`FAQ-compliance-officers.md`](../FAQ-compliance-officers.md) | Q1 (scope test), Q6–14 (obligations + incident reporting), Q18 (RDI supervision). |
| [`SECTOR-energy.md`](./SECTOR-energy.md) | GNSS/PNT time-source overlap; cascading-failure patterns; OT/ICS risk mindset applicable to mission-control SCADA. |
| [`SECTOR-transport.md`](./SECTOR-transport.md) | PNT dependency for aviation/maritime; GNSS spoofing risk cascade. |
| EU Space Regulation 2021/696 | Galileo + Copernicus scope (if applicable). Consult ESA + EUR-Lex for security framework. |
| ITU Radio Regulations | Spectrum allocation for satellite TT&C. Agentschap Telecom enforcement + cross-border coordination. |

---

## See also

- [`README.md`](../README.md) — Corpus overview + "About NIS2 in 60 seconds."
- [`GLOSSARY.md`](../GLOSSARY.md) — Terminology (TT&C, GNSS, PNT, RF, SCADA, payload, telemetry, command, uplink, downlink, RF front-end).
- [`TIMELINE.md`](../TIMELINE.md) — NL Cbw entry-into-force (~July 2026).
- [`CHECKLIST-CISO.md`](../CHECKLIST-CISO.md) — Full readiness checklist; section 0 (scope confirmation), section 2 (art. 21 measures).
- [`FAQ-compliance-officers.md`](../FAQ-compliance-officers.md) — Practical Q&A on scope, RDI supervision, incident reporting.
- [`templates/`](../templates/) — CSV templates for asset inventory, risk register, supplier assessment, incident register.

---

> **Disclaimer:** This guide is not legal advice. NIS2 is binding. NL Cbw entry-into-force expected ~July 2026. Verify against live RDI, NCSC-NL, Agentschap Telecom, ESA, and EUR-Lex sources before board-level decisions. Space-sector operators with ESA missions must also comply with ESA security frameworks.
