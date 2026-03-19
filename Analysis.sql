-- ================================================
-- GoodThought NGO Impact Analysis
-- ================================================

-- QUERY 1: Highest Donation Assignments
-- Identifies the top 5 assignments by total donation amount
-- using a CTE to join assignments, donations and donors tables
WITH donation_summary AS (
    SELECT
        a.assignment_id,
        a.assignment_name,
        a.region,
        dr.donor_type,
        ROUND(SUM(d.amount)::numeric, 2) AS rounded_total_donation_amount
    FROM assignments AS a
    JOIN donations AS d ON a.assignment_id = d.assignment_id
    JOIN donors dr ON d.donor_id = dr.donor_id
    GROUP BY a.assignment_id, a.assignment_name, a.region, dr.donor_type
)
SELECT
    assignment_name,
    region,
    rounded_total_donation_amount,
    donor_type
FROM donation_summary
ORDER BY rounded_total_donation_amount DESC
LIMIT 5;


-- QUERY 2: Top Regional Impact Assignments
-- Identifies the highest impact assignment per region
-- using ROW_NUMBER() window function
WITH assignment_impact AS (
    SELECT
        a.assignment_id,
        a.assignment_name,
        a.region,
        a.impact_score,
        COUNT(d.donation_id) as num_total_donations,
        ROW_NUMBER() OVER (PARTITION BY a.region ORDER BY a.impact_score DESC) as rn
    FROM assignments a
    JOIN donations d ON a.assignment_id = d.assignment_id
    GROUP BY a.assignment_id, a.assignment_name, a.region, a.impact_score
)
SELECT
    assignment_name,
    region,
    impact_score,
    num_total_donations
FROM assignment_impact
WHERE rn = 1 AND num_total_donations >= 1
ORDER BY region;
