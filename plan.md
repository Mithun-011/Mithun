# GARUDA — Implementation & Design Plan

## Product interpretation and scope

Create GARUDA (Geo-Autonomous Rescue and Unified Disaster Assistance) as a responsive, people-first disaster-response operations console. Drone sensing is framed as assistive search: motion sensors surface possible human movement cues to prioritize help, never as proof that a person is present or as a basis for identifying or tracking people. The site demonstrates this with clearly identified synthetic sensor data, a schematic response map, and local-only interactions. It will not claim to provide real-time conditions, connect to emergency services, or dispatch responders.

The first view is an operations overview: a map-led picture of response sectors, simulated drone movement cues, an incident queue, response-team/resource status, and concise situational indicators. Users can select a people-signal map layer, inspect a cue's sector and uncertainty, request a simulated field-team verification, filter/search the sample incident queue, inspect an incident, change map overlays, and add a temporary demo incident. A movement cue is not a confirmed person or a confirmed need for assistance; a human responder remains responsible for verification. The UI must continuously disclose that feeds are simulated, that no live sensor or camera is connected, and that actions are not sent to a live system. Do not add face recognition, identity matching, or person tracking.

## Implementation approach

- Build a dependency-light static front end in semantic HTML, CSS, and browser JavaScript. The attached project repository is an empty initial scaffold; no existing app, content, or user data will be replaced.
- Use a hand-authored, schematic SVG map with synthetic sectors, routes, and markers. A map search was used as a visual reference, but third-party map imagery is not embedded because its accuracy and reuse terms were not established.
- Keep sample incidents, assets, and movement-sensor cues in a small JavaScript data model. Search, filters, selected-incident details, mutually exclusive map-layer controls, a demo-only incident form, and accessible feedback operate client-side and are not persisted.
- No external data APIs, credentials, authentication, dispatch integrations, or database writes are needed. The attached project's existing server/database capabilities remain unused.
- Serve `public/` on the project's existing Preview port (3000) with a static development server. Use `public/manus-routes.json` for the complete page route set. Static publication can serve the committed `public/` directory without a compilation toolchain.
- Add `app.config.ts` with a durable HTTPS GARUDA mark URL before creating a checkpoint.

## Project structure

- `public/index.html` — semantic application shell, navigation, overview, people-first drone cue panel, incident list, map, dialogs, and status disclosures.
- `public/styles.css` — responsive command-console styling, interaction states, focus treatment, and reduced-motion handling.
- `public/app.js` — synthetic incident/movement-signal datasets and client-side interactions.
- `public/manus-routes.json` — machine-readable page-route manifest (`/`).
- `public/garuda-mark.svg` — ownable GARUDA symbol used by the website.
- `app.config.ts` — quoted platform `logoUrl` metadata for the brand mark.
- `plan.md` and `TODO.md` — approved implementation direction and deliverable status.

## Design direction

- **Design movement:** Civic command minimalism informed by aviation wayfinding and Swiss information design: precise hierarchy, compact telemetry, and calm operational surfaces.
- **Core principles:** (1) Put people needing assistance before sensor instrumentation. (2) Keep a cue's uncertainty, location, and provenance visible together. (3) Treat a sensor as a lead for a human responder, never as an autonomous verdict. (4) Make every action legible and reversible in demo mode, with no identity tracking or live dispatch.
- **Color philosophy:** Deep ink (`#081521`) anchors the navigation and conveys steadiness; cool mist and paper surfaces protect readability; beacon lime (`#C6F45B`) is GARUDA's ownable signal for selected/available states; a distinct, soft aqua marks uncertain human-movement cues; amber and coral are reserved for escalating and critical incident states. Never rely on color alone to encode urgency or the presence of a person.
- **Layout paradigm:** An asymmetric mission console rather than a generic centered dashboard: narrow left command rail, an airy top situation band, a map-led main column, and a compact people-signal/incident/asset rail. On narrow screens, collapse the rail and stack map, cue review, queue, and resources in a clear reading order.
- **Signature elements:** A route-chevron/wing mark inside a small hexagonal coordinate frame; fine coordinate ticks and contour-like map lines; concise monospace telemetry paired with pill-shaped state labels.
- **Interaction philosophy:** Direct manipulation with clear focus, selected, empty, and feedback states. Selecting a movement cue exposes its synthetic sensor summary and human-verification step; the cue remains explicitly unconfirmed. Filters and sample incident creation affect only the local demo session. Any dispatch-like affordance must identify itself as unavailable in simulation rather than imply a live operation.
- **Animation:** Short 140–220 ms transitions for panels and state changes; a restrained pulse on the simulated active marker and status light; no constant page-wide motion. Honor `prefers-reduced-motion` by removing pulses and easing.
- **Typography system:** Manrope for the interface and display hierarchy, with a system sans-serif fallback; IBM Plex Mono for coordinates, timestamps, and telemetry, with a system monospace fallback. Large, compact headings; medium-weight labels; tabular numerals for metrics.
- **Brand essence:** “Put people first. Use every signal to guide a safer response.” It is for incident coordinators and field teams, distinguished by treating drone movement cues as leads for human verification within a calm geographic operations picture. **Personality:** composed, decisive, humane.
- **Brand voice:** Short, factual, action-led, never sensational. Example lines: “A movement cue is a lead—not a verdict.” and “People on the ground verify.” Interface copy must distinguish demonstration data from verified reports and never treat sensor motion as proof of a person.
- **Wordmark & logo:** A custom angular wing/route-chevron forms a forward-moving “G” inside a small hexagonal coordinate frame; the GARUDA wordmark uses carefully tracked uppercase lettering, not default unstyled text. The symbol remains recognizable at favicon scale.
- **Signature brand color:** Beacon lime `#C6F45B`.

## Project serving and constraints

The product is static and browser-local. Development listens on `0.0.0.0:3000`, the currently registered Preview port. The published output, if configured, is the `public/` directory with no backend requirement. Synthetic data, explicit simulation labels, responsive behavior, and functioning local controls are the product scope; live integrations are intentionally excluded until a data/dispatch contract is supplied.
