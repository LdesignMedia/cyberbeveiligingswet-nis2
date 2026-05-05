# NIS2 ICT B2B Service Management Sector Guide

**Scope:** Managed Service Providers (MSPs) delivering outsourced IT infrastructure, system administration, and network management to multiple business customers; Managed Security Service Providers (MSSPs) delivering outsourced security monitoring, incident response, and threat intelligence.

**Audience:** MSP/MSSP executives, compliance officers, CISOs, service delivery managers, incident response teams, sales and contract management.

---

## Are you in scope?

Your organization falls under NIS2 ICT Service Management (Annex I.8) if you operate in one or more of these areas:

| Service Type | Scope indicator |
|--------------|-----------------|
| **Managed Service Provider (MSP)** | Manages IT infrastructure (servers, networks, workstations, cloud integration) for ≥ 3 business customers; operates on behalf of customers. **Essential** if customers are SMEs or larger. |
| **Managed Security Service Provider (MSSP)** | Operates Security Operations Centre (SOC), SIEM, managed detection and response (MDR), or incident response services for business customers. Usually **Essential**. |

**SME Exception:** If you are the sole provider of critical IT services in your Member State (rare), you may remain in scope even if < 50 FTE / < €10M revenue.

**Tier:** Most MSPs/MSSPs are **Essential** due to customer base and scale of impact.

---

## Why this sector is special

MSPs and MSSPs are uniquely subject to **Regulation (EU) 2024/2690 (CIR 2024/2690)** alongside the NIS2 Directive. CIR is directly applicable and does not require NL Cbw transposition; it binds you **now** (timeline reference: [`TIMELINE.md`](../TIMELINE.md)).

### Key differences from NIS2 baseline

- **Binding technical specificity:** CIR specifies 13 thematic areas with concrete measures (governance, risk management, incident handling, BCM/DR, supply-chain, acquisition/dev/maintenance, effectiveness, hygiene, cryptography, access control, network monitoring, resilience, physical security).
- **ENISA Technical Guidance:** 170-page reference document is the de-facto evidence standard for CIR compliance audits and customer audits.
- **Transitive risk:** Your customers are downstream of your security controls. Compromise of your platform cascades to all tenant customers (e.g. Kaseya VSA ransomware class incident = thousands of encrypted customer environments).
- **Tenant isolation:** CIR requires provable separation per customer (distinct management planes, separate identities, separate encryption keys, no cross-tenant data leakage).
- **Supply-chain dependencies:** Your RMM tools (ConnectWise, NinjaOne, N-able, Datto, Atera), PSA platforms (Autotask, Connectwise Manage), monitoring stacks (SolarWinds, Nagios, Zabbix), and ticketing systems (Jira, Freshdesk) are attack vectors affecting all customers.
- **Stricter incident reporting:** Customer notification SLAs typically tighter than NIS2 24h/72h baseline; significant-incident thresholds defined in CIR (% of customers affected × duration × service type).

---

## NL competent authority

**RDI (Rijksinspectie Digitale Infrastructuur)** — the NL regulator for digital infrastructure entities (including MSPs/MSSPs) under NIS2 art. 26.

**NCSC-NL** — serves as the national CSIRT for incident reporting (NIS2 art. 23).

**Supervisory model:** RDI conducts proactive supervision (audits, information requests, security assessments). Essential MSPs/MSSPs have no opt-out.

---

## CIR 2024/2690: The 13 thematic areas

Reference: [`eu-implementing-regulation/md/cir-2024-2690-NL-html.md`](../eu-implementing-regulation/md/cir-2024-2690-NL-html.md)

Implementation evidence reference: [`enisa-guidance/md/ENISA_Technical_Implementation_Guidance_v1.0.md`](../enisa-guidance/md/ENISA_Technical_Implementation_Guidance_v1.0.md)

