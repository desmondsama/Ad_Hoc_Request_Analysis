/*Get the complete report of the Gross sales amount for the customer “Atliq Exclusive” for each month in FY 2020 and 2021*/
SELECT monthname(s.date) as month,
 year(s.date) as year,
 sum(s.sold_quantity*g.gross_price)
 as gross_price_total
 FROM gdb0041.fact_gross_price g
join fact_sales_monthly s
 using(product_code, fiscal_year)
join dim_customer c on 
c.customer_code=s.customer_code
where c.customer="atliq exclusive" 
and s.fiscal_year in(2020,2021)
group by s.date
