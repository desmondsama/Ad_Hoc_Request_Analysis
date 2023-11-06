/*Get the products that have the highest and lowest manufacturing costs.*/
SELECT p.product_code,
 p.product, p.category,
 m.manufacturing_cost
 FROM gdb0041.fact_manufacturing_cost m
join dim_product p 
using (product_code)
where m.manufacturing_cost in((select min(manufacturing_cost) from fact_manufacturing_cost),
(select max(manufacturing_cost) from fact_manufacturing_cost))
