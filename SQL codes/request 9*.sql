/*Follow-up: Which segment had the most increase in unique products in 2021 vs 2020?*/
with cte1 as (SELECT p.segment, 
count(distinct product_code) as unique_product_2020
 FROM gdb0041.dim_product p
 join fact_sales_monthly s
 using (product_code)
 where s.fiscal_year=2020
  group by p.segment),
 cte2 as (SELECT p.segment,
count(distinct product_code) as unique_product_2021
 FROM gdb0041.dim_product p
 join fact_sales_monthly s
 using (product_code)
 where s.fiscal_year=2021
  group by p.segment)
 SELECT 
    cte1.segment,
    cte1.unique_product_2020,
    cte2.unique_product_2021,
    (cte2.unique_product_2021 - cte1.unique_product_2020) AS difference
FROM 
    cte1
JOIN 
    cte2 ON cte1.segment = cte2.segment
    order by difference desc;
