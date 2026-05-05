# NIS2 Sector Guide: Manufacturing

**Scope:** NIS2 Annex II point 5 — manufacture of medical devices and in-vitro diagnostic medical devices; computer, electronic and optical products; electrical equipment; machinery and equipment n.e.c.; motor vehicles, trailers, semi-trailers; other transport equipment.

**Audience:** Manufacturing companies (OEMs, Tier-1 suppliers, component makers) and their compliance, IT, and OT teams preparing for the Dutch Cyberbeveiligingswet (Cbw) and NIS2.

> **Disclaimer:** Not legal advice. Cbw + AMvBs are not yet in force at the time of this corpus snapshot ([`INVENTORY.md`](../INVENTORY.md) — `Retrieved 2026-04-26`). Verify against the live source before relying on any answer for board-level decisions.

---

## Are you in scope?

**Three-part test:**

1. **Sector match** — You are in the Annex II point 5 manufacturing category (medical devices, computers/electronics, machinery, motor vehicles, or transport equipment). See [`eu-directives/md/nis2-2022-2555-NL.md`](../eu-directives/md/nis2-2022-2555-NL.md) for the full Annex text.

2. **Size threshold** — You employ ≥ 50 people OR have annual turnover / balance sheet total ≥ €10M. Below this, you are typically **out of scope** unless you are a sole provider of critical services in the Netherlands (rare for manufacturers).

3. **Establishment** — Your main establishment is in the Netherlands, or you provide services regulated under NIS2 in the NL.

**If yes to all three:** You are an **Important entity** (lower-tier under NIS2) subject to reactive supervision and lower maximum fines than essential entities. Registration with NCSC-NL is mandatory (NIS2 art. 27). See decision tree: [`nl-overheid-publicaties/md/doorverwijsboom-cyberbeveiligingswet.md`](../nl-overheid-publicaties/md/doorverwijsboom-cyberbeveiligingswet.md).

---

## NL competent authority

