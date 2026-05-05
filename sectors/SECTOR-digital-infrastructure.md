# NIS2 Digital Infrastructure Sector Guide

**Scope:** DNS service providers, TLD name registries, cloud computing, datacentre operators, CDN providers, public electronic communications networks/services, trust service providers (eIDAS), managed service providers (MSP), managed security service providers (MSSP).

**Audience:** Infrastructure operators, compliance officers, CISOs, incident response teams, procurement teams managing digital infrastructure services.

---

## Are you in scope?

Your organization falls under NIS2 Digital Infrastructure (Annex I point 8) if you operate in one or more of these areas:

| Sub-sector | Scope indicator |
|-----------|-----------------|
| **DNS service provider** | Operates authoritative or recursive DNS services. **Exception:** root server operators excluded; SMEs < 50 FTE excluded unless sole DNS provider in MS. |
| **TLD name registry** | Operates top-level domain registry. Subject to NIS2 regardless of size. |
| **Cloud computing service** | IaaS, PaaS, SaaS provider serving EU customers. Infrastructure provider (storage, compute). |
| **Datacentre operator** | Operates physical infrastructure hosting customer systems. Usually Essential if ≥ 50 FTE or € 10M revenue. |
| **CDN provider** | Content delivery network. Essential if ≥ 50 FTE / € 10M. |
| **Public e-comms network** | Operates network infrastructure (fiber, wireless, VPN) for public use. Usually Essential. |
| **Publicly available e-comms service** | VoIP, messaging, video calls over public networks. Tier depends on size/scale. |
| **Trust service provider (eIDAS)** | Digital certificates, qualified signatures, timestamps, seals. Subject to NIS2 + eIDAS-specific rules. |
| **Managed Service Provider (MSP)** | Operates customer IT infrastructure on behalf of 3+ customers. Essential if customers are SMEs or larger. |
| **Managed Security Service Provider (MSSP)** | Operates SOC, SIEM, or security services for customers. Usually Essential. |

**SME Exception:** If you are a sole provider of a critical service in your Member State, you remain in scope even if < 50 FTE or < € 10M revenue (e.g. national DNS secondary provider, regional CDN).

**Tier:** Most digital infrastructure is **Essential**. A few Important-tier entities exist in digital provider categories (online marketplaces, search engines, social networks), but infrastructure operators themselves are Essential.

---

## Why this sector is special

Digital infrastructure is uniquely subject to **Regulation (EU) 2024/2690 (CIR 2024/2690)**, which is **directly applicable** and does not require NL Cbw transposition. CIR binds digital infrastructure entities **now**, not on Cbw entry-into-force (~July 2026).

### Key differences from NIS2 baseline

- **Binding technical specificity:** CIR 2024/2690 specifies 13 thematic areas with concrete measures (not just "appropriate and proportionate").
- **ENISA Technical Guidance:** 170-page ENISA_Technical_Implementation_Guidance_v1.0.md is the de-facto evidence standard for CIR compliance audits.
- **Significant-incident thresholds:** Service unavailability %, duration thresholds, user impact metrics defined in CIR (not left to interpretation).
- **Stricter incident reporting:** Customer notification SLAs may exceed NIS2's 24h/72h/1mo timeline for services affecting third parties.
- **Supply-chain dependencies:** CIR explicitly covers upstream component suppliers, package dependencies, build-chain integrity (Log4Shell-class risks).
- **Cross-border coordination:** Services span MS borders; incidents must notify relevant CSIRTs across affected states.

---

## NL competent authority

**RDI (Rijksinspectie Digitale Infrastructuur)** — the NL regulator for digital infrastructure entities under NIS2 art. 26.

**NCSC-NL** — serves as the national CSIRT for incident reporting (NIS2 art. 23).

**Supervisory model:** RDI conducts **proactive supervision** (audits, on-site inspections, security scans, information requests). Essential entities have no opt-out.

---

## CIR 2024/2690: The 13 thematic areas

Reference: [`eu-implementing-regulation/md/cir-2024-2690-NL-html.md`](../eu-implementing-regulation/md/cir-2024-2690-NL-html.md)

Implementation evidence reference: [`enisa-guidance/md/ENISA_Technical_Implementation_Guidance_v1.0.md`](../enisa-guidance/md/ENISA_Technical_Implementation_Guidance_v1.0.md)

