-- Trino SQL starter checks. Use actual configured catalogue/schema names.
-- Record results with source snapshot/version; route exceptions to data steward.

-- Required fields and valid value ranges for product volumes
SELECT product, product_group
FROM iceberg.raw.fca_product_complaints
WHERE product IS NULL OR product_group IS NULL
   OR "2024_H1" IS NULL OR "2024_H2" IS NULL
   OR "2025_H1" IS NULL OR "2025_H2" IS NULL
   OR "2024_H1" < 0 OR "2024_H2" < 0
   OR "2025_H1" < 0 OR "2025_H2" < 0;

-- Product key uniqueness at source grain
SELECT product, count(*) AS copies
FROM iceberg.raw.fca_product_complaints
GROUP BY product
HAVING count(*) <> 1;

-- Context rows should contain only products present in the product table.
-- Source omits at least one product from the context table; do not fabricate a
-- context row to force a one-to-one join.
SELECT c.product
FROM iceberg.raw.fca_product_complaints_context c
LEFT JOIN iceberg.raw.fca_product_complaints p USING (product)
WHERE p.product IS NULL;

-- Report product categories without a context row as source coverage metadata.
SELECT p.product
FROM iceberg.raw.fca_product_complaints p
LEFT JOIN iceberg.raw.fca_product_complaints_context c USING (product)
WHERE c.product IS NULL;

-- Check percentage fields are 0-100 (percent points, not fractions)
SELECT reporting_period
FROM iceberg.raw.fca_market_complaints_summary
WHERE closed_within_3_days_pct NOT BETWEEN 0 AND 100
   OR closed_over_3_days_within_8_weeks_pct NOT BETWEEN 0 AND 100
   OR closed_over_8_weeks_pct NOT BETWEEN 0 AND 100
   OR upheld_pct NOT BETWEEN 0 AND 100;

-- Closure timing percentages should approximately reconcile to 100;
-- allow rounding tolerance of 0.02 percentage points.
SELECT reporting_period,
       closed_within_3_days_pct
       + closed_over_3_days_within_8_weeks_pct
       + closed_over_8_weeks_pct AS total_pct
FROM iceberg.raw.fca_market_complaints_summary
WHERE abs(closed_within_3_days_pct
       + closed_over_3_days_within_8_weeks_pct
       + closed_over_8_weeks_pct - 100) > 0.02;

-- Inspect product-level change with actual counts, avoiding division by zero.
SELECT product, product_group, "2025_H1", "2025_H2",
       "2025_H2" - "2025_H1" AS change_count,
       CASE WHEN "2025_H1" = 0 THEN NULL
            ELSE 100.0 * ("2025_H2" - "2025_H1") / "2025_H1"
       END AS change_pct
FROM iceberg.raw.fca_product_complaints
ORDER BY abs("2025_H2" - "2025_H1") DESC;