**Cybersecurity oversight:**
- **NCSC-NL** — Primary registration point and incident reporting (NIS2 CSIRT). Contact: [`www.ncsc.nl`](https://www.ncsc.nl).
- **RDI (Rijksdienst voor Identiteitsgegevens)** — Likely technical cyber competent authority under the Cyberbeveiligingsbesluit (pending entry into force).

**Sector-specific regulators** (parallel to NIS2):
- **Healthcare products** — Inspectorate for Health Care & Youth (IGJ) / Dutch Health Authority for MDR / IVDR compliance.
- **Automotive** — RDW (road vehicles) + EU motor vehicle regulations.
- **Machinery** — Notified Bodies under EU Machinery Regulation 2023/1230.
- **General products** — Consumer Safety Authority (Autoriteit Consumentenbescherming) under EU General Product Safety Regulation 2023/988.

**Action:** Confirm your primary regulator based on product category (medical, automotive, machinery, electronics); cross-coordinate NIS2 obligations with sector-specific rules.

---

## NL / EU adjacent regimes

### Cyber Resilience Act (CRA) — EU 2024/2847

**Scope:** Products with digital elements (embedded software, connectivity, data processing).

**Manufacturer obligation:** Conduct threat & vulnerability analysis; implement secure-by-design principles; disclose vulnerabilities to ENISA via single reporting portal. Distinct from (but aligned with) NIS2 art. 21 organizational measures — CRA is **product-side**, NIS2 is **organizational**.

**Impact on manufacturing:** Medical devices, smart machinery, networked industrial controllers, and IoT sensors now carry product-level cyber compliance duties independent of NIS2. See [`eu-directives/md/nis2-2022-2555-NL.md`](../eu-directives/md/nis2-2022-2555-NL.md) for CRA scope notes.

### Medical Device Regulation (MDR) — EU 2017/745 & IVDR (in-vitro diagnostic devices — EU 2017/746)

**Scope:** Medical devices and IVDs manufactured or placed on the EU market.

**Cyber aspects:** Post-market surveillance, vulnerability disclosure, patch management, traceability. Increasingly harmonized with CRA and NIS2; ENISA single-portal incident reporting converges these streams.

**Key change:** Notified Bodies now audit cybersecurity as part of quality-management review. Plan for cross-audit between NIS2 and MDR/IVDR.

### Machinery Regulation — EU 2023/1230

**Scope:** Machinery (including control systems, embedded processors, networked MES).

**Cyber aspects:** Risk assessment must address cyber-physical safety (control-system hijacking, sensor spoofing). Cybersecurity is part of "safety" in the EU Machinery context.

### General Product Safety Regulation — EU 2023/988

**Scope:** All products not exclusively covered by sector-specific rules.

**Cyber aspects:** Manufacturers must perform cyber-risk assessments for connected / networked products; product-safety obligations include resilience against unintended cyber manipulation.

### UNECE R155 / R156 (Motor vehicles)

**Scope:** Road vehicles (automotive OEMs and suppliers).

**Cyber requirements:** Cybersecurity management system + secure vehicle design + vulnerability management + incident handling. Aligns with NIS2 art. 21 but is **product and supply-chain specific**.

**Action:** Automotive suppliers must satisfy both R155/R156 (vehicle-level cyber) and NIS2 (organizational cyber). Consolidate in a unified cybersecurity program.

---

## OT/IT convergence

Manufacturing increasingly blurs operational technology (plant-floor systems) and information technology (ERP, PLM, cloud):

- **Legacy isolation** — PLC networks, SCADA systems, MES were once air-gapped. No longer.
- **Industry 4.0 / IIoT** — Real-time data push to cloud (e.g., SAP Analytics Cloud, Siemens MindSphere, Bosch Rexroth ctrlX) exposes shop-floor systems to internet-facing risks.
- **Convergence risks** — Ransomware / Trojans on IT systems can pivot to OT (Wannacry on Siemens networks, NotPetya on supply-chain software); spoofed engineering changes corrupt production (e.g., CAD file tampering); insider threats move across IT/OT boundaries.

**Reference architecture:**
- **Purdue Reference Model** — Five-layer hierarchy (Enterprise → Control → Supervisory → Basic Control → Field Devices). Use as baseline to design firewall + DMZ + jump-host segmentation.
- **IEC 62443** — International cybersecurity standard for industrial automation; complements NIS2.

**NIS2 implication:** Risk-management measures (art. 21) must account for OT/IT attack surface:
- Firewalls + DMZs between IT (ERP, Cloud) and OT (PLC, SCADA, MES).
- Jump-host / bastion architecture for vendor remote access.
- Inventory of firmware versions on OT devices.
- Patch & patch-testing procedures that respect OT uptime constraints.

---

## Supply-chain depth and SBOM

Manufacturing depends on deep, opaque supply chains (Tier-1 to Tier-N):

- **OEM perspective** — Tier-1 suppliers provide subsystems; each Tier-1 has Tier-2+ subsuppliers. Single source-code or firmware flaw upstream cascades to finished products.
- **Contractual flow-down** — Customers (OEMs) increasingly demand NIS2-equivalent cyber clauses in Tier-1 contracts. Tier-1s then flow down to Tier-2s. Standard practice: security questionnaire + self-certification, with audit rights on critical suppliers.
- **SBOM expectations** — CRA mandates Software Bill of Materials; NIS2 art. 21(2)(d) requires visibility into supplier vulnerabilities. Accepted formats: **CycloneDX** (SPDX), **SPDX** (dependency graph). SBOMs must track component versions, known CVEs, and provenance.
- **Customer audits** — Automotive + medical-device OEMs regularly audit Tier-1 cyber posture (ISO 27001, ISMS maturity, incident history). Plan for customer site visits + questionnaire libraries.

**Action:** Build SBOM-ingestion tooling (e.g., OWASP Dependency-Check, CycloneDX parsers); maintain a standard security questionnaire + response templates for suppliers; track supplier audit outcomes in risk register.

---

## Top sector risks

**Ransomware halting production lines:**
- Single encrypted PLC or MES = production halt. Cost: €1M–€10M/day for large OEMs.
- Backup & restore tested? Offline backup of HMI configs + PLC programs? Crisis comms plan?

**IP exfiltration (designs, CAD, recipes, source code):**
- CAD files, material recipes, process parameters = competitive advantage. Competitors + nation-states target these.
- Threat: Insider with cloud-sync enabled; outsourced R&D partner with weak access control; third-party MSP / PLM-SaaS provider breach.

**OT incidents from IT pivot:**
- Ransomware on IT domain spreads to OT (Wannacry on Siemens TIA Portal). Legacy OT systems often lack patch cycles.
- Mitigation: Firewall + DMZ; air-gap critical systems; firmware inventory + patch roadmap.

**Shadow OT (unmanaged devices):**
- Engineers connect raspberry-pi, USB analyzers, rogue gateways to production networks for troubleshooting. No asset inventory = no visibility.

**Spoofed engineering changes:**
- Compromised CAD pipeline (e.g., Autodesk Fusion 360 account hijacked) → malicious geometry pushed to CAPP → CNC machines produce out-of-spec parts.
- Mitigation: MFA on engineering workstations; SBOM + CAD change audit log; offline approval of critical CAD releases.

**Third-party MES / PLM SaaS compromise:**
- SAP Manufacturing Cloud, Dassault Enovia, Siemens TeamCenter hosted = trusted third-party controls production. Supplier breach = supplier incident report + your incident report.

**USB-borne malware in air-gap myth:**
- USB stick from external partner → air-gap engineering network → malware spreads to PLC programmer → PLC reprogrammed with sabotage logic. Air-gap is porous if people carry USB.

---

## Quick-win checklist

1. **OT asset inventory** — All PLCs, SCADA, HMI, robot controllers, CNC machines listed with: manufacturer, model, firmware version, last patch date, network location, owner. Use spreadsheet or dedicated OT asset-management tool (e.g., Claroty, Fortive, Nozomi).

2. **IT/OT firewall + DMZ** — Physical or logical separation of IT (ERP, cloud-sync, email) from OT (plant floor). DMZ for historian, MES, remote-access VPN.

3. **Jump-host for vendor support** — All remote access via bastion host with: session recording, MFA, audit log. No direct remote-desktop to PLC / SCADA.

4. **MFA on engineering workstations** — Windows + Mac machines used for CAD, PLC programming, and configuration locked to MFA (YubiKey, authenticator app).

5. **SBOM ingestion** — Process for consuming supplier SBOMs (CycloneDX or SPDX). Track component versions + known CVEs. Flag components with unpatched critical CVEs.

6. **Customer questionnaire library** — Standard cybersecurity & supply-chain security questionnaire for your customers / suppliers. Responses documented and tracked in risk register.

7. **Ransomware tabletop** — Scenario: "Production line encrypted; ransom demanded; customer notification required; backup restore?" Run once per year with ops, CISO, IR, legal, comms. Document decisions + owners.

8. **Offline backup of PLC + HMI configs** — USB drive or network-isolated storage. Test restore annually. Keep in secure physical location (safe, vault).

9. **Remote-access VPN with session recording** — All vendor + remote-support engineers use VPN with MFA + session recording (asciinema, terminal-recording). Audit log searchable.

10. **Firmware versioning + update roadmap** — All OT devices: current firmware version, roadmap for patches, risk acceptance for unpatched (if any). Vendor notification process documented.

11. **Breach notification SLA to customers** — Contractual commitment: "Significant incidents reported within 24–72 hours." NIS2 art. 23 triggers + customer-specific notification processes.

12. **Post-incident lessons-learned process** — After any incident, debrief + register findings in risk register. Feed insights into training, policies, and supplier audits.

13. **Patch testing lab** — Small PLC / SCADA environment mirroring production. Test patches here before rolling out to shop floor.

14. **Security awareness training (manufacturing-specific)** — All staff (especially production + engineering) trained on: USB hygiene, phishing, MFA, access-control handoffs, incident reporting. Tracked + annual refresher.

15. **CRA readiness for product firmware** — If you ship products with embedded software: conduct threat analysis, publish security.txt / vulnerability-disclosure policy, plan for post-market patches.

---

## Incident-reporting nuances under NIS2

**Production halt ≠ automatic "significant incident":**
- NIS2 art. 23(3) defines significant incident as one having impact on essential services or society. A manufacturing line stopping for a day may **not** meet this threshold unless the impact cascades to final customer (e.g., halts a hospital's surgical schedule; delays critical automotive delivery).
- **Judgment required:** Consult NCSC-NL guidance + legal counsel.

**IP loss may trigger separate notification:**
- Export-controlled designs (e.g., drone technology, defense-sector machinery) lost to exfiltration may trigger national-security notification (separate from NIS2) to Dutch Ministry of Defense or Foreign Affairs.
- Confidential recipes / methods: breach notification under GDPR (if personal data involved) or trade-secret notification under Dutch law (Wet onrechtmatige mededinging).

**CRA product-side incident portal:**
- CRA (art. 17) requires manufacturers to report product vulnerabilities to ENISA via a single-portal system (distinct from NIS2 art. 23). If your product has digital elements: track vulnerabilities separately for product vs. organizational incident reporting.
- **Convergence underway:** ENISA and NCSC-NL are aligning these streams; future single notification may be possible.

**Contractual escalation:**
- Inform customers (OEMs, integrators) per contractual SLA (typically 24–72 hours). Prepare a response template: what happened, what's your mitigation, what do they need to do?

---

## Mapping to corpus

- **Core NIS2 text** → [`eu-directives/md/nis2-2022-2555-NL.md`](../eu-directives/md/nis2-2022-2555-NL.md), Annex II point 5.
- **CRA overview** → [`eu-directives/md/nis2-2022-2555-NL.md`](../eu-directives/md/nis2-2022-2555-NL.md) (CRA scope & product-cyber requirements).
- **Implementing Regulation (CIR 2024/2690)** → [`eu-implementing-regulation/md/cir-2024-2690-NL-html.md`](../eu-implementing-regulation/md/cir-2024-2690-NL-html.md) (not applicable to manufacturing tier, but reference for understanding digital-infrastructure obligations; medical-device / digital-service providers may overlap).
- **ENISA guidance** → [`enisa-guidance/md/ENISA_Technical_Implementation_Guidance_v1.0.md`](../enisa-guidance/md/ENISA_Technical_Implementation_Guidance_v1.0.md), [`enisa-guidance/md/ENISA_NIS2_Roles_Skills_ECSF_Mapping.md`](../enisa-guidance/md/ENISA_NIS2_Roles_Skills_ECSF_Mapping.md).
- **Readiness checklist** → [`CHECKLIST-CISO.md`](../CHECKLIST-CISO.md) — all 10 mandatory measure areas; focus on 2.c (BCM/DR for plant resilience), 2.d (supply-chain), 2.e (secure development of firmware + CAD), 2.f (effectiveness — internal audits + red-team).
- **FAQ** → [`FAQ-compliance-officers.md`](../FAQ-compliance-officers.md) — Q1–Q12 cover scope, obligations, tiers, reporting.
- **Quick-start** → [`QUICKSTART-SME.md`](../QUICKSTART-SME.md).

---

## See also

- **README** — [`README.md`](../README.md) — NIS2 in 60 seconds + governance structure.
- **GLOSSARY** — [`GLOSSARY.md`](../GLOSSARY.md) — Key terms (Annex I, Annex II, essential, important, significant incident, etc.).
- **TIMELINE** — [`TIMELINE.md`](../TIMELINE.md) — Key dates for Cbw entry into force and supervision ramp-up.
- **Dutch decision tree** — [`nl-overheid-publicaties/md/doorverwijsboom-cyberbeveiligingswet.md`](../nl-overheid-publicaties/md/doorverwijsboom-cyberbeveiligingswet.md).

---

**Last updated:** 2026-05-05  
**Status:** Draft (pending Cyberbeveiligingsbesluit entry into force)
