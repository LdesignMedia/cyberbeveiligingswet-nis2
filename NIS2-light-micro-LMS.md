# NIS2-light Checklist — Micro LMS-leverancier

Praktische baseline voor micro-onderneming (<10 FTE, <€2M) die LMS-software levert aan tussenleveranciers van zorg/overheid. **Niet juridisch verplicht** onder Cbw/NIS2 (uit scope), maar minimaal noodzakelijk om contracteisen van NIS2-plichtige klanten te kunnen aantonen.

Doelstelling: **klant kan jullie aantonen als veilige schakel in de keten** (NIS2 art. 21 lid 2 sub d — supply chain security).

Schaal proportioneel naar 5 FTE / €500K. Geen ISO-certificering nodig. Wel: documenteer + tonen op aanvraag.

---

## 1. Governance & beleid

- [ ] **Security policy** — 1-2 pagina's, ondertekend door directie. Scope, verantwoordelijke, review-cyclus (jaarlijks).
- [ ] **Verantwoordelijke aanwijzen** — security officer rol (kan combinatie met CTO/lead dev).
- [ ] **Security onderdeel directieoverleg** — minimaal kwartaal-agendapunt + notulen.
- [ ] **Acceptable use policy** — wat mogen medewerkers met devices, wachtwoorden, USB, externe accounts.

## 2. Risicobeheer

- [ ] **Risico-register** — top 10 risico's (datalek klantdata, ransomware, supply chain, key persons, etc). Excel/Notion volstaat.
- [ ] **Jaarlijkse herziening** — directie tekent af.
- [ ] **Threat modeling per release** — STRIDE light op nieuwe features die data raken.

## 3. Asset management

- [ ] **Asset-inventaris** — laptops, servers, cloud-accounts, domeinen, SaaS-tools, repo's. CSV met eigenaar + criticaliteit.
- [ ] **Data-classificatie** — minimaal 3 niveaus (publiek / intern / vertrouwelijk-klantdata).
- [ ] **SBOM per release** — Software Bill of Materials. CycloneDX of SPDX, automatisch via build (npm/pip/maven plugin).

## 4. Toegangsbeheer

- [ ] **MFA verplicht** — alle admin-accounts (cloud, code-repo, CI/CD, productie-DB, e-mail). TOTP of hardware key.
- [ ] **SSO** waar mogelijk — Google Workspace / Microsoft 365 als IdP.
- [ ] **Least privilege** — geen permanente admin-rechten op productie. JIT/break-glass account.
- [ ] **Offboarding-checklist** — toegangen intrekken binnen 24u na uitdiensttreding.
- [ ] **Periodieke access review** — halfjaarlijks alle accounts + rechten doorlopen.

## 5. Secure development (SDLC)

- [ ] **Code review verplicht** — geen merge to main zonder review (PR + 1 approver).
- [ ] **Dependency scanning** — Dependabot / Renovate / Snyk in CI. Critical CVE = blokkerende build.
- [ ] **SAST** — GitHub CodeQL of Semgrep in CI op elke PR.
- [ ] **Secrets scanning** — gitleaks of GitHub secret scanning aan.
- [ ] **OWASP ASVS Level 1** — als minimale norm voor LMS-features.
- [ ] **Security test pre-release** — handmatige check op auth, authz, IDOR, XSS bij major releases.
- [ ] **Pentest 1x/jaar** — externe partij. Klanten zorg/overheid eisen rapport.

## 6. Operations & infrastructuur

- [ ] **Patch management** — kritieke OS/runtime patches binnen 7 dagen, hoog binnen 30 dagen.
- [ ] **Backups** — dagelijks, off-site, encrypted. **Test restore minimaal 2x/jaar** (anders geen waarde).
- [ ] **Logging** — minstens auth-logs, admin-acties, productie-DB access. Bewaartermijn 6-12 maanden.
- [ ] **Monitoring** — uptime + security alerts (impossible travel, brute force, error rate spikes).
- [ ] **Encryption** — TLS 1.2+ in transit, AES-256 at rest, klantdata-velden waar passend.

## 7. Incident response

- [ ] **Incident response plan** — 1 pagina. Wie doet wat, contactlijst, communicatiesjabloon klant.
- [ ] **Detectie + classificatie** — wat is een security incident vs. ops-issue. Severity-ladder.
- [ ] **Meldketen richting klant** — afgesproken SLA (bv. 24u early warning, 72u incident notification — spiegel NIS2 art. 23).
- [ ] **Post-mortem template** — wortel-oorzaak, tijdlijn, lessons learned. Deelbaar met klant.
- [ ] **Tabletop exercise** — 1x/jaar fictieve breach doorlopen met team.

