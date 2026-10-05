# Sources and evidence notes

Checked 2 September 2026. Dataset values in `data/` are transcribed from the FCA’s official 2025 H2 complaints tables. The FCA states that the data is available under the Open Government Licence. No consumer-level complaint records are included.

## Dataset sources

| Source | Use | Notes / limits |
|---|---|---|
| [FCA aggregate complaints data: 2025 H2](https://www.fca.org.uk/data/complaints-data/aggregate-complaints-data-2025-h2) | Product-level volumes and market outcomes for 2024 H1 through 2025 H2 | FCA source tables identify categories, values and periods. FCA reports data revisions following firm resubmissions. The values are aggregates, not complaint rows. |
| [FCA firm-specific complaints data](https://www.fca.org.uk/data/complaints-data/firm-level) | Official source description for firm-level complaints data and reporting fields | Firms below specified publication thresholds are not included at firm detail; use aggregate tables for broader coverage. This portfolio uses market/product aggregates to keep scope consistent. |
| [FCA complaints data — about the data](https://www.fca.org.uk/data/complaints-data/about-data) | Reporting cadence, coverage and comparability context | FCA publishes twice yearly. Historic definitions/reporting have changed, so comparisons across long periods require explicit review. |
| [Open Government Licence](https://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/) | Reuse terms | Follow attribution and any third-party rights noted by the publisher. Recheck source terms when refreshing. |

## Software sources

| Project | Primary documentation/licence |
|---|---|
| Apache NiFi | [User guide](https://nifi.apache.org/nifi-docs/user-guide.html) · [Apache-2.0 licence](https://github.com/apache/nifi/blob/main/LICENSE) |
| Apache Iceberg | [Table specification](https://iceberg.apache.org/spec/) · [Licence](https://github.com/apache/iceberg/blob/main/LICENSE) |
| Trino | [Object storage documentation](https://trino.io/docs/current/object-storage.html) · [Repository/licence](https://github.com/trinodb/trino) |
| OpenMetadata | [Documentation](https://docs.open-metadata.org/) · [Licence](https://github.com/open-metadata/OpenMetadata/blob/main/LICENSE) |
| Apache Superset | [Documentation](https://superset.apache.org/docs/) · [Repository/licence](https://github.com/apache/superset) |

## UK context (not a compliance determination)

- [FCA Consumer Duty Handbook, PRIN 2A](https://handbook.fca.org.uk/handbook/prin2a) — consider relevant obligations and firm-specific applicability when designing real outcomes analytics.
- [FCA FG22/5 on the Consumer Duty](https://www.fca.org.uk/publication/finalised-guidance/fg22-5.pdf) — supervisory guidance; do not treat this portfolio as a compliance assessment.
- [UK government initial guidance on AI regulatory principles](https://www.gov.uk/government/publications/implementing-the-uks-ai-regulatory-principles-initial-guidance-for-regulators/implementing-the-uks-ai-regulatory-principles-initial-guidance-for-regulators) — context for responsible AI discussions; applicability must be assessed for the actual use.
- [ICO summary of the Data Use and Access Act 2025](https://ico.org.uk/about-the-ico/what-we-do/legislation-we-cover/data-use-and-access-act-2025/the-data-use-and-access-act-2025-what-does-it-mean-for-organisations/) — check current data protection status and guidance at implementation time.

## Factual boundaries

- The project is an independent analysis and reference architecture, not an FCA engagement or a real bank assignment.
- The table values are real source-published aggregates, not generated or sampled synthetic data. They are not event-level or customer-level observations.
- The FCA reporting data is released periodically and may be revised. Treat each source version as a dated snapshot.
- A value “per 1,000” is product-contextualized using denominators defined in the FCA source; categories may use different denominator bases.
- Tool documentation establishes component features, not successful integration, fitness, or compliance of this target architecture.