| # | Thematic area | Scope |
|---|---------------|-------|
| 1 | **Governance & risk management** | Board oversight, risk inventory, ISMS, supply-chain governance, formal risk approval. |
| 2 | **Incident handling & crisis management** | Detection, response, recovery, public comms, regulatory coordination. |
| 3 | **Business continuity & disaster recovery** | RTO/RPO targets, backup + restore testing, failover drills, crisis-management team. |
| 4 | **Supply-chain & third-party security** | Supplier risk assessment, contractual security clauses, sub-processor vetting, audit rights. |
| 5 | **Security in acquisition, development, maintenance** | Secure SDLC, code review, vulnerability disclosure, patch SLAs, dependency scanning. |
| 6 | **Assessment of effectiveness** | Internal/external audits, pen-testing, KPI dashboards, lessons-learned register. |
| 7 | **Cybersecurity training & awareness** | All-staff training ≥ 95% completion, role-specific training, phishing drills. |
| 8 | **Basic cyber hygiene** | Password policy, endpoint hardening, network segmentation, logging. |
| 9 | **Cryptography & encryption** | Approved algorithm list, key inventory + rotation, TLS/IPSec, at-rest encryption. |
| 10 | **Access control & identity** | MFA, PAM, least-privilege, access reviews (quarterly for privileged), conditional access policies. |
| 11 | **Network & system monitoring** | Detection systems, SIEM, anomaly detection, retention ≥ 180 days (or CIR-specified), alerting. |
| 12 | **Resilience & redundancy** | Geographic distribution, multi-AZ, load balancing, failover automation, service-availability % targets. |
| 13 | **Physical + environmental security** | Datacentre access control, surveillance, fire suppression, environmental monitoring, change logs. |

Each area has multiple sub-measures in CIR. Compliance evidence is mapped 1:1 in ENISA Tech Guidance rows.

---

## Top sector-specific risks

**DDoS / service disruption:**
- Volumetric attacks on DNS, CDN, ISP backhaul; state-sponsored campaigns.
- **Mitigation:** BGP flowspec, upstream scrubbing centers, rate-limiting, geographic anycast distribution.

**BGP hijacking & routing attacks:**
- Prefix hijack, AS hijack, route leaks affecting DNS/ISP services.
- **Mitigation:** RPKI (Resource Public Key Infrastructure), origin validation, monitoring tools (Krill, ROAchecker).

**DNS cache poisoning & DNS amplification:**
- Poisoned records, zone transfer hijack, reflective amplification attacks.
- **Mitigation:** DNSSEC, query-rate limiting, access control on zone transfers, response rate limiting (RRL).

**Multi-tenant isolation failures:**
- Kubernetes RBAC misconfiguration, container escape, storage cross-contamination.
- **Mitigation:** Network policies, namespace isolation, pod security policies, runtime monitoring.

**Supply-chain via dependencies:**
- Log4Shell-class vulnerabilities in third-party libraries, typosquatting, compromised npm/PyPI packages.
- **Mitigation:** SCA (software composition analysis), dependency pinning, build-artifact signing, supplier vetting.

**Tier-2 sub-processor opacity:**
- Hidden upstream data processors (e.g. cloud tenant using another cloud), lack of visibility.
- **Mitigation:** Mandatory sub-processor disclosure, audit rights contractually secured, inventory maintained.

**Certificate mis-issuance (trust services):**
- Compromised CA key, ACME validation bypass, fraudulent certificate issuance.
- **Mitigation:** Certificate Transparency monitoring (CT logs), key escrow + multi-person control, incident notification to browsers.

**Ransomware against MSP customer fleets:**
- Lateral movement from one customer's environment to another via shared infrastructure.
- **Mitigation:** Encryption of backups, immutable snapshots, per-customer key derivation, incident response SLA to all affected customers.

**Kubernetes / IAM misconfigurations:**
- RBAC over-permissions, service account token exposure, overly broad IAM roles.
- **Mitigation:** Least-privilege role templates, automated RBAC audit, workload identity (IRSA, Workload Identity Federation).

---

## Quick-win checklist

