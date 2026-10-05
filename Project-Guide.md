# Project guide: UK complaints analytics data fabric and AI enablement

## 1. Project brief

### Context

This portfolio project uses actual Financial Conduct Authority (FCA) complaints data published for UK financial services. The FCA tables contain product-level and market-level aggregate values. They do **not** contain individual complaint narratives or customer/account records. The bundled values are transcribed from the FCA’s official tables and are linked to their source and Open Government Licence in `sources.md`.

This is an independent analytical reference case, not a real engagement for a named consultancy, bank or regulator. The project does not claim the FCA or any financial firm commissioned or endorsed it.

### Problem statement

Public financial-services complaints data is published across tables with distinct grains and definitions: product volumes, contextualised rates, market handling outcomes, upheld complaints and redress. A Data & AI Fabric lead must make these datasets traceable, interpretable and reusable across analytics, while preserving source versions, reporting periods, taxonomy, missing values and known revisions. Analysts need to compare results without confusing market aggregates with firm performance or treating descriptive changes as evidence of cause.

### Outcome

Deliver a governed public-data product that supports analysis of complaints volumes and handling outcomes across FCA reporting periods. Demonstrate acquisition, quality/reconciliation, metadata/lineage, SQL products, dashboards and a carefully bounded AI assistant design that uses only approved aggregate tables and cites its data period and source.

## 2. Dataset scope and actual findings

Bundled CSVs cover the FCA tables’ 50 product categories for four periods: 2024 H1, 2024 H2, 2025 H1 and 2025 H2; a second table records the source’s contextualised product values; a third stores market outcomes for those same periods. The source says the H1/H2 2025 figures were updated on 15 May 2026 after a reporting anomaly was investigated. Consult `data/README.md` for exact extraction and interpretation notes.

Examples verified in FCA’s tables:
- Current-account complaint volume: 541,493 in 2025 H1 and 492,149 in 2025 H2.
- Credit-card complaint volume: 211,903 in 2025 H1 and 218,456 in 2025 H2.
- Overdraft complaints: 16,188 in 2025 H1 and 26,456 in 2025 H2.
- The contextualised measure is reported per 1,000 relevant policies, balances, accounts or agreements; it is not one uniform denominator across products.
- For 2025 H2, the FCA reports 1,720,632 complaints closed, 955,698 upheld and £235,790,584 redress (market-level table).

These are published facts from the FCA, not project-generated values or firm-specific diagnoses. Always include the relevant reporting period and measure definition beside a figure.

## 3. Users and questions

**Intended users:** data analysts, complaints/outcomes analysts, product owners, data stewards, data engineers and risk/control reviewers exploring public aggregate data.

Business questions:
1. How have opened complaint volumes changed by product and product group over the included reporting periods?
2. Which product categories show the largest absolute or percentage change, and what are the base counts?
3. How does each product’s source-reported contextual measure change? Are values missing or subject to comparability caveats?
4. How did market-level closure bands, upheld totals and redress move between reporting periods?
5. What is the source, publication/update date, lineage and quality status of each dashboard metric?
6. Can a read-only AI assistant return bounded answers with SQL-backed values and official-source citations?

Do not infer the cause of a change from aggregate tables alone. A market-level change is not evidence of any individual firm’s performance or consumer outcome.

## 4. Delivery, phase by phase

### Phase 0 — Charter and framing
Agree that the work analyzes public FCA data. Set scope, intended users, project roles, definitions, deliverables, decision log and risks. State that there is no actual client engagement. Decide whether to publish the source-derived tables with OGL attribution and source links.

**Deliver:** charter, scope, stakeholder map, RACI, assumptions and source list.
**Exit:** sponsor accepts bounded public-data analytical purpose and AI use.

### Phase 1 — Discover and assess the sources
Review source pages, dates, update notes, downloadable tables, labels, reporting periods, missing values, definitions and licence. Confirm table grain: product-period; contextualised product-period; market outcome-period. Preserve FCA wording and source taxonomy. Identify what is excluded, including complaint narratives and consumer records.

