/*What is the percentage of unique product increase in 2021 vs. 2020? The final output contains these fields*/
with cte1 as (SELECT count(distinct product_code) as unique_product_2020
 FROM gdb0041.fact_sales_monthly
 where fiscal_year=2020),
 cte2 as(select count( distinct product_code) as unique_product_2021
 from fact_sales_monthly
 where fiscal_year=2021)
 select cte1.unique_product_2020, cte2.unique_product_2021,
 ((cte2.unique_product_2021-cte1.unique_product_2020)/cte1.unique_product_2020)*100 as percentage_chg
 from cte1, cte2
