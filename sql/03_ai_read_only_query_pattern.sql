-- AI enablement starter: expose only reviewed aggregate views.
-- The model must not have credentials for raw tables or write access.
-- A gateway should validate an allowlisted query/template, execute as the
-- requesting user's authorized role, and return source period + URL metadata.
--
-- Example deterministic query for a natural-language question about overdrafts:
SELECT product, product_group, reporting_period, complaint_opened_count
FROM iceberg.analytics.fca_product_complaints_long
WHERE product = 'Overdrafts'
  AND reporting_period IN ('2025 H1', '2025 H2')
ORDER BY reporting_period;
--
-- The answer is sourced from the FCA public table and should be accompanied
-- by the official FCA source URL. The language model should not infer why the
-- count changed; the dataset contains no evidence of causal drivers.
--
-- Evaluation cases should include: valid question, missing period, unknown
-- product, denominator caveat, “why” question, prompt injection and access
-- denial. Check SQL result accuracy, citation coverage and safe abstention.
