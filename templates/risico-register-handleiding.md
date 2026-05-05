# Risico-register — Handleiding

Begeleiding bij `risico-register-template.csv` / `.xlsx`.

## Doel

Top-N cyber-risico's identificeren, scoren, behandelen, periodiek reviewen. Voldoet aan NIS2 art. 21 lid 1 (alle-gevaren-benadering) op proportionele schaal voor micro-onderneming.

## Kolommen

| Kolom | Uitleg |
|-------|--------|
| **ID** | Uniek nummer (R-001 etc) |
| **Datum toegevoegd** | YYYY-MM-DD |
| **Risico** | 1-zin omschrijving — "wat gebeurt + gevolg" |
| **Categorie** | Vertrouwelijkheid / Integriteit / Beschikbaarheid / Continuiteit / Juridisch / Bedrijfsmatig |
| **Asset/Proces** | Wat geraakt wordt |
| **Dreiging** | Bron (extern aanvaller, insider, fout, natuurgeweld, leverancier) |
| **Kwetsbaarheid** | Waarom dreiging slaagt |
| **Impact (1-5)** | 1=verwaarloosbaar, 3=ernstig, 5=existentieel |
| **Waarschijnlijkheid (1-5)** | 1=zeer onwaarschijnlijk, 3=mogelijk, 5=zeer waarschijnlijk |
| **Risicoscore** | Impact × Waarschijnlijkheid (1-25) |
| **Bestaande maatregelen** | Wat is al ingericht |
| **Restrisico (1-25)** | Score na bestaande maatregelen |
| **Behandeling** | Mitigeren / Accepteren / Vermijden / Overdragen |
| **Eigenaar** | Persoon verantwoordelijk |
| **Geplande acties** | Concrete next steps |
| **Deadline** | YYYY-MM-DD |
| **Status** | Open / In progress / Closed / Geaccepteerd |
| **Laatste review** | YYYY-MM-DD |

## Scoring-matrix

```
                    Waarschijnlijkheid
Impact      1       2       3       4       5
  5         5      10      15      20      25
  4         4       8      12      16      20
  3         3       6       9      12      15
  2         2       4       6       8      10
  1         1       2       3       4       5
```

| Score | Niveau | Actie |
|-------|--------|-------|
| 1-4 | Laag | Accepteren mogelijk + monitoring |
| 5-9 | Middel | Mitigatieplan binnen 6 mnd |
| 10-15 | Hoog | Mitigatie binnen 3 mnd + directie-zicht |
| 16-25 | Kritiek | Direct actie + stop-the-line bevoegdheid |

## Behandelingsstrategieën

- **Mitigeren** — controles toevoegen om kans/impact te verlagen (default voor middel/hoog)
- **Accepteren** — bewust dragen, motiveren waarom (kosten/baten)
- **Vermijden** — activiteit/asset elimineren
- **Overdragen** — verzekering, contractueel naar leverancier/klant

## Workflow

1. **Initieel** — directie + tech-lead vullen samen min 10 risico's. Brainstorm 1-2u.
2. **Score** — Impact + Waarschijnlijkheid los inschatten, dan score laten rekenen.
3. **Behandeling kiezen** — middel+ verplicht actieplan, eigenaar, deadline.
4. **Maandelijks** — eigenaars rapporteren voortgang acties.
5. **Kwartaal** — directie review hele register, status updaten.
6. **Jaarlijks** — volledig register herzien, restrisico's herrekenen, nieuwe risico's toevoegen.

## Triggers nieuwe risico's toevoegen

- Nieuwe feature/product
- Nieuwe leverancier
- Incident gehad
- Klacht/audit klant
- Nieuwe regelgeving
- Personeelswisseling
- Architectuurwijziging

## Tips

- Houd register **kort** — top 10-30. Niet alles is een risico.
- Schrijf risico's als "**[event] leidt tot [gevolg]**", niet als algemeenheid
- Onderscheid **inherent risico** (zonder maatregelen) van **restrisico** (met maatregelen)
- Documenteer **wie geaccepteerd heeft** bij geaccepteerde risico's (handtekening directie)
- Privacy-risico's apart in **DPIA**, mag wel cross-linken naar register
- Koppel aan **incident-register** — geleerde lessen → nieuwe risico-items

## Mapping naar NIS2 art. 21 maatregelen

Risico's clusteren rond NIS2 baseline:

| NIS2 art. 21 lid 2 | Risico-categorie |
|---|---|
| (a) risk-analysis + info security policy | Alle |
| (b) incident handling | Beschikbaarheid + Integriteit |
| (c) business continuity, backup, crisis | Continuiteit |
| (d) supply chain security | Vertrouwelijkheid via leveranciers |
| (e) acquisition/dev/maintenance | Integriteit + secure SDLC |
| (f) effectiveness assessment | Meta — review cyclus |
| (g) cyber hygiene + training | Bedrijfsmatig |
| (h) crypto + encryption | Vertrouwelijkheid |
| (i) HR security + access control | Vertrouwelijkheid |
| (j) MFA + secure comms | Vertrouwelijkheid |

## Tools

CSV/Excel volstaat tot ~100 risico's. Daarna overweeg:
- **GitLab/Jira issue tracker** met label "risk" — koppel direct aan tickets
- **Notion/Airtable** — relaties met assets, controls
- **GRC-tools** (Vanta, Drata, Sprinto) — overkill voor 5 FTE, wel handig bij ISO 27001-traject
