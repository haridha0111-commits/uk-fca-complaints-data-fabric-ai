# FCA public complaints tables: provenance and interpretation

## Files

- `fca_product_complaints.csv`: 50 product-category aggregates with FCA product-group labels and four reporting-period values (2024 H1, 2024 H2, 2025 H1 and 2025 H2). The source page identifies these as volumes of opened complaints by product.
- `fca_product_complaints_context.csv`: 49 product categories from the FCA context table, with values for complaints per 1,000 relevant accounts, balances, policies or agreements. `Pensions packaged multi products` is not listed in that source table; the project does not add a made-up row to fill the gap.
- `fca_market_complaints_summary.csv`: four periods of market-level complaints closed, timing bands, upheld counts/rate, and redress.

Every number and product label in these CSVs is copied from the FCA’s published HTML tables. This is an exact table transcription into CSV shape to make the data easier to query; it is not an event-level source file. We do not include generated sample rows. Source pages and licence are linked in `../sources.md`.

`source-manifest.csv` records source URL, extraction date, grain and SHA-256 for each CSV. The FCA’s original XLSX remains available from the linked official publication page; this project bundles the public table values in CSV form rather than the workbook.

## Provenance

- Publisher: Financial Conduct Authority (FCA)
- Publication: Aggregate complaints data: 2025 H2
- Reporting periods represented: 2024 H1, 2024 H2, 2025 H1, 2025 H2
- Latest release page date: 28 April 2026; source update notice: 15 May 2026
- Extraction date: 2 September 2026
- Licence: Open Government Licence, as stated by FCA page and data.gov.uk resource metadata
- Source page: https://www.fca.org.uk/data/complaints-data/aggregate-complaints-data-2025-h2

The FCA says it updated 2025 H1 and H2 figures on 15 May 2026 after investigating a reporting anomaly in one firm’s return. Treat these figures as a dated publication snapshot, and check for revisions on refresh.

## Important semantics and limits

1. “Opened” volumes and “closed” outcomes are distinct measures and should not be joined as if each row were one complaint.
2. The FCA’s context measure refers to complaints per 1,000 relevant policies, balances, accounts or agreements. The base differs by product. Do not compare across categories as if the denominator were identical.
3. A blank cell in the source context table remains null. It does not mean zero. A product absent from the context table remains absent and is not manufactured during the extraction.
4. Zero complaint counts are real source values and remain zero.
5. Some reports are updated after firms resubmit data. Preserve each version and document changes.
6. The source is aggregated. It contains no individual complaint narrative, customer identity, account record or transaction.
7. Reporting-frequency and classification changes can limit comparisons outside these four periods. Use FCA notes before extending the time series.
8. The FCA aggregate data scope may exclude certain consumer-credit-only reporting; consult the source notes when defining a real analytical question.

## Attribution

When reusing these values, attribute the FCA, link the official source and follow the [Open Government Licence](https://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/). Check the live source and licence before redistributing a refreshed extract.