**Deliver:** source inventory, field map, glossary draft, data-product canvas, definition and comparability notes.
**Exit:** every field has a source, meaning, grain, usage rule and null policy.

### Phase 2 — Define architecture and controls
Design scheduled retrieval of FCA releases, snapshot/version handling, raw and curated zones, schema validation, Iceberg table model, Trino SQL, OpenMetadata metadata, Superset access and optional AI gateway. Define ownership, roles, audit logging, retention, source update alerts, recovery and deployment requirements.

**Deliver:** architecture diagram, decision records, contracts, access matrix, data-quality plan, threat-model actions.
**Exit:** architecture/security/operations reviewers accept the design or record open decisions with accountable owners.

### Phase 3 — Build platform foundation
Provision separate development and controlled environments. Configure identity, secrets, network, storage, catalog, Trino connector, monitoring, backups and release process. Keep source credentials out of the repository; the public source does not require a secret in the portfolio.

**Deliver:** environment records, least-privilege test evidence, deployment and recovery notes.
**Exit:** non-production deployment and recovery are repeatable.

### Phase 4 — Acquire and snapshot source
On each FCA publication, retrieve the new source file/table through the approved method. Retain dated source snapshot and capture URL, release/update dates, licence, checksum, retrieval time and parser version. Validate expected worksheets/headers, reporting periods and total checks before publishing.

**Deliver:** NiFi flow, source manifest, raw snapshot, retrieval runbook, failure route and reconciliation record.
**Exit:** source changes cannot silently overwrite prior snapshots; a steward reviews unexplained structural/value changes.

### Phase 5 — Land data in Iceberg
Create typed tables for product complaints, contextualised rates and market outcomes. Retain original FCA labels and values alongside normalized product/period keys. Keep absent source observations null (not zero); do not invent denominator values. Record source snapshot and load metadata.

**Deliver:** source-aligned tables, schema/version approach, lineage metadata and retention decisions.
**Exit:** row counts, period coverage and official totals reconcile with documented differences.

### Phase 6 — Curate analytics with Trino SQL
Build views for product-period comparisons, absolute/percentage changes, market closure outcomes and redress. Treat percentage change from zero carefully; apply a minimum-base warning rather than reporting an undefined/infinite percentage. Keep counts distinct from per-1,000 contextual measures.

**Deliver:** reviewed SQL, metric glossary, quality outputs and business interpretation notes.
**Exit:** an analyst can trace each displayed figure to an FCA table and period.

### Phase 7 — Catalog, lineage and access
Register each product, definition, source, owner/steward, publication cadence, licence, refresh state, quality results and lineage. Verify each important edge. Set consumer roles and validate approved/denied access to curated views. Route data issues and release changes to named owners.

**Deliver:** catalog entries, ownership, glossary, verified lineage, access tests and issue process.
**Exit:** user can find, understand, trace and request access to a product.

### Phase 8 — Publish analytics
Build Superset views for product trends, change ranking with base counts, context rates, and market outcomes. Label every chart with source date, period, unit and aggregation. Provide filters without implying that public market data is bank-internal. Reconcile dashboard to SQL/source before acceptance.

**Deliver:** dashboard, metric definitions, access reviews, user guide and feedback.
**Exit:** intended users can answer agreed questions with clear caveats.

### Phase 9 — Enable AI safely
**Use case:** an analyst asks a natural-language question such as “Which product complaint volumes rose between 2025 H1 and H2, and how many complaints were reported in each period?” The assistant routes to a fixed set of read-only curated views, runs or references deterministic SQL, and responds with counts, calculation, period and FCA source link.

Controls: schema allowlist; read-only SQL; row/column controls outside the model; query timeout and result caps; prompt-injection tests; source/period citation; no answer when evidence is missing; audit records; human review for externally reused summaries. Use templates for “why” questions that explain the limits instead of fabricating causes. Do not fine-tune on or invent complaint records.

