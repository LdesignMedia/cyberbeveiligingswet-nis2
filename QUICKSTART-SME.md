# Quick Start: NIS2 / Cbw for SMEs

Plain-language guide for small and medium-sized businesses in the Netherlands trying to figure out what NIS2 / the Cyberbeveiligingswet (Cbw) means for them — without wading through 200 pages of EU directives.

> **Ground rule:** NIS2 generally only applies to **medium and large** entities (≥ 50 employees OR ≥ €10M annual turnover). Most SMEs are out of scope. **But there are exceptions** — read Step 1 carefully.

---

## Step 1 — Are you in scope? (10 minutes)

Three quick checks. Answer all three.

### Check A: Sector

Are you active in any of these sectors?

**Essential (high-stakes):**
- Energy (electricity, oil, gas, district heating, hydrogen)
- Transport (air, rail, water, road)
- Banking + financial market infrastructure
- Healthcare (hospitals, GPs above threshold, pharma)
- Drinking water + wastewater
- **Digital infrastructure** (DNS providers, TLD registries, cloud, datacentre, CDN, ISP, public e-comms, trust services)
- **B2B ICT service management** (managed service providers — MSP/MSSP)
- Public administration
- Space sector

**Important (broader):**
- Postal + courier
- Waste management
- Chemicals (manufacture, processing, distribution)
- Food (production, processing, distribution)
- Manufacturing (medical devices, electronics, machinery, motor vehicles)
- **Digital providers** (online marketplaces, online search engines, social networking platforms)
- Research

If your sector is **not** on this list → **you are out of scope**. Done.

### Check B: Size

Are you (any of):
- ≥ 50 employees, OR
- ≥ €10 million annual turnover, OR
- ≥ €10 million annual balance sheet?

If **no to all three** → check exceptions below.

### Check C: SME exceptions

Even if smaller, you are still in scope if you are:
- A **DNS provider** (excluding root servers)
- A **TLD registry**
- A **public electronic communications network** or **publicly available e-comms service**
- A **trust service provider** (eIDAS qualified or non-qualified)
- A **sole provider** of a critical service in the Netherlands
- A **public administration** entity
- A **critical entity** designated under the Wwke (CER regime)

If yes to any → in scope despite being small.

### Decision

| A: sector? | B: size? | C: exception? | Result |
|------------|----------|---------------|--------|
| No | — | — | **Out of scope** |
| Yes | Yes | — | **In scope** |
| Yes | No | No | **Out of scope** |
| Yes | No | Yes | **In scope (small but exception applies)** |

Paper trail tip: Document this answer with a dated note signed by the director. Saves a year of explaining later.

Cross-check via the official NL decision tree:
- [`nl-overheid-publicaties/md/doorverwijsboom-cyberbeveiligingswet.md`](./nl-overheid-publicaties/md/doorverwijsboom-cyberbeveiligingswet.md)
- [`ncsc-nl/md/www.ncsc.nl_cyberbeveiligingswet-nis2_flowchart-registratieplicht-nis2-entiteit.md`](./ncsc-nl/md/www.ncsc.nl_cyberbeveiligingswet-nis2_flowchart-registratieplicht-nis2-entiteit.md)

---

## Step 2 — If you're out of scope, but a customer of yours is in scope

This is the situation most SMEs are actually in.

### Why it matters

Your in-scope customer has a **supply-chain security obligation** (NIS2 art. 21(2)(d)). They will push security requirements down to you via:
- Procurement questionnaires
- Contractual security clauses (incident notification SLAs, audit rights, sub-processor approval)
- Right-to-audit or third-party attestation requirements

You won't get fined by NCSC-NL, but you can **lose the contract** if you don't meet your customer's flow-down requirements.

### Minimum prep (one afternoon's work)

- [ ] Be ready to fill in a **standard supplier security questionnaire** (CAIQ, SIG, or sector-specific equivalent).
- [ ] Have a one-page **information security policy** signed by the director.
- [ ] Know your **incident notification path** to your customer (contact + SLA).
- [ ] Have an **asset inventory** ([`templates/asset-inventaris-template.csv`](./templates/asset-inventaris-template.csv)).
- [ ] Have a **sub-processor / sub-supplier list** ([`templates/sub-verwerker-register-template.csv`](./templates/sub-verwerker-register-template.csv)).
- [ ] Have **MFA enabled** on all admin accounts and all SaaS.
- [ ] Have **backups** with a tested restore in the last 6 months.

That's the practical 80% of what you'll be asked.

---

## Step 3 — If you're in scope (small but with exception, or grew above threshold)

Don't panic. Use the 90-day starter path.

### Days 1–14: Confirm + register

- [ ] **Document the scope decision** (Step 1 outcome + reason for in-scope status).
- [ ] **Identify your tier** (essential vs important).
- [ ] **Identify your supervisor** (NCSC-NL for most; sector authority for some — see [`FAQ-compliance-officers.md`](./FAQ-compliance-officers.md) Q18).
- [ ] **Sign up to the NCSC-NL portal** for registration once it opens (post-Cbw entry-into-force).
- [ ] **Inform the management/director** in writing. Get formal acknowledgement. Schedule training.

