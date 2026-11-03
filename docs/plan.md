# Njia – Datenarchitektur & Monetarisierung

Stand 2. November 2026 · Philipp Leitlein (Revana EOOD). Export des Claude-Docs „Njia – Datenarchitektur & Monetarisierung“ (https://claude.ai/artifact/JMZUTByitTt2ubkwhxcmTr).

## Kurzfassung

Njia braucht neun statt vier Datenpools, ein gemeinsames Datenmodell mit Quelle und Stand-Datum an jedem Faktum und ein Erlösmodell, das den Passungs-Score nie verkauft. Das Datenmodell, die Startdaten für Sierra Leone → 10 Länder, das Backend-Gerüst und die drei n8n-Flows sind seit dem 2. November 2026 gebaut (Abschnitt „Umsetzung“).

- **Clustern nach Nutzerfrage** und alles an Korridoren aufhängen (Herkunft × Ziel). Neu dazu: Anerkennung, Arbeitsmarkt, Anbieter, Vertrauen, Nutzerdaten.
- **Anforderungen als eigenes Objekt** (IELTS 6.5, Sperrkonto, anabin H+). Sie verbinden Wege, Visa und Stipendien mit dem Profil und machen die Readiness berechnbar.
- **Jobs und Gehälter per API**, Visa, Anerkennung und Stipendien per Redaktion mit automatischer Änderungserkennung. Kein Scraping von LinkedIn oder Indeed.
- **Mit zwei bis drei Korridoren starten**, z. B. Sierra Leone, Ghana, Nigeria → Deutschland und UK.
- **Zuerst konfliktarme Erlöse:** Lizenzen für Schulen und NGOs, Marktplatz für Tutoren und Sprachschulen, Vermittlung von Finanzdiensten.
- **Hochschulprovisionen und Anzeigen später**, klar gekennzeichnet. Deutsche öffentliche Hochschulen zahlen keine Provision.
- **Jobvermittlung nur auf Kosten der Arbeitgeber**, nie der Studierenden, und erst nach Rechtsprüfung.

## Entscheidungen vom 2. November 2026

- **Name: Njia.** Im App Store und bei Google Play gibt es bereits eine kleine Bibel-Lese-App namens „Njia“ ([Apple](https://apps.apple.com/us/app/njia/id6497407291), [Google Play](https://play.google.com/store/apps/details?id=com.njia.pattern)). Apple verlangt eindeutige App-Namen, daher heißt die App im Store „Njia Careers“, die Marke bleibt Njia. Markenrecherche (TMview, EUIPO) und Domains konnte ich aus dieser Umgebung nicht prüfen; njia.com antwortet mit einer leeren Seite und ist vermutlich vergeben. Vor dem Launch: Markenanwalt und Domain-Check, Kandidaten njia.africa, njia.app, getnjia.com.
- **Startkorridor:** Sierra Leone → zehn europäische Zielländer (Tabelle unten).
- **Aktualisierung:** alle 14 Tage automatisch über n8n; jede Änderung geht per E-Mail und WhatsApp an eine Person, die sie freigibt. Nichts geht ohne Freigabe live.
- **Betreiber:** Revana EOOD, Bulgarien. Daten und Hosting in der EU (Firebase-Region europe-west).
- **Monetarisierung:** zurückgestellt. Die Neutralitätsregeln gelten trotzdem ab Tag 1.
- **Stack:** Flutter (Web, Android, iOS), Firebase Auth, Firestore, Cloud Functions, Cloud Storage; n8n für die Datenpflege; Claude für die Extraktion.

### Zehn Zielländer für Sierra Leone

Kriterien: englischsprachiges Angebot, Kosten und erreichbare Stipendien, Visumsweg von Freetown aus, Arbeitsrecht nach dem Abschluss. Stand 2. November 2026; Angaben mit „zu prüfen“ stammen nicht aus einer in dieser Sitzung geöffneten Quelle.

| Land | Warum | Visum für Sierra Leone | Studiengebühren Nicht-EU | Stipendien für Sierra Leone | Nach dem Abschluss |
| --- | --- | --- | --- | --- | --- |
| Deutschland | keine Studiengebühren an öffentlichen Hochschulen, DAAD, starke Arbeitsmarktnachfrage | Botschaft Accra; Freetown hat keine Visastelle | keine (BW: €1.500/Semester, zu prüfen) | DAAD, Erasmus Mundus | 18 Monate Jobsuche (zu prüfen) |
| Vereinigtes Königreich | Englisch, viele Studiengänge, große Diaspora | Visazentrum in Freetown ([gov.uk](https://www.gov.uk/government/news/changes-to-uk-visa-services-in-sierra-leone)) | hoch, £15.000–30.000/Jahr (zu prüfen) | [Chevening](https://www.chevening.org/scholarship/sierra-leone/), Commonwealth | Graduate Route 18 Monate ab 1.1.2027, PhD 3 Jahre ([PIE News](https://thepienews.com/shorter-graduate-route-from-january-2027-uk-govt-confirms/)) |
| Irland | Englisch, einzige EU-Botschaft mit Visastelle in Freetown | [Botschaft Freetown](https://api.ireland.ie/en/sierraleone/freetown/about/embassy-information/) | hoch, €10.000–25.000/Jahr (zu prüfen) | [Ireland Fellows](https://www.ireland.ie/en/ireland-fellows-programme/applying-for-the-ireland-fellows-programme/ireland-fellows-africa/), für Sierra Leone nur auf Einladung | Stay-back 1–2 Jahre (zu prüfen) |
| Niederlande | sehr viele englische Master | [Botschaft Accra](https://www.netherlandsworldwide.nl/visa-the-netherlands/mvv-long-stay/apply-sierra-leone) | €8.000–20.000/Jahr (zu prüfen) | NL Scholarship, Erasmus Mundus | Orientierungsjahr 12 Monate (zu prüfen) |
| Frankreich | niedrige Gebühren, Antrag in Freetown möglich | [CAPAGO-Zentrum Freetown](https://france-visas.gouv.fr/en/sierra-leone), Entscheidung in Conakry | ca. €2.800–3.900/Jahr, oft erlassen (zu prüfen) | Eiffel, Erasmus Mundus | Aufenthalt zur Jobsuche nach Master (zu prüfen); Französisch meist nötig |
| Italien | Regierungsstipendium nennt Sierra Leone ausdrücklich, einkommensabhängige Gebühren, englische Master | Botschaft Abidjan ([esteri.it](https://ambabidjan.esteri.it/en/news/dall_ambasciata/2026/03/call-for-applications-scholarships-offered-by-the-italian-government-a-y-2026%e2%80%912027/)) | meist €1.000–4.000/Jahr nach Einkommen (zu prüfen) | Italian Government Scholarships, Invest Your Talent | 12 Monate Jobsuche (zu prüfen) |
| Ungarn | Vollstipendium Stipendium Hungaricum; 26 Sierra Leoner 2026/27 ([Premier Media](https://www.premiermedia-sl.com/?p=30230)) | Botschaft Accra | mit Stipendium keine | Stipendium Hungaricum | EU-Abschluss, Jobsuche 9 Monate (zu prüfen) |
| Finnland | englische Master, Stipendien mit Gebührenerlass | Botschaft Abuja | €8.000–18.000/Jahr (zu prüfen) | Finland Scholarship, Hochschulstipendien (zu prüfen) | 2 Jahre Aufenthalt zur Jobsuche (zu prüfen) |
| Österreich | [€726,72/Semester](https://studyinaustria.at/en/study/tuition-fees) an öffentlichen Universitäten | Botschaft Dakar | ca. €1.450/Jahr | OeAD-Stipendien, Erasmus Mundus | 12 Monate Jobsuche (zu prüfen); Deutsch für Bachelor |
| Norwegen | Gebühren für Nicht-EU 2023 eingeführt, Regierung will die Pflicht wieder abschaffen, Hochschulen entscheiden ([educations.com](https://www.educations.com/higher-education-news/norway-removes-tuition-requirements-for-international-students)); englische Master | VFS, regionale Botschaft ([norway.no](https://www.norway.no/en/sierra-leone/visitors-visa-res-permit/res-permit/)) | je Hochschule, Stand 2026 prüfen | wenige; hoher Finanzierungsnachweis | 12 Monate Jobsuche (zu prüfen) |

Nicht aufgenommen: Schweden (SI-Stipendium nennt Sierra Leone nicht, Gebühren hoch), Belgien und Portugal (Sprache, Botschaft weit), Schweiz und Dänemark (sehr hohe Lebenshaltung), Polen und Tschechien (wenig Stipendien für Sierra Leone). Reserve für Phase 2: Belgien, Schweiz, Schweden.

## Datenpools: was fehlt und wie ich clustern würde

Die vier Pools stimmen, beschreiben aber vor allem das Ziel. Für Machbarkeits-Scores und Finanzplan fehlen Anerkennung, Kosten, Gehälter und die Herkunftsseite. Ich würde nach der Frage clustern, die eine Studentin stellt, und alles an einem **Korridor** (Herkunftsland × Zielland, z. B. Sierra Leone → Deutschland) aufhängen.

| Cluster | Frage der Nutzerin | Inhalte | Ändert sich |
| --- | --- | --- | --- |
| 1 Wege | Wohin kann ich? | Studiengänge, Ausbildungen, Weiterbildungen, Jobs, Praktika, Traineeprogramme | täglich (Jobs) bis jährlich (Studiengänge) |
| 2 Voraussetzungen | Was brauche ich dafür? | Zulassungsregeln, Sprachtests (IELTS, TOEFL, Goethe, TestDaF), Mindestnoten, Dokumente, Fristen | pro Semester |
| 3 Anerkennung | Zählt mein Abschluss? | Bewertung von Schulabschlüssen (WASSCE, KCSE) und Hochschulen (anabin, ENIC-NARIC), reglementierte Berufe | selten |
| 4 Einreise & Aufenthalt | Darf ich hin und bleiben? | Visatypen, Gebühren, Finanzierungsnachweis, zuständige Botschaft, Bearbeitungszeit, Arbeitsrecht im Studium, Wechsel Studium → Job | monatlich, teils ohne Ankündigung |
| 5 Geld | Kann ich es bezahlen? | Studiengebühren, Lebenshaltung, Stipendien, Kredite, Sperrkonto, Versicherung | jährlich, Stipendien pro Runde |
| 6 Arbeitsmarkt | Lohnt es sich? | Gehaltsspannen nach Beruf und Region, Engpassberufe, Nachfrage | jährlich |
| 7 Anbieter | Wer hilft mir? | Tutoren, Sprachschulen, Coaches, Testzentren, Agenturen, mit Prüfstatus und Bewertungen | laufend |
| 8 Vertrauen | Ist das echt? | Bekannte Betrugsmuster (Fake-Jobs, Fake-Stipendien, Visa-Scams), lizenzierte Agenturen, akkreditierte Hochschulen | laufend |
| 9 Nutzerdaten | Wo stehe ich? | Profil, Dokumente, Ziele, Fortschritt, Ergebnisse (Zulassung, Visum, Job) | laufend |

Was ich gegenüber deinem Vorschlag ändern würde:

- **Voraussetzungen als eigenes Objekt.** Eine Anforderung wie „IELTS 6.5“ oder „Sperrkonto“ gilt für viele Studiengänge, Jobs und Visa. Einmal gepflegt, überall verknüpft – so rechnet die Readiness automatisch.
- **Weiterbildung zu „Wege“.** Studium, Ausbildung, Kurs und Job sind alles Wege mit Ort, Dauer, Kosten und Anforderungen. Ein gemeinsames Schema hält die Roadmap einfach.
- **Geld umfasst Kosten und Gehälter.** Der Finanzplan braucht beide Seiten; Stipendien allein reichen nicht.
- **Neu: Anerkennung, Arbeitsmarkt, Anbieter, Vertrauen.** Anerkennung entscheidet oft über den ganzen Weg. Vertrauen ist für die Zielgruppe zentral, weil Betrug mit Jobs und Stipendien verbreitet ist.
- **Nutzerdaten als Pool mitdenken.** Anonymisierte Ergebnisse (wer mit welchem Profil zugelassen wurde) machen die Realismus-Scores mit der Zeit echt statt geschätzt.

## Informationsstruktur

Njia sollte auf wenigen wiederverwendbaren Objekten aufbauen, die miteinander verknüpft sind. Ein Karriereplan ist dann eine Abfrage: Ziel → passende Wege → deren Anforderungen und Kosten → Lücken zum Profil.

| Objekt | Beispiele | Wichtige Felder | Verknüpft mit |
| --- | --- | --- | --- |
| Land / Korridor | Deutschland; Sierra Leone → Deutschland | Währung, Sprache, zuständige Botschaft je Herkunftsland, Lebenshaltung | Aufenthaltstitel, Wege |
| Weg | MSc Finance, Ausbildung Bankkaufmann, Graduate Programme, Praktikum | Typ, Ort, Dauer, Sprache, Kosten, Start, Frist | Anforderungen, Finanzierung, Beruf |
| Anforderung | IELTS ≥ 6.5, Hochschule anabin H+, Sperrkonto €11.904, ≤ 12 Monate Berufserfahrung | Typ, Schwelle, Nachweisdokument, Gültigkeit | Wege, Aufenthaltstitel, Stipendien, Profil |
| Aufenthaltstitel | Studentenvisum, Blaue Karte EU | Gebühr, Bearbeitungszeit, Arbeitsrecht, Folgetitel | Land, Anforderungen |
| Finanzierung | Stipendium, Kredit, Sperrkonto | Betrag, was gedeckt ist, Berechtigung, Frist, Schwierigkeit | Wege, Anforderungen |
| Beruf | Bankkaufmann, Financial Analyst | Gehaltsspanne je Land und Region, Nachfrage | Wege (Jobs), Arbeitsmarkt |
| Anbieter | Tutor, Sprachschule, Testzentrum, Coach | Leistung, Preis, online oder vor Ort, Prüfstatus, Bewertungen | Anforderungen (IELTS-Kurs → IELTS) |
| Quelle | Behördenseite, API, Partner-Feed | Typ, Lizenz, Abrufdatum, Prüfdatum, verantwortliche Person | jedes einzelne Faktum |

**Standard-Taxonomien statt eigener Listen.** Länder nach ISO 3166, Währungen nach ISO 4217, Berufe nach ESCO / ISCO-08, Bildungsstufen nach ISCED 2011, Sprachniveaus nach GER (CEFR). So lassen sich Jobs, Studiengänge und Gehälter aus verschiedenen Quellen zusammenführen.

**Herkunft an jedem Faktum.** Jede Zahl trägt Quelle, Abrufdatum, Prüfdatum, Gültigkeit und eine Vertrauensstufe: offiziell, Partner, redaktionell, Community oder geschätzt. Die Oberfläche zeigt das als „Stand 02.11.2026 · Quelle: Auswärtiges Amt“.

**Scores aus Regeln, später aus Daten.** Readiness = Anforderungen des Weges gegen das Profil (erfüllt, Lücke, unbekannt). Realismus und Schwierigkeit starten als gewichtete Heuristik und werden mit echten Ergebnissen der Nutzer kalibriert.

## Datenbezug je Pool

Es gibt kein fertiges Datenpaket für alles. Jobs und Gehälter kommen über APIs. Visa, Anerkennung und Stipendien muss ein kleines Redaktionsteam pflegen, unterstützt durch automatische Änderungserkennung auf den offiziellen Seiten. Darum mit wenigen Korridoren starten.\


| Pool | Hauptquellen | Methode | Aktualisierung |
| --- | --- | --- | --- |
| Einreise & Aufenthalt | Botschaftsseiten (diplo.de), Make it in Germany, gov.uk, IRCC, Campus France | Redaktion pflegt Regeln im Schema; ein Crawler vergleicht die offiziellen Seiten täglich und meldet Änderungen | täglich prüfen, bei Änderung sofort |
| Jobs | [Adzuna API](https://jentic.com/apis/adzuna.com/adzuna) (16 Länder, u. a. DE, GB, ZA, US), [Jobsuche der Bundesagentur](https://github.com/bundesAPI/jobsuche-api), öffentliche Karriereseiten von Arbeitgebern, direkte Partner-Feeds | APIs und Feeds; kein Scraping von LinkedIn oder Indeed | täglich |
| Studium & Weiterbildung | DAAD-Studiengangsdatenbank, Hochschulkompass, Hochschulseiten, UCAS; Partnerhochschulen liefern Daten selbst | Partner-Feeds im Njia-Schema, sonst Redaktion plus KI-Extraktion | pro Semester |
| Anerkennung | [anabin](https://www.make-it-in-germany.com/de/arbeiten-in-deutschland/anerkennung/hochschulabschluesse) der ZAB, ENIC-NARIC-Stellen | Redaktion je Korridor; anabin nennt weder API noch Export | halbjährlich |
| Stipendien | [DAAD-Stipendiendatenbank](https://www2.daad.de/deutschland/stipendium/datenbank/en/21148-scholarship-database), Chevening, Commonwealth, Mastercard Foundation, Erasmus Mundus, Hochschulstipendien | Redaktion plus KI-Extraktion von der Originalseite; Aggregator-Seiten nur als Hinweisgeber | pro Ausschreibungsrunde |
| Kosten | Hochschulseiten, offizielle Sperrkonto-Beträge, DAAD-Angaben zur Lebenshaltung, Versicherer | Redaktion, jährlich verifiziert | jährlich |
| Gehälter & Arbeitsmarkt | Destatis, Entgeltatlas der Bundesagentur, Eurostat, US BLS, Gehaltsverteilung von Adzuna | APIs und Statistik-Downloads, zu Spannen je Beruf und Region verdichtet | jährlich, Adzuna monatlich |
| Anbieter | Tutoren, Schulen und Coaches registrieren sich selbst | Onboarding mit Prüfung (Ausweis, Zertifikate); Bewertungen nur nach Buchung | laufend |
| Vertrauen | Warnhinweise der Botschaften, Meldungen der Nutzer, Agentur-Lizenzregister | Redaktion plus Melde-Button | laufend |
| Nutzerdaten | eigene Plattform | mit Einwilligung; Datenschutzgesetze der Zielmärkte beachten | laufend |

Hinweise zu einzelnen Quellen:

- **Die Jobsuche der Bundesagentur** ist laut dem Community-Projekt bundesAPI keine offizielle API und kann sich ohne Ankündigung ändern. Vor produktiver Nutzung bei der Bundesagentur anfragen.
- **IATA Timatic** ist der Standard für Einreiseregeln bei Flügen, deckt aber Reisedokumente ab, nicht Studien- oder Arbeitsaufenthalte. TimaticWeb 2 kostet laut [AltexSoft](https://www.altexsoft.com/blog/timatic/) €499 pro Jahr plus Transaktionen. Für Njia ist es daher höchstens eine Ergänzung.
- **Jobquellen je Kontinent** sind im früheren Dokument [Njia – Öffentliche Jobquellen pro Kontinent](https://claude.ai/artifact/JtaU45QXddRXQNdyaxTXME) gesammelt. Für rund 1.000 Jobs weltweit reichen voraussichtlich APIs plus einige direkte Partner-Arbeitgeber.

## Daten-Pipeline und Qualitätssicherung

Alle Quellen laufen durch dieselbe Pipeline. Was Visa, Anerkennung oder Geld betrifft, geht nie ohne menschliche Prüfung live.

*(Diagramm im Original-Doc: Daten-Pipeline · 7 Stufen mit Rückkopplung – Quelle → Abruf → KI-Extraktion → Prüfregeln → menschliche Freigabe → Veröffentlichung → Monitoring.)*

Das Monitoring stößt den Abruf neu an, sobald sich eine offizielle Seite ändert, eine Frist abläuft oder Nutzer einen Fehler melden.

- **Quellenregister:** Jede Quelle hat Typ, Lizenz, Abrufrhythmus und eine verantwortliche Person. Schnelle Daten wie Jobs täglich, Visa täglich auf Änderungen, Studiengänge pro Semester.
- **KI-Extraktion:** Ein Sprachmodell überträgt Texte ins Schema und speichert zu jedem Feld die zitierte Textstelle. So kann die Redaktion schnell gegenprüfen.
- **Prüfregeln:** automatische Plausibilität (Betrag im üblichen Rahmen, Datum in der Zukunft, Link erreichbar), dazu Vier-Augen-Prüfung für regulierte Inhalte.
- **Recht:** Fakten speichern und auf das Original verlinken statt Texte zu kopieren; Nutzungsbedingungen und robots.txt beachten; personenbezogene Daten nur mit Einwilligung.

## Monetarisierung

**Zurückgestellt (Entscheidung vom 2. November 2026).** Die Analyse bleibt als Grundlage für später. Nutzer zahlen für den Kern nichts; der Passungs-Score darf nie käuflich sein, sonst verliert Njia sein wichtigstes Gut, das Vertrauen.

| Erlösquelle | Wer zahlt | Modell | Belegte Größenordnung | Risiko | Start |
| --- | --- | --- | --- | --- | --- |
| Lizenzen für Schulen, Hochschulen, NGOs | Schulen in Afrika, Stiftungen, Entwicklungsprogramme | Preis pro Studierendem und Jahr, Berater-Dashboard | eigene Preisfindung nötig | gering | Phase 1 |
| Marktplatz: Tutoren, Sprachschulen, Coaches, Testvorbereitung | Anbieter | Provision pro Buchung | Preply: 100 % der Probestunde, danach 33 % sinkend auf 18 % ([Preply](https://help.preply.com/en/articles/4171383)) | mittel: Qualität prüfen | Phase 1 |
| Vermittlung von Finanzdiensten | Sperrkonto-Anbieter, Versicherer, Kreditgeber, Geldtransfer | Provision pro Abschluss | Konditionen bei Anbietern anfragen | mittel: nur geprüfte Anbieter | Phase 1 |
| Premium für Nutzer | Studierende | günstiges Monats- oder Bewerbungspaket per Mobile Money | Zahlungsbereitschaft testen | gering | Phase 1 |
| Provision von Hochschulen | private Hochschulen, Hochschulen in UK, Irland, Kanada, Australien, USA | Pauschale oder Prozent der Studiengebühr nach Einschreibung | USA 2026: meist $2.000–3.500 pauschal oder 10–15 % der Netto-Gebühr ([AIRC-Umfrage via ICEF](https://monitor.icef.com/2026/07/survey-provides-a-snapshot-of-agency-commission-practices-of-us-institutions/)) | hoch: Interessenkonflikt | Phase 2 |
| Hochschulwerbung und hervorgehobene Plätze | Hochschulen | pro Klick, Lead oder Einblendung | Studyportals bietet CPC, CPL, CPM und Bezahlung nach Einschreibung an, ohne Preise zu nennen ([Studyportals](https://studyportals.com/partnership/student-recruitment)) | hoch, wenn nicht klar gekennzeichnet | Phase 2 |
| Stellenanzeigen und hervorgehobene Jobs | Arbeitgeber | pro Anzeige oder Laufzeit | eigene Preisfindung nötig | mittel | Phase 2 |
| Vermittlung (Headhunting) | ausschließlich Arbeitgeber | Erfolgshonorar pro Einstellung | Marktpreise noch zu recherchieren | hoch: Recht, Lizenzen | Phase 3 |

Wichtige Grenzen:

- **Keine Gebühren von Jobsuchenden.** ILO-Übereinkommen 181, Art. 7: Private Arbeitsvermittler dürfen Arbeitnehmern „keine Gebühren oder Kosten“ berechnen, außer bei behördlich erlaubten Ausnahmen ([Text](https://jus.uio.no/english/services/library/treaties/02/2-09/ilo_private_employment.html)). Zudem haben viele Herkunftsländer Lizenzpflichten für Vermittler; das ist je Land zu prüfen.
- **Gesundheitsberufe gesondert behandeln.** Die WHO-Liste 2023 nennt 55 Länder mit kritischem Mangel an Gesundheitspersonal, davon 37 in Afrika ([WHO](https://www.who.int/news/item/14-03-2023-who-renews-alert-on-safeguards-for-health-worker-recruitment)). Aktive Anwerbung von Pflegekräften aus diesen Ländern sollte Njia nicht anbieten.
- **Deutsche öffentliche Hochschulen zahlen keine Provision.** Sie verlangen meist keine Studiengebühren. Für den deutschen Korridor tragen deshalb Marktplatz, Finanzdienste und Lizenzen das Geschäft, nicht Hochschulprovisionen.
- **USA: Provisionen für internationale Studierende sind erlaubt.** Für inländische Studierende mit Bundesförderung gilt dagegen ein Verbot. Eine Gesetzeskorrektur von Dezember 2021 stellte das auch für Hochschulen mit GI-Bill-Mitteln klar ([The PIE News](https://thepienews.com/thrive-act-fix-signed-into-law-in-us/)).

Regeln für Neutralität (in Deutschland teils Pflicht):

1. **Passungs-Ranking ist nicht käuflich.** Bezahlte Plätze stehen getrennt und tragen „Anzeige“. Ohne Kennzeichnung ist bezahltes höheres Ranking verboten (UWG, Anhang Nr. 11a, [Gesetzestext](https://www.gesetze-im-internet.de/uwg_2004/anhang.html)).
2. **Ranking-Kriterien offenlegen.** Hauptparameter und ihre Gewichtung müssen von der Ergebnisliste aus leicht erreichbar sein ([§ 5b Abs. 2 UWG](https://www.gesetze-im-internet.de/uwg_2004/__5b.html)).
3. **Provisionen offen nennen**, z. B. „Njia erhält eine Provision, wenn du dich hier einschreibst.“
4. **Bewertungen nur nach verifizierter Buchung.** Wer echte Bewertungen behauptet, muss sie prüfen (UWG, Anhang Nr. 23b).
5. **Keine Zusagen zu Visa oder Zulassung** und kein Ghostwriting im Study Aid.

Ich bin kein Anwalt. Vor Phase 2 sollte eine Anwältin Vermittlungs-, Wettbewerbs- und Datenschutzrecht für die Startkorridore prüfen.

## Umsetzung, Stand 2. November 2026

Die Informationsstruktur ist gebaut und geprüft: 135 Startdokumente für Sierra Leone → 10 Länder, Schema-Validierung grün, Planungs-Engine mit 4 Tests grün, drei n8n-Flows angelegt, Prototyp (Version 6) an die Struktur angepasst.

*(Diagramm im Original-Doc; siehe `docs/architecture.md`.)*

Die App liest nur freigegebene Inhalte. Alles, was n8n findet, geht als Vorschlag an eine Person; der Freigabe-Link ist pro Vorschlag einmalig.

### Was im Zip (Repo) liegt

| Teil | Dateien | Stand |
| --- | --- | --- |
| Datenmodell | `schema/njia.schema.json` (15 Sammlungen, Herkunft an jedem Faktum) | fertig |
| Startdaten | `seed/*.json`: 11 Länder, 10 Korridore, 23 Aufenthaltstitel, 21 Anforderungen, 14 Förderungen, 12 Wege, 6 Berufe, 30 Quellen, 5 Warnungen | geprüft; Gebühren und Fristen teils als „Estimate“ markiert |
| Firestore | `firestore.rules`, `firestore.indexes.json` (inkl. TTL für Jobs), `storage.rules` | fertig |
| Cloud Functions | `functions/src/engine.mjs` (Scores, Roadmap), `index.mjs` (6 Functions) | fertig, Tests grün, noch nicht deployt |
| n8n | `n8n/njia-1..3.js`, in n8n angelegt (inaktiv) | Zugangsdaten eintragen |
| Doku | `docs/architecture.md`, `docs/setup.md`, `docs/data-model.md` | fertig |

### Deine Fragen

**UI an die Datenstruktur anpassen?** Ja, und das ist passiert. Die Struktur bildet die Nutzerreise ab: Ziel → Weg → Voraussetzungen → Geld → Visum → Arbeit. Im Prototyp heißen die Gruppen jetzt *Your goal, Your path, Go global, Support*; die Visa-Seite zeigt alle zehn Länder aus den Startdaten mit Kennzeichen „Checked“ oder „Estimate · to verify“; Preis- und Plan-Elemente sind entfernt.

**Was muss im Backend angelegt werden?** Ein Firebase-Projekt (Auth, Firestore, Functions, Storage, Hosting) mit den Regeln und Indizes aus dem Repo, die Startdaten per `npm run seed`, sechs Cloud Functions, ein Admin-Konto mit Rolle `admin`. Schritt für Schritt in `docs/setup.md`.

**Struktur für Browser + Android + iOS?** Ein Flutter-Code für alle drei. Breite ≥ 1180 px zeigt das Drei-Spalten-Cockpit, Handy bekommt die untere Navigation. Web-Build auf Firebase Hosting, dazu PWA, damit die App auch ohne Store installierbar ist. Ordnerstruktur in `docs/architecture.md`.

**Wie viele n8n-Flows?** Drei: Quellen prüfen (14 Tage), Reviewer benachrichtigen (plus Montags-Erinnerung), Jobs täglich. Das Übernehmen freigegebener Änderungen macht eine Cloud Function, nicht n8n.

**Wie groß ist das Backend?** Klein: 15 Firestore-Sammlungen, 6 Functions, 3 Flows, rund 1.100 Zeilen Code plus Daten. Eine Person kann es warten.

**Laufende Kosten?** Siehe Tabelle. Technik bei wenigen Hundert Nutzern grob €15–40 pro Monat; der größte Posten ist die Zeit der prüfenden Person.

### Laufende Kosten (Schätzung für 300 Nutzer)

| Posten | pro Monat | Grundlage |
| --- | --- | --- |
| Firebase (Firestore, Functions, Hosting, Auth) | €0–10 | Freikontingent 50.000 Lesevorgänge/Tag, 2 Mio. Function-Aufrufe/Monat ([Firebase-Preise](https://firebase.google.com/pricing)); bei 300 Nutzern knapp darüber |
| Claude für die Quellenprüfung | unter €2 | ca. 16 Extraktionen/Monat mit Sonnet 5.5, $2/$10 pro Mio. Token ([Preise](https://platform.claude.com/docs/en/about-claude/pricing)) |
| Claude für den Study Coach, sobald echt | €3–50 | 6.000 Nachrichten/Monat: Haiku 5.5 ca. $3, Sonnet 5.5 ca. $50 |
| n8n | €0 | läuft auf eurer bestehenden Instanz |
| Adzuna-API | €0 | Entwicklerkonto, Limits prüfen |
| WhatsApp-Benachrichtigungen | unter €2 | wenige Vorlagen-Nachrichten pro Monat |
| Apple Developer + Google Play | ca. €8 | $99/Jahr + $25 einmalig |
| Domain | €1–3 | je nach Endung |
| Prüfende Person | 2–4 Stunden alle 14 Tage | nicht in Euro geschätzt |

Schätzung ohne Gewähr; Preise können sich ändern. Bei 5.000 Nutzern steigen vor allem Firestore (ca. €30–60) und der Coach.

### Nächste Schritte

- [ ] Zunair: Repo `njia` anlegen, Firebase-Projekt `njia-prod` (europe-west), `docs/setup.md` abarbeiten
- [ ] Philipp: Prüfende Person benennen (E-Mail, WhatsApp) und in n8n eintragen; Gmail-Zugang und WhatsApp-Vorlage anlegen; Adzuna-Konto
- [ ] Marke und Domain prüfen (Njia / Njia Careers)
- [ ] Erste Freigaberunde: alle „Estimate“-Werte der zehn Länder gegen die offiziellen Seiten prüfen
- [ ] Flutter-App nach `docs/architecture.md` starten; Prototyp als Vorlage

## Phasenplan und offene Fragen

Vorschlag: zuerst wenige Korridore vollständig und geprüft, dann breiter. Die Zeiträume sind Annahmen, keine Schätzung aus Daten.

*(Diagramm im Original-Doc: Phase 1 Start-Korridore + konfliktarme Erlöse → Gate: Vertrauen/Rechtslage → Phase 2 Hochschulpartner/Anzeigen → Gate: Datenqualität → Phase 3 Vermittlung.)*

Konfliktarme Erlöse kommen zuerst; Hochschulprovisionen und Vermittlung erst, wenn Vertrauen, Rechtslage und Datenqualität stehen.

Offene Fragen:

- [x] Startkorridore: Sierra Leone → 10 europäische Länder
- [ ] Wer pflegt die Redaktion und gibt Änderungen frei (Name, E-Mail, WhatsApp-Nummer)?
- [ ] Welche Schulen, Hochschulen oder NGOs in Sierra Leone wären erste Partner?
- [x] Firma: Revana EOOD, Bulgarien; Vermittlungslizenz erst relevant, wenn Monetarisierung kommt
- [x] Name: Njia, im Store „Njia Careers“; Marke und Domain noch prüfen