**Deliver:** intended-use card, allowed-question set, SQL/result contract, citation rules, evaluation cases, human oversight, monitoring and fallback.
**Exit:** all numeric answers trace to controlled SQL; unsupported or out-of-scope questions are safely declined. Any real deployment receives relevant privacy, security, conduct and model-risk approvals.

### Phase 10 — Release and run
Schedule checks around FCA publication periods. Monitor retrieval failures, schema drift, period completeness, reconciliation, catalog freshness, dashboard query health, AI citation/grounding failures and user feedback. Manage source revisions by publishing a new version and documenting the change rather than erasing history.

**Deliver:** service ownership, support route, SLO proposals, alerts, incident/recovery and change runbooks, review calendar.
**Exit:** named teams accept operational ownership.

## 5. Operating model starter

| Decision/work | Product lead | Data steward | Data/platform engineering | Analytics | Risk/control owners |
|---|---|---|---|---|---|
| Scope and user outcomes | A/R | C | C | C | C |
| Source meaning, taxonomy and nulls | C | A/R | C | C | I |
| Acquisition and table operations | C | C | A/R | I | C |
| Metric definitions and interpretation | A | R | C | R | C |
| Access, privacy and security controls | I | C | R | I | A |
| AI intended use and approval | R | C | C | R | A |
| Release and service handover | A | C | R | R | C |

A = accountable, R = responsible, C = consulted, I = informed. Use actual accountable roles in a real organization.

## 6. Governance and evidence checklist

- Source manifest and OGL attribution; dated immutable source snapshots.
- Definition, owner, steward, product classification and allowed use.
- Schema and period checks, null handling, product taxonomy changes.
- Reconciliation against official published totals and row coverage.
- Data quality issue log, correction history and change approvals.
- Catalog metadata, glossary terms and verified lineage.
- Read-only least-privilege access, audit and query retention choices.
- Dashboard caveats, numerical source links and user acceptance.
- AI use-case approval, SQL allowlist, citations, evaluation, monitoring, fallback and human review.
- Dependency/licence inventory and support/exit plan for open-source stack.

This is a project control framework, not a declaration of regulatory compliance.

## 7. Measures

Agree service targets after discovery. Candidate operational metrics:
- source refresh success and duration after a release is available;
- period/product completeness and official-total reconciliation variance;
- missing/null contextual-rate proportion tracked against the source, not forced to zero;
- number of assets with owner, definition, licence, freshness and lineage;
- dashboard reconciliation defects and consumer adoption;
- AI answer grounding rate, citation coverage, abstention quality and human correction rate.

Do not set invented performance targets or treat the four-period public history as a predictive benchmark.

## 8. Interview walkthrough (5 minutes)

1. Explain that the project uses actual FCA-published aggregate records, not a made-up bank or simulated transactions.
2. Show the source page and the exact data grain; point out the 2025 H1/H2 update note.
3. Follow an FCA product-period value through snapshot, Iceberg table, Trino view, catalog lineage and Superset chart.
4. Show one count and one contextualized rate; clarify that the latter uses product-specific denominators.
5. Show controls for nulls, source revisions, access and reconciliation.
6. Present the AI assistant as read-only analyst support: SQL-grounded counts with period/source citations and abstention on unsupported cause questions.
7. Close with phases, open production decisions and how a client’s actual objectives would be discovered rather than presumed.

## 9. Discussion prompts

- Why use a data-fabric pattern rather than a standalone BI import? Discuss reusable product contracts, metadata, lineage, controlled updates and governed consumption.
- What does FCA publication cadence mean for freshness? The data is semiannual; no real-time claim is valid.
- What is the risk in interpreting the contextual rate? Different denominator bases and source blanks make cross-product comparison unsafe without definition.
- How do revisions affect analytics? Version releases, retain snapshots, recompute, compare and record impact.
- Why does AI not answer “why did complaints rise?” The dataset has counts and categories, not evidence of causal drivers.
- What would be different inside a bank? Internal case-level data, lawful-use assessment, access controls, security, data-quality ownership, operational outcome definitions and model-risk approval would all be required.

