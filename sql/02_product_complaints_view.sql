-- Normalize four source period columns into a period-grain analytics view.
-- Trino UNNEST over aligned arrays preserves actual counts as released by FCA.
CREATE OR REPLACE VIEW iceberg.analytics.fca_product_complaints_long AS
SELECT product,
       product_group,
       reporting_period,
       complaint_opened_count
FROM iceberg.raw.fca_product_complaints
CROSS JOIN UNNEST(
    ARRAY['2024 H1', '2024 H2', '2025 H1', '2025 H2'],
    ARRAY["2024_H1", "2024_H2", "2025_H1", "2025_H2"]
) AS t(reporting_period, complaint_opened_count);

-- Product comparison query with explicit denominators and safe zero handling.
SELECT product, product_group,
       max(CASE WHEN reporting_period = '2025 H1' THEN complaint_opened_count END) AS h1_2025,
       max(CASE WHEN reporting_period = '2025 H2' THEN complaint_opened_count END) AS h2_2025,
       max(CASE WHEN reporting_period = '2025 H2' THEN complaint_opened_count END)
       - max(CASE WHEN reporting_period = '2025 H1' THEN complaint_opened_count END)
         AS change_count
FROM iceberg.analytics.fca_product_complaints_long
GROUP BY product, product_group
ORDER BY abs(change_count) DESC;