### Days 15–30: Baseline assessment

Use the maatregelen tracker as a gap-analysis grid:
- [`templates/nis2-maatregelen-tracker-template.csv`](./templates/nis2-maatregelen-tracker-template.csv)

For each of the 10 mandatory areas (NIS2 art. 21(2)), ask:
1. Do we have a written policy?
2. Do we have a procedure?
3. Do we have evidence it actually runs?

Mark each as Red / Amber / Green. Don't pretend Greens that aren't there.

### Days 31–60: Quick wins

Most SMEs can knock out these in this window:
- [ ] **MFA everywhere** (start with admin + remote access + e-mail + finance SaaS).
- [ ] **Backup tested** (restore one critical system from backup; document).
- [ ] **Asset inventory** populated ([`templates/asset-inventaris-template.csv`](./templates/asset-inventaris-template.csv)).
- [ ] **Risk register** started ([`templates/risico-register-template.csv`](./templates/risico-register-template.csv) + [`templates/risico-register-handleiding.md`](./templates/risico-register-handleiding.md)).
- [ ] **Incident playbook** (one A4 with: who detects, who decides, who calls NCSC-NL, who calls customers, who does forensics).
- [ ] **Phishing simulation** run once.
- [ ] **Patch SLA** documented + applied (critical patches ≤ 7 days; high ≤ 30 days).
- [ ] **Sub-processor register** ([`templates/sub-verwerker-register-template.csv`](./templates/sub-verwerker-register-template.csv)) — list every SaaS, hosting provider, and major IT vendor.

### Days 61–90: Reporting readiness + board sign-off

- [ ] **Test the NCSC-NL reporting channel** (mock incident, dry-run the 24h/72h/1mo templates).
- [ ] **Train the director** (1-2 hour session is enough for many SMEs to start).
- [ ] **Director formally approves** the security measures (written, dated).
- [ ] **Schedule annual review** + put it in the calendar.

After 90 days you have a defensible baseline. Continuous improvement from there.

---

## Step 4 — Common SME shortcuts that work

- **Use what you already have.** Microsoft 365 Business Premium, Google Workspace Business Plus, etc., already cover MFA, conditional access, basic DLP, encrypted backups, mobile device management. You may not need new tooling — just enable + configure correctly.
- **Outsource the SOC.** A small MSSP retainer beats hiring a 24/7 team.
- **Reuse ISO 27001-style controls if you have them.** Roughly 70-80% mapping to NIS2.
- **Reuse GDPR work.** Your art. 30 record of processing activities is a halfway-decent asset inventory; your DPIAs feed into your risk register; your data breach process is the skeleton of your incident response.
- **Don't write encyclopedias.** A one-pager per policy area is fine for an SME. The Cbw asks for "appropriate and proportionate" — proportionate to *your* size, not to a Fortune 500.

---

## Step 5 — Common SME shortcuts that don't work

- **"We have ISO 27001 so we're done."** No. ISO 27001 doesn't cover NIS2 art. 23 incident reporting, art. 27 registration, or art. 20 board training.
- **"We use AWS, Azure, GCP — they take care of security."** No. Cloud is shared responsibility. The provider secures the cloud; you secure what you put *in* the cloud.
- **"Our IT vendor handles it."** Maybe — check the contract. Most IT vendors deliver on availability + patching + backup but don't take liability for compliance, incident reporting, or registration.
- **"We don't have personal data so GDPR is irrelevant — same logic for NIS2."** No. NIS2 covers all incidents affecting service availability, not just data. Even a customer-facing portal outage can trigger reporting.
- **"We'll wait until we get fined to do something."** Fines for essential entities cap at €10M / 2% global turnover. Even "small" enforcement actions can wipe a year of margin.

---

## Quick links

- Full Q&A: [`FAQ-compliance-officers.md`](./FAQ-compliance-officers.md)
- CISO checklist (deeper than this guide): [`CHECKLIST-CISO.md`](./CHECKLIST-CISO.md)
- Glossary of terms: [`GLOSSARY.md`](./GLOSSARY.md)
- Timeline + key dates: [`TIMELINE.md`](./TIMELINE.md)
- NCSC.nl FAQ (official, Dutch): [`ncsc-nl/md/www.ncsc.nl_cyberbeveiligingswet-nis2_faq-cyberbeveiligingswet-nis2.md`](./ncsc-nl/md/www.ncsc.nl_cyberbeveiligingswet-nis2_faq-cyberbeveiligingswet-nis2.md)
- Digital Trust Center NIS2 explainer: [`ncsc-nl/md/www.digitaltrustcenter.nl_wat-is-de-nis2-richtlijn.md`](./ncsc-nl/md/www.digitaltrustcenter.nl_wat-is-de-nis2-richtlijn.md)
- Compliance templates: [`templates/`](./templates/)
- Light micro-LMS for staff training: [`NIS2-light-micro-LMS.md`](./NIS2-light-micro-LMS.md)

---

> **One last reminder:** This guide is a starting point, not legal advice. The Cbw is not yet in force. Verify everything against the live NCSC-NL guidance and the final adopted Cyberbeveiligingsbesluit before betting the company on a procedural decision.