- [ ] **MFA on all admin/customer portals** — FIDO2 or passkeys for high-value identities.
- [ ] **DNSSEC enabled** where applicable; DNSSEC validation enforced for downstream lookups.
- [ ] **BGP RPKI** — Route origin validation enabled on all customer/transit routes; Krill or similar for ROA issuance.
- [ ] **Segregation of customer planes** — Network isolation (VLANs, VPCs), encryption between planes, no cross-plane data leakage.
- [ ] **Hardened build chain** — Code signing, artifact image scanning, dependency pinning, SCA (Snyk, Sonatype).
- [ ] **Certificate Transparency monitoring** — Subscription to CT logs for your domain(s); alerts on unexpected certificates.
- [ ] **Automated backup + restore drills** — RTO/RPO defined; monthly restore test (not just backup verify).
- [ ] **Incident-reporting dry-run** — Tabletop exercise hitting both NCSC-NL and downstream-customer SLAs (24h/72h compliance check).
- [ ] **Supplier risk assessment** — Completed for upstream colo, transit, DNS, cloud, managed security services; documented tiers + SLAs.
- [ ] **Vulnerability disclosure policy** — security.txt, bug-bounty program, responsible disclosure timeline (≤ 90 days for public disclosure).
- [ ] **Customer-facing trust center** — Public page with certifications (ISO 27001, SOC 2, pen-test summary), incident-response contacts.
- [ ] **Network segmentation audit** — Production, management, customer planes isolated; east-west traffic policies logged.
- [ ] **Breach of customer data — notification SLA documented** — Typically stricter than NIS2 72h (e.g. 24h for infrastructure providers).
- [ ] **Encryption keys in HSM** — Sensitive keys stored in FIPS 140-2 Level 2+ hardware.
- [ ] **24/7 SOC or MSSP contract** — Incident detection + response escalation path; response SLA ≤ 2h for critical.

---

## Incident-reporting nuances

**CIR-specific significant-incident thresholds:**
- Service **unavailability ≥ X%** for ≥ Y hours (e.g. 10% × 4 hours, or 50% × 1 hour, depending on service type).
- **User impact:** Number of downstream customers/users affected (quantified in CIR per service type).
- **Root cause:** Malicious vs accidental (incident thresholds may differ).

Reference CIR-specific thresholds in [`eu-implementing-regulation/md/cir-2024-2690-NL-html.md`](../eu-implementing-regulation/md/cir-2024-2690-NL-html.md) for your service type.

**Customer notification SLAs:**
- NIS2 baseline: "without undue delay" (typically interpreted as 24–72 hours for non-essential entities).
- Digital infrastructure: Often **≤ 24 hours** contractually agreed (especially for DNS, cloud, CDN).
- **Reason:** Downstream customers depend on your infrastructure; they must notify their own customers/regulators within their SLA windows.

**Cross-border coordination:**
- Digital infrastructure services span EU Member States.
- **Report to NCSC-NL and affected MS CSIRTs** if service outage affects citizens/entities in other MS.
- Reference Cooperation Group guidance on cross-border incident coordination (not yet finalized at corpus snapshot date).

---

## Mapping to corpus

| Resource | Purpose |
|----------|---------|
| [`eu-implementing-regulation/md/cir-2024-2690-NL-html.md`](../eu-implementing-regulation/md/cir-2024-2690-NL-html.md) | Full CIR 2024/2690 text in Dutch + English (HTML-extracted). Thematic areas 1–13 + definitions. |
| [`enisa-guidance/md/ENISA_Technical_Implementation_Guidance_v1.0.md`](../enisa-guidance/md/ENISA_Technical_Implementation_Guidance_v1.0.md) | 170-page ENISA guidance. Maps each CIR measure to concrete evidence (policy, procedure, implementation proof, effectiveness metrics). Use as audit-prep reference. |
| [`eu-directives/md/nis2-2022-2555-NL.md`](../eu-directives/md/nis2-2022-2555-NL.md) | NIS2 Directive Annex I (digital infrastructure definition). Background on sector scope, tier classification. |
| [`CHECKLIST-CISO.md`](../CHECKLIST-CISO.md) | Section 3 (CIR 2024/2690 — digital infrastructure only). 🛠 items specific to CIR; evidence index. |
| [`FAQ-compliance-officers.md`](../FAQ-compliance-officers.md) | Q9, Q10 (CIR + supply-chain specifics). Q18 (RDI as NL authority). |

---

## See also

- [`README.md`](../README.md) — Corpus overview + "About NIS2 in 60 seconds."
- [`GLOSSARY.md`](../GLOSSARY.md) — Terminology (DNS, RPKI, BGP, MSP, MSSP, DNSSEC, etc.).
- [`TIMELINE.md`](../TIMELINE.md) — CIR entry-into-force date, NL Cbw milestones.
- [`CHECKLIST-CISO.md`](../CHECKLIST-CISO.md) — Full readiness checklist with CIR 🛠 items.
- [`FAQ-compliance-officers.md`](../FAQ-compliance-officers.md) — Practical Q&A covering CIR + RDI supervision.
- [`templates/`](../templates/) — CSV templates for supplier inventory, incident register, risk register.

---

> **Disclaimer:** This guide is not legal advice. CIR 2024/2690 is binding; NL Cbw and Cyberbeveiligingsbesluit entry-into-force expected ~Q2 2026. Verify against live EU and NCSC-NL sources before board-level decisions.