## 8. Business continuity

- [ ] **BCP/DRP** — wat als productie 24u down? Key person ziek? Cloud-account gehackt?
- [ ] **RTO/RPO gedefinieerd** per service. Documenteer richting klant.
- [ ] **DR-test** — minstens jaarlijks restore-procedure draaien.

## 9. Supply chain (jullie eigen leveranciers)

- [ ] **Sub-verwerker register** — alle SaaS-tools die klantdata raken (DPA + locatie).
- [ ] **Vendor security review** — bij selectie nieuwe SaaS: SOC 2 / ISO 27001 vragen.
- [ ] **Contract-clausules** — DPA + security addendum + audit-recht + breach-notification.

## 10. Vulnerability disclosure

- [ ] **`/.well-known/security.txt`** publiceren op productie-URL.
- [ ] **security@yourcompany contact** — bewaakt mailbox.
- [ ] **Disclosure policy** publiceren — termijnen, scope, safe harbor.
- [ ] **Bug bounty optioneel** — niet vereist op deze schaal.

## 11. Awareness & training

- [ ] **Onboarding security training** — 30 min voor elke nieuwe medewerker.
- [ ] **Jaarlijkse refresher** — phishing, password hygiene, social eng.
- [ ] **Phishing simulatie** — 2x/jaar, geen blame culture.
- [ ] **Directie-training** — jullie 5 FTE = directie kent NIS2 + zorgplicht klanten op hoofdlijnen.

## 12. Documentatie pakket voor klanten

Pakket dat sales/procurement kunnen overhandigen:

- [ ] **Security one-pager** (publiek)
- [ ] **DPA-template** (AVG art. 28)
- [ ] **Sub-verwerker overzicht**
- [ ] **Pentest executive summary** (laatste 12 mnd)
- [ ] **SOC-style descriptie** of ISO 27001 SOA-light (controls overzicht)
- [ ] **Incident response procedure**
- [ ] **SBOM op aanvraag**
- [ ] **Penetration test rapport** (onder NDA)
- [ ] **Architectuurdiagram** — datastromen, hosting-locaties

## 13. Sector-specifiek (afhankelijk klantmix)

**Zorgklanten:**
- [ ] NEN 7510 awareness — niet certificering, wel control-mapping
- [ ] AVG-bijzondere persoonsgegevens — extra encryptie, audit-trail
- [ ] WGBO/Wabvpz alignment indien medische data

**Overheidsklanten:**
- [ ] BIO 2.0 control-mapping — pas-toe-of-leg-uit register
- [ ] DigiD/eHerkenning indien integratie
- [ ] Hosting EU/NL eis (geen US Cloud Act exposure waar mogelijk)

**Onderwijsklanten:**
- [ ] SURF Normenkader IBP+P (informatiebeveiliging + privacy)
- [ ] SIVON inkoopvoorwaarden voor PO/VO/MBO

---

## Roadmap — eerste 90 dagen

**Maand 1 — fundament:**
1. Security policy + risico-register opstellen
2. MFA op alle admin-accounts forceren
3. Asset-inventaris + sub-verwerker register
4. security.txt + security@ mailbox
5. Incident response plan v0.1

**Maand 2 — technisch:**
1. Dependency + secrets scanning in CI aanzetten
2. SAST tool integreren
3. Backup-restore test uitvoeren
4. SBOM-pipeline opzetten
5. Logging-baseline configureren

**Maand 3 — extern:**
1. Pentest inplannen + uitvoeren
2. Klant-pakket samenstellen (one-pager, DPA, etc)
3. Tabletop exercise + post-mortem template
4. Awareness training rollen
5. Klant-RFP eisen mappen tegen huidige status

## Doorlopend

- Maandelijks: patch-cyclus + access review (5 FTE = klein)
- Per kwartaal: directie security review
- Halfjaarlijks: phishing simulatie + access review formeel
- Jaarlijks: pentest + risico-herziening + BCP-test + policy-update

---

## Wanneer wel echt onder NIS2 vallen?

Re-evalueer scope als:
- Groei naar **≥50 FTE OF ≥€10M omzet** (size-cap kantelpunt)
- Hosting-model verandert: jullie gaan SaaS leveren als cloud-/MSP-rol → Bijlage I sector 8
- Cbw-evaluatie 2027+ breidt onderwijs/edtech uit
- Directe levering aan NIS2-essentiële entiteit met grote afhankelijkheid

Houd Cbw + AMvB ontwikkelingen bij via NCSC.nl + NCTV nieuwsbrief.
