create database walmart ;
use walmart;
select time,

/* Q1:FILTER THE TIME */
(CASE 
when 'time' between "00:00:00" and "12:00:00" THEN "Morning"
 WHEN `time` BETWEEN "12:01:00" AND "16:00:00" THEN "Afternoon"
        ELSE "Evening"
    END) AS time_of_day
FROM sales;



/* FILTER DAYNAME */
SELECT
	date,
	DAYNAME(date)
FROM sales;

/* FILTER MONTH */
SELECT
	date,
	MONTHNAME(date)
FROM sales;

/* Filter by basis on city */
SELECT 
	DISTINCT city,branch
FROM sales;

/* distinct products available */
SELECT
	DISTINCT product_line
FROM sales;

/*what is the most selling product */
SELECT sum(Quantity) as qty,product_line from sales 
group by product_line
order by qty desc;

/* total revenue month wise */
select sum(Total) as total_revenue,MONTHNAME(date) from sales
group by MONTHNAME(date)
order by total_revenue desc;

/* what month had the largest COGS ?*/
Select sum(cogs)as cogss,monthname(date) from sales 
group by monthname(date)
order by cogss desc ;

/* what city has the largest revenue*/
select sum(total),city,branch from sales 
group by city,branch
order by 1 ;

/*which product line has the highest Vat due */
select avg(tax),product_line from sales 
group by product_line 
order by 1 desc ;

/* fetch the data and decide whether the product line has good sales or not */
SELECT 
    product_line,
    CASE 
        WHEN AVG(Quantity) > 5.5 THEN "Good"
        ELSE "Bad"
    END AS sales_quality
FROM 
    sales 
GROUP BY 
    product_line 
ORDER BY 
    AVG(Quantity) DESC;


/* which branch sold more products than avg products sold */
select branch, sum(Quantity) as quanty from sales 
group by branch 
having sum(Quantity)> (select avg(Quantity) from sales );

/* what is the most common type of customer */
select customer_type,
count(*) from sales 
group by customer_type ;

/*what is the gender distribution per branch */
select gender ,
count(*) as gender_cnt from sales 
group by gender
order by gender_cnt desc ;


/*Which city has the largest tax/VAT percent? */
SELECT city, 
ROUND(AVG(tax), 2) AS avg_tax_pct
FROM sales
GROUP BY city 
ORDER BY avg_tax_pct DESC;



