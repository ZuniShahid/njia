# Prototype notes – what `app/prototype/njia.html` does (v8)

Open the file in a browser (no server needed). It is the approved reference for the Flutter app: screen structure,
copy, behaviour and visual tokens. Sample data only; the real app reads Firestore (`docs/data-model.md`).

## Global shell
- **≥1180 px**: left nav (goal switcher on top, groups *Your goal / Your path / Go global / Support*, user card at bottom) · center column · right panel (foldable with "Hide panel", state remembered). Center and right scroll independently.
- **<1180 px**: right panel becomes a slide-in sheet; **<860 px**: bottom nav with "More" sheet.
- Top bar: job search field (Enter → Jobs view), notifications bell, avatar menu (profile, sign out).
- Goal switcher drawer: up to 5 goals, each with title, place, target year, feasibility; "Add goal" form (role, employer, country, city, year, path type).
- Scroll-triggered **chatbot peek** (bottom right): appears 2 s after the user starts scrolling, shows **one** context question for the current view/step; opens a chat panel with 3 context prompts + free text. Closes on route change on mobile.
- Hash routing (`#cockpit`, `#roadmap`…), state in localStorage. Dark mode via `prefers-color-scheme`.
- Tokens: brand green `--brand`, accent, phase colours `--p1…--p6`, 12 px radius cards, Inter-like system font, numbers in tabular figures.

## Views (center column · right panel)
| Route | Center | Right panel |
| --- | --- | --- |
| `#cockpit` | Greeting + open tasks; hero card with goal title, place, target year, metrics (years to goal, steps done, current phase, readiness), phase strip; "Next milestone" card with progress bar and next 3 items; "This week" task list with checkboxes; mini Gantt | "Your chances": feasibility + difficulty scores with drivers; "Next best action" card (links to roadmap step); upcoming deadlines |
| `#milestone` | Current milestone checklist grouped by area; each item: status (done/in progress/missing), due date, help buttons (coach, tutor, mentor, guide); milestone selector | Progress by area, "What you told us" |
| `#map` (Big picture) | 9 pools as floating connected bubbles (Requirements, Pathways, Recognition, Visa & residence, Money, Jobs, Helpers, Trust, Profile hub). Two layouts: *Web* (free, draggable) and *Order of work* (Requirements → Pathways → Money → Visa → Jobs). Bubble size/fill = status %; weakest pool pulses "start here". Click bubble → enlarged with challenges + necessities + link to the view; drag one next to another → dependency explained; links clickable with explanation; hover shows %; keyboard (Tab, Enter/Space); legend; "Start here" list | Selected pool detail (on small screens inline); "Ask the coach about this" |
| `#roadmap` | Full-width Gantt: phases (rows) × years, steps as bars, today marker, optional steps dashed; click step → detail drawer (what, cost, deadline, requirements, "Ask coach"); **below** the Gantt: "Decision points" (tile grid) and "Watch out" cards. Right panel hidden on this view. | – |
| `#readiness` | Overall score ring; dimensions (education, language, experience, documents, money) with tick-able requirements; score updates live; "Biggest levers" | Requirements list with provenance chips, "Help & tutoring" |
| `#finances` | Tabs: Overview (funding gap, cost to apply, balance by year chart), Finance it (scholarships, loans, blocked account per phase), Scenarios | Funding gap summary, "Biggest levers" |
| `#visa` | Country selector (10 destinations); for the goal country: permit types, fee, processing time, work rights, embassy responsible for Sierra Leone, proof of funds; each fact with provenance chip ("Checked · source" / "Estimate · to verify"); trust alerts | Requirements for this permit, documents to prepare |
| `#jobs` | Search + filters (country, level, salary, remote); job cards (title, employer, place, salary range, visa sponsorship flag, match %, source + fetched date); save/apply; "For these filters" summary | Saved jobs, salary context for the occupation |
| `#coach` | Tabs **Path coach** (topic = whole plan / phase / step, context chips, suggested questions, chat, free text) and **Study coach** (modes, chat that guides without writing, draft box with "Check paragraph" feedback) | Topic card, "Open it in the plan", other help; study tab: transparency log (sentences you wrote / hints / text written by coach = 0), recent sessions |
| `#documents` | Document checklist by category (identity, education, language, finance, visa) with status, upload, expiry; filter | Missing documents, "Cost to apply" |
| `#profile` | Accordion sections: About you · Education · Languages (CEFR) · Experience · Interests & values (chips + "Add your own…") · Strengths & skills (chips + "Add your own…") · Money (savings, monthly support, who supports – never shown to employers) · Mobility & constraints (earliest move year, graduation year, passport valid until, preferred countries, "things the plan must respect") · Notifications · Security (2-step) | Profile completeness (14 fields) with bar, "Your goals" list, manage goals |

## Behaviours to keep
- Every number from content shows a provenance chip; estimates are visibly different (amber "Estimate · to verify").
- Scores recompute instantly when the user ticks a requirement, changes money, or changes the move year (engine port in Dart; server plan stays canonical).
- Custom chips (interests/strengths) are user data, stored on the profile, removable.
- Coach never writes text for the student; the study-coach transparency log must stay.
- Copy is short, second person, English. No marketing language inside the app.
- Reduced-motion users get no pulse/flow animations on the Big picture.

## Not in the prototype (build from the docs instead)
Auth screens, onboarding, admin review queue (`/admin/changes`), real data loading/caching, push notifications, offline sync.