| # | Thematic area | MSP/MSSP-specific emphasis |
|---|---------------|---------------------------|
| 1 | **Governance & risk management** | Board risk approval, customer risk register (transitive risk passed to customers), ISMS covering multi-tenancy. |
| 2 | **Incident handling & crisis management** | Detection, response, customer notification SLA (≤ 24h typical), regulatory coordination with NCSC-NL + affected MS CSIRTs. |
| 3 | **Business continuity & disaster recovery** | Customer-facing services RTO/RPO, backup integrity (immutable snapshots vs ransomware), failover drills, communication protocol to all affected tenants. |
| 4 | **Supply-chain & third-party security** | RMM, PSA, SIEM, monitoring tools risk assessment; vendor portal access governance; transitive risk cascading to customers. |
| 5 | **Security in acquisition, development, maintenance** | Multi-tenant platform hardening, secure SDLC, code review, vulnerability disclosure, patch SLA per CIR, dependency scanning. |
| 6 | **Assessment of effectiveness** | Internal/external audits (inclusive of multi-tenant controls), pen-testing (cross-tenant breach attempts), KPI dashboards, customer audit readiness. |
| 7 | **Cybersecurity training & awareness** | All-staff training ≥ 95% completion, SOC analyst training (incident response playbooks), role-specific phishing drills. |
| 8 | **Basic cyber hygiene** | Password policy, endpoint hardening (MFA on RMM admin, least-privilege agents), network segmentation (customer planes isolated), logging (RMM actions logged). |
| 9 | **Cryptography & encryption** | Key inventory + rotation, per-customer key derivation, TLS for all remote-management channels, backup encryption. |
| 10 | **Access control & identity** | MFA on all admin portals + RMM tools, PAM for privileged RMM accounts, least-privilege (customer-scoped service accounts), access reviews (quarterly for privileged), segregated corporate vs customer identity providers. |
| 11 | **Network & system monitoring** | SIEM/MDR for platform + customer workloads, detection tuning (cross-tenant attack patterns), anomaly detection, ≥ 180-day log retention (CIR-specified). |
| 12 | **Resilience & redundancy** | Geographic distribution of customer data, multi-AZ for critical services, load balancing, automated failover, service-availability % SLA per customer. |
| 13 | **Physical + environmental security** | Datacentre access control (if operating own DC), surveillance, fire suppression; segregation of corporate + customer identity infrastructure. |

---

## Top sector-specific risks

**Ransomware cascade via RMM tool compromise:**
- Single RMM compromise (Kaseya VSA class) = lateral movement to all managed customer environments.
- **Mitigation:** MFA on RMM admin, least-privilege RMM agents (read-only except scheduled maintenance), immutable backup snapshots, per-customer encryption keys.

**Credential theft from RMM/PSA/SIEM platforms:**
- ConnectWise ScreenConnect, NinjaOne, N-able, Datto, Atera, AzureAD sync passwords stored/cached in PSA.
- **Mitigation:** Eliminate credential caching, use workload identity + short-lived tokens, audit API access logs, vendor security updates.

**Tenant-isolation failures:**
- Network misconfiguration (customer A routes to customer B VLAN), storage cross-contamination (S3 bucket misconfiguration), identity provider mix-up (customer A's user gets customer B's permissions).
- **Mitigation:** Network policies + testing per customer, separate Kubernetes namespaces + RBAC per tenant, identity provider tenant isolation audits.

**Supply-chain via vendor management tooling:**
- Vulnerable PSA/RMM/monitoring platform (zero-day in SolarWinds, Nagios, Zabbix); sub-processor breach (cloud hosting of your monitoring stack compromised).
- **Mitigation:** Vendor risk assessment, security patch SLAs, sub-processor vetting, immutable audit logs of platform access.

**Vendor-portal SSO compromise (Okta-class):**
- Single compromise of your Okta/AzureAD for customer partner portals = access to all customers' provisioning/support systems.
- **Mitigation:** MFA + IP allowlist on vendor-facing IAM, step-up auth for sensitive ops (deprovisioning, data export), SCIM API audit trails.

