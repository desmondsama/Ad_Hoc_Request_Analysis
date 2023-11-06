/*Generate top 3 customers from each region by net sales contribution*/
with cte1 as (
		select 
                    customer, 
                    round(sum(net_sales)/1000000,2) as net_sales_mln
        	from net_sales s
        	join dim_customer c
                    on s.customer_code=c.customer_code
        	where s.fiscal_year=2021
        	group by customer),
	cte2 as(select 
            *,
            net_sales_mln*100/sum(net_sales_mln) over(partition by region) as pct_net_sales
	from cte1
	order by region, pct_net_sales desc),
cte3 as(select *,
  dense_rank() over(partition by region order by net_sales_mln)
  as ranks from cte2)
select * from cte3 where ranks <= 3;
