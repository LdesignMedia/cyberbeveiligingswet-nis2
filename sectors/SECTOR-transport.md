# NIS2 / Cbw — Sector Guide: Transport

**Audience:** CISOs, compliance officers, and operations leads at NL transport entities.
**Scope:** NIS2 Annex I point 2 (Transport) — air, rail, water, road. Covers operators of infrastructure, services, and traffic management.

> **Status:** Cbw not yet in force at time of writing. Verify against final adopted text + Cyberbeveiligingsbesluit before relying on procedural detail.

---

## Are you in scope?

NIS2 Annex I.2 sub-sectors:

| Mode | Sub-sector entities |
|------|--------------------|
| **Air** | Air carriers (passenger + cargo); airport managing bodies (incl. core network airports — Schiphol, Eindhoven, Rotterdam, Maastricht, Groningen); operators of ancillary installations within airports; traffic management control operators (LVNL — Luchtverkeersleiding Nederland). |
| **Rail** | Infrastructure managers (ProRail); railway undertakings (NS, Arriva, Keolis, Qbuzz, RET-rail, GVB, HTM, Lineas, etc.); operators of service facilities. |
| **Water** | Inland, sea, and coastal passenger + freight water transport companies (excluding individual vessels); managing bodies of ports + entities operating works/equipment within ports; operators of vessel traffic services (Havenbedrijf Rotterdam, Port of Amsterdam, Groningen Seaports, North Sea Port). |
| **Road** | Road authorities responsible for traffic-management control (Rijkswaterstaat, provincies, gemeenten via traffic centres); operators of intelligent transport systems (ITS — dynamic route info, smart traffic lights). |

**Tier:** Essential (NIS2 Annex I).
**Size threshold:** medium + large entities (≥ 50 employees OR ≥ €10M annual turnover/balance sheet).
**SME exception:** sole providers of a critical service in NL remain in scope regardless of size — relevant for niche traffic-management or vessel-traffic-service operators.

Use the official NL decision tree:
- [`../nl-overheid-publicaties/md/doorverwijsboom-cyberbeveiligingswet.md`](../nl-overheid-publicaties/md/doorverwijsboom-cyberbeveiligingswet.md)
- [`../ncsc-nl/md/www.ncsc.nl_cyberbeveiligingswet-nis2_flowchart-registratieplicht-nis2-entiteit.md`](../ncsc-nl/md/www.ncsc.nl_cyberbeveiligingswet-nis2_flowchart-registratieplicht-nis2-entiteit.md)

---

## NL competent authorities

| Mode | Lead supervisory body | CSIRT |
|------|----------------------|-------|
| Air | ILT (Inspectie Leefomgeving en Transport) + IL&T-aviation; coordination with EASA at EU level. | NCSC-NL; sector-CSIRT not yet formalized. |
| Rail | ILT-rail; coordination with ERA (European Union Agency for Railways). | NCSC-NL. |
| Water | ILT-shipping; Rijkswaterstaat (waterways); Havenmeester (per port for VTS). | NCSC-NL; sector exchanges via FERM (FERM is the sector-cyber-resilience initiative for the Rotterdam port). |
| Road | ILT-road + Rijkswaterstaat (national); provincies + gemeenten (regional). | NCSC-NL. |

Final allocation will be confirmed in the Cyberbeveiligingsbesluit. Multi-modal entities (e.g. logistics hubs) face overlapping supervision.

---

## Adjacent NL/EU regimes

Transport entities sit in a thicker regulatory stack than most:

- **CER Directive (EU) 2022/2557** → NL **Wwke** — physical/organisational resilience; many transport entities will also be designated critical entities, creating dual NIS2 + CER obligations. See [`../eu-directives/md/cer-2022-2557-NL-html.md`](../eu-directives/md/cer-2022-2557-NL-html.md).
- **EASA Part-IS** (Implementing Regulation (EU) 2023/203 + Delegated Regulation (EU) 2022/1645) — aviation-specific cybersecurity for organisations approved by EASA. Effective from 2026; complements NIS2 art. 21 with aviation-domain detail.
- **TSI CCS / ERTMS** — rail signalling, control-command + signalling Technical Specifications for Interoperability; security architectures embedded in safety lifecycle.
- **ISPS Code + EU Reg. 725/2004** — port + ship security, primarily physical, with cyber overlay growing. Coordinated with CER for ports.
- **IMO Resolution MSC.428(98)** + **MSC-FAL.1/Circ.3** — maritime cyber risk management embedded in ISM Code; expected to interact with NIS2 art. 21 for shipping companies.
- **R155 / R156 (UNECE)** — vehicle cybersecurity + software-update management for type-approval; relevant to fleet operators procuring R155-compliant vehicles.
- **GDPR / AVG** — passenger data overlap (PNR, ticketing, smart-ticketing). AP within 72h dual-track with NIS2 art. 23 24h/72h/1mo.
- **Cyber Resilience Act (EU 2024/2847)** — applies to digital products (e.g. ITS roadside units, smart-ticketing kiosks, ECMS chargepoint controllers).

