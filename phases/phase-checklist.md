# Phase checklist and evidence register

This checklist is for the FCA public-data complaints analytics project. Mark items complete only when an accountable reviewer has seen the evidence.

| Phase | Evidence to retain | Ready to proceed when |
|---|---|---|
| 0 Charter | Scope, users, RACI, purpose, risks, public-data boundary | Sponsor accepts analytics scope and AI decision boundary |
| 1 Discover | Source inventory, definition map, grain, cadence, null/taxonomy notes | Each field has traceable source, meaning, period and use |
| 2 Design | Architecture records, contracts, access, quality, retention and AI controls | Design reviewers agree decisions or own open actions |
| 3 Foundation | Environment, identity/grant tests, secret handling, recovery approach | Non-production deployment and recovery are repeatable |
| 4 Acquire | FCA source URL, retrieval date, source/version date, licence, checksum, parser version | A release is retrievable and structural changes are reviewed |
| 5 Land | Dated immutable source snapshot, Iceberg schema, row/period checks | Values and source totals reconcile; source blanks remain null |
| 6 Curate | SQL, metric definitions, change metrics, quality evidence, analyst review | Measures trace back to official table and have approved meaning |
| 7 Govern | Catalog, owner, steward, glossary, licence, lineage, access tests | Consumers can discover and trace each product |
| 8 Serve | Superset dashboards, permission review, reconciliation, feedback | Intended users can interpret metrics and limitations |
| 9 AI | Use-case card, allowlisted views, SQL contract, citations, evaluation, fallback | Numeric answers are traceable; unsupported questions are declined |
| 10 Operate | Release process, SLO proposals, alerts, incidents, change and review calendar | Named teams accept support and revision handling |

## Source refresh manifest

- Publication title and reporting period
- Official source URL and access timestamp
- FCA publication/update date and notes
- Licence/attribution
- Source file checksum and source snapshot identifier
- Parser/SQL version
- Expected and observed headers/periods/row counts
- Reconciliation results against FCA published totals
- Differences, steward decision and release version

## Data issue record

- Issue ID and source snapshot
- Product/period/table/field and quality rule
- Description and analyst impact
- Owner, severity, work-around, due date
- Whether FCA revised the source or project parsing caused the issue
- Correction/version and reconciliation evidence
- Preventive change

## AI evaluation record

- User question and intended use
- Allowed product/view and generated or selected SQL
- Expected result from deterministic query
- Returned period and FCA source citation
- Correctness, grounding, unsupported-claim and abstention result
- Human reviewer, defect and remediation

