# Sector-Specific Guides

NIS2 / Cbw applies across ~18 sectors but the operational reality differs sharply. Each guide here focuses on one sector's specifics: scope test, NL competent authority, sector-adjacent regimes, top sector risks, quick-win checklist, and links into the corpus.

| Guide | Tier | NL competent authority | Adjacent regimes |
|-------|------|------------------------|------------------|
| [`SECTOR-digital-infrastructure.md`](./SECTOR-digital-infrastructure.md) | Mostly Essential | RDI | CIR 2024/2690 (binding), eIDAS |
| [`SECTOR-healthcare.md`](./SECTOR-healthcare.md) | Essential | IGJ + Z-CERT | NEN 7510, MDR, GDPR/WGBO |
| [`SECTOR-energy.md`](./SECTOR-energy.md) | Essential | ACM + RDI | Network Code 2024/1366, IEC 62443, Wwke |
| [`SECTOR-manufacturing.md`](./SECTOR-manufacturing.md) | Important | RDI (TBC per AMvB) | CRA, MDR/IVDR, R155/R156 |
| [`SECTOR-public-administration.md`](./SECTOR-public-administration.md) | Essential | BZK + IBD + NCSC-NL | BIO, AVG, Woo, Wdo, eIDAS |
| [`SECTOR-transport.md`](./SECTOR-transport.md) | Essential | ILT (per mode) + Rijkswaterstaat | CER/Wwke, EASA Part-IS, TSI CCS/ERTMS, ISPS, IMO, R155/R156, IEC 62443 |
| [`SECTOR-banking-financial.md`](./SECTOR-banking-financial.md) | Essential | DNB + AFM | **DORA (lex specialis)**, PSD2/PSD3, MiFID II, EBA ICT Guidelines, SWIFT CSP |
| [`SECTOR-water.md`](./SECTOR-water.md) | Essential | ILT + ILT-watersectie | Drinkwaterwet, Waterwet, Wwke (CER) |
| [`SECTOR-food.md`](./SECTOR-food.md) | Important | NVWA + LNV + RDI | HACCP, EU 178/2002, Warenwet/RASFF, GFSI (BRCGS/IFS/FSSC 22000) |
| [`SECTOR-chemicals.md`](./SECTOR-chemicals.md) | Important | NVWA + ILT-chemie + Brzo+ | Seveso III/Brzo 2015, REACH, CLP, CSDDD, IEC 61511/62443 |
| [`SECTOR-postal-courier.md`](./SECTOR-postal-courier.md) | Important | ACM + RDI | Postwet 2009, GDPR, EU Customs UCC, DAC7 |
| [`SECTOR-waste.md`](./SECTOR-waste.md) | Important | ILT-handhaving + omgevingsdiensten + RDI | Wm, LAP3, EVOA, Brzo+ |
| [`SECTOR-research.md`](./SECTOR-research.md) | Important | RDI + OCW + SURFcert | GDPR (research carve-outs), EU 2021/821 dual-use, Horizon Europe, kennisveiligheid |
| [`SECTOR-ict-b2b-service-management.md`](./SECTOR-ict-b2b-service-management.md) | Essential | RDI | **CIR 2024/2690** (binding), customer SLA/MSA, ISO 27001, SOC 2 |
| [`SECTOR-space.md`](./SECTOR-space.md) | Essential | RDI + Agentschap Telecom + ESA security | Wet ruimtevaartactiviteiten, ITU, EU Space Reg 2021/696, dual-use, ITAR |

Coverage of NIS2 Annex I + II sectors is now complete. Edge cases not split into separate guides:
- **Public electronic communications networks/services** — typically handled within digital infrastructure ([`SECTOR-digital-infrastructure.md`](./SECTOR-digital-infrastructure.md)).
- **Wastewater** — folded into [`SECTOR-water.md`](./SECTOR-water.md).
- Sub-sectors with NL-specific transposition decisions (university designation, gemeente waste collection) are flagged in the relevant guide.

Contributions welcome for sub-sector deep-dives — see [`../CONTRIBUTING.md`](../CONTRIBUTING.md).

## Reading order

1. [`../README.md`](../README.md) — corpus overview + "About NIS2 in 60 seconds".
2. Pick the sector guide matching your entity.
3. [`../FAQ-compliance-officers.md`](../FAQ-compliance-officers.md) for cross-sector Q&A.
4. [`../CHECKLIST-CISO.md`](../CHECKLIST-CISO.md) for evidence checklist.