**MSSP SOC analyst access abuse:**
- Rogue SOC analyst accesses customer environment without authorization (lateral movement, credential theft, espionage).
- **Mitigation:** PAM for MSSP analysts' customer access, session recording, access approval workflow, anomaly detection on analyst actions.

**Customer-deployed agent compromise:**
- RMM agent or EDR agent running on customer endpoint contains backdoor / supply-chain vulnerability.
- **Mitigation:** Agent code signing + integrity verification, agent update SLA (patches within 7 days of vendor release), customer notification on agent updates.

**Ticketing-platform compromise leaking customer secrets:**
- Support ticket system (Jira, Freshdesk, Zendesk) breach exposes stored customer credentials, API keys, configuration screenshots.
- **Mitigation:** Redaction policies (auto-mask API keys, passwords in ticket templates), role-based ticket visibility (support staff only see relevant customer tickets), encryption at rest, audit trail of data access.

---

## 12–15 quick-win checklist

- [ ] **Tenant isolation evidence:** Separate management planes per customer, separate identity provider identities, separate encryption keys per customer; documented + tested quarterly.
- [ ] **RMM tool hardening:** MFA on RMM admin portal, least-privilege RMM service accounts (customer-scoped), read-only RMM agents except during scheduled maintenance, MFA on RMM client deprovisioning.
- [ ] **Supply-chain risk register:** Inventory of all upstream vendors (RMM, PSA, SIEM, monitoring, cloud hosting, DNS, ticketing); transitive risk score per vendor; customer communication on high-risk vendors.
- [ ] **Vendor-portal MFA + IP allowlist:** MFA on all customer-facing identity provider (Okta, AzureAD) logins; IP allowlist per customer (restrict to customer corporate IP); step-up auth on deprovisioning/data export.
- [ ] **Customer-facing transparency dashboard:** Real-time security posture (patch status, MFA adoption, endpoint detection), threat alerts, incident status, SLA compliance (uptime % + response time).
- [ ] **Breach-notification SLA in MSA:** Defined SLA tighter than NIS2 24h baseline (typically ≤ 24h to customer); includes notification to all affected tenants simultaneously.
- [ ] **CIR thematic-area mapping evidence:** Documented for all 13 areas; evidence rows cross-referenced to ENISA Tech Guidance per measure.
- [ ] **ENISA Technical Guidance evidence matrix:** For each CIR measure, record policy/procedure + implementation proof + effectiveness metric; audit-ready format.
- [ ] **ISO 27001 + SOC 2 Type II:** Multi-tenant controls explicitly covered; annual audits; customer audit-readiness (AQ/questionnaire responses pre-staged).
- [ ] **BCP including customer-facing services:** RTO/RPO per service tier, failover automation tested monthly, customer notification protocol, recovery procedures documented + drilled.
- [ ] **Segregation of customer + corporate identity providers:** Separate Okta/AzureAD tenant or namespace per environment; no cross-access (corporate admin ≠ customer tenant admin).
- [ ] **MSSP SOC analyst access governance:** PAM system for analyst terminal access to customer environments, session recording, approval workflow, anomaly detection on analyst actions.
- [ ] **Incident-reporting dry-run (tabletop):** Scenario: ransomware hits 15% of customer fleet, affects 8 MS. Walk through NCSC-NL notification (24h), affected MS CSIRT notification, customer SLA compliance (≤ 24h per MSA), CIR significant-incident threshold check.
- [ ] **Customer agent update communication:** Channels + timelines for notifying customers of RMM/EDR/monitoring agent updates; security updates SLA ≤ 7 days.
- [ ] **Encryption keys in HSM:** Sensitive keys (backup encryption, per-customer key derivation seeds, platform master keys) stored in FIPS 140-2 Level 2+ hardware; access audit trail.

---

## Incident-reporting nuances

**CIR-specific significant-incident thresholds:**
- **Customer impact:** ≥ X% of your managed customer fleet affected (e.g. 10%), AND service unavailability ≥ Y hours (e.g. 4 hours).
- **Duration:** Incident duration from detection to full recovery; customer outage duration must be quantified.
- **Root cause:** Malicious (cyberattack) vs accidental (misconfiguration, vendor failure); thresholds may differ.

