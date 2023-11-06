/*Generate a report which contains the top 5 customers who received an average high pre_invoice_discount_pct for the fiscal year 2021 and in the Indian market.*/
SELECT c.customer_code,
 c.customer,
 avg(d.pre_invoice_discount_pct) avg_discount_pct
 FROM gdb0041.fact_pre_invoice_deductions d 
 join dim_customer c 
 using(customer_code)
 where fiscal_year=2021
 group by c.customer
 order by avg_discount_pct desc
 limit 5
