/*Generate top 5 markets by net sales in fiscal year 2023*/
SELECT 
    	    market, 
            round(sum(net_sales)/1000000,2) as net_sales_mln
	FROM gdb0041.net_sales
	where fiscal_year=2021
	group by market
	order by net_sales_mln desc
	limit 5;

/*Generate top 5 products by net sales in fiscal year 2023*/
SELECT 
    	    product, 
            round(sum(net_sales)/1000000,2) as net_sales_mln
	FROM gdb0041.net_sales
	where fiscal_year=2021
	group by product
	order by net_sales_mln desc
	limit 5;

/*Generate top 5 customers by net sales in fiscal year 2023*/
SELECT 
    	    customer, 
            round(sum(net_sales)/1000000,2) as net_sales_mln
	FROM gdb0041.net_sales
	where fiscal_year=2021
	group by customer
	order by net_sales_mln desc
	limit 5;
