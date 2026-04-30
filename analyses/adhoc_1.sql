WITH country_sales AS (
    SELECT 
        country,
        SUM(sales) AS total_sales
    FROM {{ ref('country_mapping') }}
    GROUP BY country
)

SELECT *
FROM country_sales
ORDER BY total_sales DESC;