Reference CIR-specific thresholds in [`eu-implementing-regulation/md/cir-2024-2690-NL-html.md`](../eu-implementing-regulation/md/cir-2024-2690-NL-html.md) for your service type.

**Customer notification SLAs:**
- NIS2 baseline: "without undue delay" (typically 24–72 hours for non-essential entities).
- **MSP/MSSP reality:** Contractually agreed SLA typically ≤ 24 hours to affected customers (sometimes ≤ 4 hours for critical services).
- **Reason:** Your customers must notify their own customers/regulators within their SLA windows; notification delay cascades downstream.
- **Broadcast requirement:** All affected tenant customers must be notified simultaneously; partial disclosure creates compliance liability.

**Cross-border coordination:**
- MSP/MSSP customers span EU Member States.
- **Report to NCSC-NL and all affected MS CSIRTs** if significant incident.
- **Timing:** Simultaneous notification to NCSC-NL + affected MS CSIRTs within CIR timeline (typically 24h of incident detection for significant incidents).

---

## Mapping to corpus

| Resource | Purpose |
|----------|---------|
| [`eu-implementing-regulation/md/cir-2024-2690-NL-html.md`](../eu-implementing-regulation/md/cir-2024-2690-NL-html.md) | Full CIR 2024/2690 text in Dutch + English. Thematic areas 1–13 + MSP/MSSP-specific obligations. |
| [`enisa-guidance/md/ENISA_Technical_Implementation_Guidance_v1.0.md`](../enisa-guidance/md/ENISA_Technical_Implementation_Guidance_v1.0.md) | 170-page ENISA guidance. Maps each CIR measure to concrete evidence (policy, procedure, implementation proof, audit effectiveness). Use as audit-prep reference. |
| [`eu-directives/md/nis2-2022-2555-NL.md`](../eu-directives/md/nis2-2022-2555-NL.md) | NIS2 Directive Annex I (digital infrastructure definition, including MSP/MSSP). Background on scope + tier classification. |
| [`SECTOR-digital-infrastructure.md`](./SECTOR-digital-infrastructure.md) | Sister sector guide (DNS, cloud, datacentre, CDN, trust services). Same CIR regime; different attack surface. |
| [`CHECKLIST-CISO.md`](../CHECKLIST-CISO.md) | Section 3 (CIR 2024/2690 — digital infrastructure + MSP/MSSP items). Evidence checklist + quick wins. |
| [`FAQ-compliance-officers.md`](../FAQ-compliance-officers.md) | Q9, Q10 (CIR + supply-chain + multi-tenancy specifics). Q18 (RDI authority). |

---

## See also

- [`README.md`](../README.md) — Corpus overview + "About NIS2 in 60 seconds."
- [`GLOSSARY.md`](../GLOSSARY.md) — Terminology (MSP, MSSP, RMM, PSA, SOC, SIEM, MDR, tenant isolation, etc.).
- [`TIMELINE.md`](../TIMELINE.md) — CIR entry-into-force date, NL Cbw milestones.
- [`CHECKLIST-CISO.md`](../CHECKLIST-CISO.md) — Full readiness checklist with CIR + MSP/MSSP items.
- [`FAQ-compliance-officers.md`](../FAQ-compliance-officers.md) — Practical Q&A covering CIR + multi-tenancy + RDI supervision.
- [`templates/`](../templates/) — CSV templates for supplier inventory, incident register, risk register, customer SLA register.

---

> **Disclaimer:** This guide is not legal advice. CIR 2024/2690 is binding; NL Cbw and Cyberbeveiligingsbesluit entry-into-force expected ~Q2 2026. Verify against live EU and NCSC-NL sources before board-level decisions. MSP/MSSP contractual obligations (MSAs, SLAs) are not NIS2 compliance substitutes; both must be satisfied.
