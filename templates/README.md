# NIS2-light Templates

Werkbestanden voor implementatie van `NIS2-light-micro-LMS.md` checklist. Elk template = .xlsx (Excel-ready, kleurschaling + dropdowns + filter) + .csv (plain).

## Bestanden

| Template | Doel | NIS2-mapping |
|----------|------|--------------|
| `risico-register-template.xlsx` | Top-N cyberrisico's scoren + behandelen | art. 21 lid 2 (a) |
| `asset-inventaris-template.xlsx` | Assets + criticaliteit + data-classificatie | art. 21 lid 2 (a)(i) |
| `sub-verwerker-register-template.xlsx` | Leveranciers + DPA + security-status | art. 21 lid 2 (d) supply chain |
| `incident-register-template.xlsx` | Security incidents + meldingen + lessons | art. 21 lid 2 (b) + art. 23 |
| `access-review-template.xlsx` | Halfjaarlijkse user-access review | art. 21 lid 2 (i)(j) |
| `nis2-maatregelen-tracker-template.xlsx` | Voortgang 25 controls per art. 21 lid 2 | art. 21 volledig |
| `risico-register-handleiding.md` | Begeleiding bij risico-register | - |

## Werkwijze

1. Open xlsx — voorbeeldrijen vervangen/aanvullen met eigen data
2. Dropdowns + kleur-formatting werken automatisch
3. Filter + freeze header al aan
4. CSV-versies voor versiebeheer in git of import in andere tools

## Eigenaren-suggestie (5 FTE)

| Template | Primair eigenaar |
|----------|-----------------|
| Risico-register | CTO |
| Asset-inventaris | CTO |
| Sub-verwerker | CEO (contracten) |
| Incident-register | CTO |
| Access review | CTO |
| Maatregelen-tracker | CEO (status overall) |

## Reviewcyclus

| Template | Cyclus |
|----------|--------|
| Risico-register | kwartaal review, jaarlijks volledig |
| Asset-inventaris | kwartaal + bij verandering |
| Sub-verwerker | jaarlijks + bij nieuwe leverancier |
| Incident-register | per incident, jaarlijks aggregaat |
| Access review | halfjaarlijks |
| Maatregelen-tracker | maandelijks status, kwartaal directie |

## Tips

- Hou rijen kort en concreet, niet alle theoretische risico's
- Documenteer "Closed" niet weggooien — audit-trail
- 1 directiebesluit per kwartaal: doorlopen alle 6 sheets
- Bij groei naar ≥50 FTE / €10M omzet: migreer naar GRC-tool (Vanta/Drata/Sprinto)