---

## OT/ICS angle

Transport is a heavy OT/ICS sector. Key technical environments per mode:

- **Air**: ATM systems (CWP, FDPS), surveillance (radar, ADS-B, MLAT), navigation (ILS, DME, VOR), PSS/DCS in airlines, BHS (baggage handling), border-control IT.
- **Rail**: signalling (ERTMS/ETCS), interlockings, traffic-control centres, traction power SCADA, on-board train control, passenger-information systems, ticketing back-ends.
- **Water**: VTS (Vessel Traffic Services), AIS, port community systems (Portbase), terminal operating systems (TOS) at container terminals, lock + bridge SCADA, on-board OT (ECDIS, engine control).
- **Road**: motorway management systems, dynamic message signs, traffic light controllers, smart-ITS roadside units, tolling back-ends, weigh-in-motion stations.

**IEC 62443** is the leading reference for industrial cyber baselines; ISA/IEC 62443-3-3 zones + conduits + SL-T per zone is a defensible structure.

---

## Top sector-specific risks

1. **Safety-cyber convergence** — incidents can cause physical harm. Risk assessments must integrate with safety cases (railways: CSM-RA; aviation: SMS).
2. **Legacy + long lifetimes** — signalling assets last 20-40 years; many systems predate modern cryptographic baselines. Patching cadence collides with safety re-certification.
3. **Vendor remote-access** — ATM, signalling, VTS, and tolling vendors require persistent remote-access tunnels. Prime supply-chain compromise vector.
4. **Ransomware against ticketing + back-office** — cascades to passenger-facing service disruption (NIS2 art. 23(2) recipient-comms threshold).
5. **GPS / GNSS spoofing + jamming** — affects ADS-B, AIS, road tolling, and time-sync for protective systems.
6. **Position-navigation-timing (PNT) dependencies** — many systems share GPS/Galileo time references; loss-of-PNT scenarios are credible.
7. **Insider risk in 24/7 ops** — control rooms with broad operational access; segregation of duties harder than typical IT.
8. **Multi-modal logistics chains** — port community systems and intermodal handover platforms aggregate flows from many entities; compromise multiplies impact.
9. **Smart-ticketing + identity** — OV-chipkaart-class systems hold passenger PII + payment data; clone/replay attacks on the rise.
10. **Connected vehicles + V2X** — emerging attack surface via cellular OBUs in fleet vehicles, ITS roadside units, and EV charging-controllers.

---

## Quick-win checklist (60-90 days)

15 items aimed at a defensible posture before Cbw entry into force:

- [ ] **OT asset inventory** with firmware versions, vendor support status, network zone, safety-criticality tag.
- [ ] **IT/OT segmentation** with documented firewall + DMZ for any control-network-to-corporate crossing; data diodes where one-way is acceptable.
- [ ] **Vendor remote-access via PAM** (privileged access management) with session recording + per-session approval; eliminate persistent VPN-to-OT tunnels.
- [ ] **Engineering workstations hardened** — dedicated jump hosts, USB-disabled, application allowlist, no general internet.
- [ ] **Backup of OT configurations** (PLC programs, HMI configs, signalling logic) in offline storage; tested restore in last 6 months.
- [ ] **Patch management policy** explicitly addressing OT change windows + safety re-certification interplay; documented exceptions for un-patchable assets.
- [ ] **MFA enforced** on all admin + remote-access + SaaS (ticketing, fleet, MRO).
- [ ] **Phishing-resistant MFA** (FIDO2 / passkeys) for high-value identities (ATM dispatchers, signalling engineers, port-community-system admins).
- [ ] **IEC 62443 SL-T target per zone** documented; gap-to-target tracked.
- [ ] **Joint NCSC-NL + ILT + sector-authority + AP incident playbook** with named roles + 24h/72h/1mo templates pre-populated.
- [ ] **Tabletop exercise** including loss-of-control + ransomware-against-ticketing scenarios; participants from ops, IT, comms, board.
- [ ] **Recipient-communications template** for service disruption — passenger-facing channel + SLA pre-agreed.
- [ ] **PNT dependency map** + degradation procedures (loss of GPS time → which systems degrade gracefully?).
- [ ] **Vendor SBOM ingestion** for new procurements; baseline R155/R156 expectations into vehicle + ITS contracts.
- [ ] **Tier-1 supplier cyber assessment** rolling program; flow-down clauses in standard contracts (incident notification ≤ 24h, audit rights, sub-processor approval).

