/*Provide the list of markets in which customer "Atliq Exclusive" operates its business in the APAC region*/
SELECT distinct market FROM gdb0041.dim_customer
where customer= "Atliq Exclusive"
and region="APAC";
