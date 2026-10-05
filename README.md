# UK Financial Services Complaints Data Fabric & AI Analytics

A phase-by-phase portfolio project built on **real FCA-published UK financial services complaints data**. It uses a composable open-source analytics stack: Apache NiFi, Apache Iceberg, Trino, OpenMetadata and Apache Superset.

## Start here

1. Open [`index.html`](index.html) for the browser prototype, populated from the bundled FCA tables.
2. Read [`Project-Guide.md`](Project-Guide.md) for the business problem, A-to-Z delivery plan and interview walkthrough.
3. Read [`Architecture.md`](Architecture.md) for the stack, platform boundaries and design decisions.
4. Inspect [`data/`](data/) and its provenance notes before interpreting or refreshing any measure.
5. Use [`sql/`](sql/) for source contracts, quality checks, analytical marts and the read-only AI query pattern.
6. Review [`sources.md`](sources.md) for official source and licence references.

## Data policy

**This project contains no synthetic data or fabricated records.** The bundled CSVs are tabular extracts/transcriptions of values presented in FCA’s published complaints tables. They represent market-level and product-level aggregates, not individual consumer complaints. Dataset provenance, table meanings, coverage and limits are documented in [`data/README.md`](data/README.md).

The FCA publishes complaint statistics every six months. This project therefore demonstrates real-world analytics with a periodic refresh workflow, not real-time payment or customer monitoring. The public dataset cannot support claims about a particular bank’s internal systems or individual customers.

## Case statement

Financial services teams and analysts need a traceable way to explore complaints volumes, handling outcomes, redress and contextualised product rates across reporting periods. Published data arrives as official tables with product taxonomy, missing context values, revisions and interpretation notes. A fabric-style analytics layer should preserve provenance, make definitions and refresh history discoverable, and expose reviewed metrics to analytics and carefully bounded AI assistance.

This is an independent portfolio analysis using FCA-published data; it is not a real client engagement, an FCA system, or a claim of endorsement.

## Stack

Apache NiFi for scheduled acquisition/validation, Iceberg for governed analytical tables, Trino SQL for transformations, OpenMetadata for catalog/ownership/lineage, Superset for dashboards, and an optional model gateway with read-only access to approved aggregate products. These are distinct projects; integrations need implementation and validation.

## Prototype and deployment boundary

The browser prototype runs locally without services. SQL is a starter and requires a provisioned Trino/Iceberg catalogue. No platform has been deployed, no model has been trained, and no forecast or live AI result is claimed.

## Project map

| Path | Contents |
|---|---|
| `index.html` | Interactive public-data dashboard, fabric map, AI guardrails and phases |
| `Project-Guide.md` | Problem statement, phases, governance, AI enablement and interview walkthrough |
| `Architecture.md` | Reference architecture and design decisions |
| `sources.md` | Verified project, FCA and UK references |
| `data/` | Real FCA product, context-rate and market outcome aggregates |
| `sql/` | Trino starter contracts, checks and product views |
| `phases/phase-checklist.md` | Phase exits and retained evidence |