---

## Incident-reporting nuances

- **Significant-incident thresholds** are mode-specific in practice — guidance via Cooperation Group is forthcoming; until then, default to NIS2 art. 23(3) calibrated to passenger-volume + safety-criticality.
- **Safety-cyber overlap** — incidents affecting safety must also be reported under sectoral safety regimes (e.g. ILT-rail, EASA Part-IS Mandatory Occurrence Reporting); two reports, two channels, same facts.
- **Recipient communication (NIS2 art. 23(2))** — passenger impact triggers public communication faster than commercial-sector norms; coordinate with traveller-information channels.
- **Cross-border** — air + rail + water routinely cross MS borders; coordinate with neighbouring CSIRTs early. EUROCONTROL (air), Network of European Rail Agencies, and EU MARSEC (maritime) provide existing channels.
- **National-security overlay** — major incidents at Schiphol, ProRail, port of Rotterdam, or Rijkswaterstaat trigger NCTV engagement; assume political escalation.
- **CER physical-incident reporting** — for entities also designated under the Wwke, physical-resilience incidents go to a parallel reporting line.

---

## Mapping to corpus

- NIS2 Annex I.2 text: [`../eu-directives/md/nis2-2022-2555-NL.md`](../eu-directives/md/nis2-2022-2555-NL.md)
- CER (sister regime, Wwke source): [`../eu-directives/md/cer-2022-2557-NL-html.md`](../eu-directives/md/cer-2022-2557-NL-html.md)
- ENISA Tech Guidance (CIR-style mapping; non-binding for transport but useful as evidence reference): [`../enisa-guidance/md/ENISA_Technical_Implementation_Guidance_v1.0.md`](../enisa-guidance/md/ENISA_Technical_Implementation_Guidance_v1.0.md)
- ENISA Cyber Stress Tests handbook (sectoral exercise methodology): [`../enisa-guidance/md/ENISA_Handbook_Cyber_Stress_Tests_v2.0.md`](../enisa-guidance/md/ENISA_Handbook_Cyber_Stress_Tests_v2.0.md)
- NCSC FAQ: [`../ncsc-nl/md/www.ncsc.nl_cyberbeveiligingswet-nis2_faq-cyberbeveiligingswet-nis2.md`](../ncsc-nl/md/www.ncsc.nl_cyberbeveiligingswet-nis2_faq-cyberbeveiligingswet-nis2.md)
- NL wetsvoorstel kamerstukken (Cbw): [`../nl-wetsvoorstel/md/cbw-2025D26060.md`](../nl-wetsvoorstel/md/cbw-2025D26060.md)
- Cyberbeveiligingsbesluit draft: [`../nl-amvb-consultatie/md/ontwerp-cyberbeveiligingsbesluit.md`](../nl-amvb-consultatie/md/ontwerp-cyberbeveiligingsbesluit.md)

## See also

- [`../README.md`](../README.md) — corpus overview, "About NIS2 in 60 seconds".
- [`../FAQ-compliance-officers.md`](../FAQ-compliance-officers.md) — cross-sector Q&A.
- [`../CHECKLIST-CISO.md`](../CHECKLIST-CISO.md) — evidence checklist (Section 3 covers CIR-specific items not directly applicable to transport, but Sections 1, 2, 4–8 apply).
- [`../GLOSSARY.md`](../GLOSSARY.md) — term definitions.
- [`../TIMELINE.md`](../TIMELINE.md) — NL + EU key dates.
- [`README.md`](./README.md) — sector index.

---

> **Disclaimer:** Not legal advice. Cbw + Cyberbeveiligingsbesluit not yet in force. Mode-specific supervisory allocations may shift in the final adopted AMvB. Verify with legal counsel + sectoral authority (ILT, EASA, ERA, port authority) before relying on this guide for procedural decisions.
