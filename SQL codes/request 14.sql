/*Which channel helped to bring more gross sales in the fiscal year 2021 and the percentage of contribution?*/
WITH channels as (SELECT 
						channel,
						(SUM(sold_quantity * gross_price) / 1000000) as gross_sales_mln
				FROM fact_sales_monthly as fm
				JOIN fact_gross_price as fp
				ON fm.product_code = fp.product_code
				JOIN dim_customer as dc
				ON fm.customer_code = dc.customer_code
				WHERE fm.fiscal_year = 2021
				GROUP BY channel
				ORDER BY gross_sales_mln DESC )

SELECT *,
		ROUND(gross_sales_mln * 100 / (SELECT SUM(gross_sales_mln) FROM channels) ,2) as pct_contributions
FROM channels
