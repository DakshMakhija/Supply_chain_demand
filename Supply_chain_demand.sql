use supply;
show tables;


select * from supply_chain;

#1 - What is the total demand, total supply, and demand–supply gap

select sum(demand_units) as Total_demand,
sum(supply_units) as Total_supply,
sum(demand_supply_gap) as total_demand_supply_gap from supply_chain;

#2 - What is the total revenue and total profit?

select sum(revenue) as total_revenue, sum(profit) as total_profit
from supply_chain;

#3 - What is the stock-out percentage across all orders
select round(sum(
case when stock_out_flag = 'yes' then 1 else 0 end)/count(*) *100,2) as stock_out_percentage
from supply_chain;

#4- Which products generate the highest demand?

select product , sum(demand_units) as Total_demand
from supply_chain 
group by product
order by Total_demand desc;

#5 - What is the revenue contribution by region?

select region, sum(revenue) as total_revenue
from supply_chain
group by region
order by total_revenue desc;

#6 - Which warehouses have the highest stock-outs?

select warehouse,count(stock_out) as highest_stock_outs
from supply_chain
where stock_out = 'yes'
group by warehouse;

#7 - What are the top 5 products causing stock-outs?

select product,count(stock_out) as stock_out_number
from supply_chain
where stock_out = 'yes'
group by product
order by stock_out_number desc
limit 5;

#8 - What is the monthly demand trend?

select month_name,sum(demand_units)
from supply_chain
group by month_name;

#9 - How does season impact demand?

select season,sum(demand_units)
from supply_chain
group by season;

#10 - What is the monthly revenue trend
select month_name,sum(revenue)
from supply_chain
group by month_name;

#11 - top 3 product each season based on demand.
select * from(select season, product,dense_rank()over(partition by season order by sum(demand_units) desc) as r
from supply_chain
group by season,product) total
where r<=3;

#12 - Which suppliers have the highest average lead time?

select supplier, round(avg(lead_time_days),2) as avg_lead_time
from supply_chain
group by supplier
order by avg_lead_time desc;

#13 - Is there a relationship between lead time and stock-outs?
SELECT
    CASE
        WHEN lead_time_days <= 5 THEN '0–5 days'
        WHEN lead_time_days <= 10 THEN '6–10 days'
        WHEN lead_time_days <= 20 thEN '11–20 days'
        ELSE '20+ days'
    END AS lead_time_bucket,
    COUNT(*) AS total_orders,
    SUM(CASE WHEN stock_out = 'Yes' THEN 1 ELSE 0 END) AS stock_out_orders,
    ROUND(
        SUM(CASE WHEN stock_out = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*) * 100, 2
    ) AS stock_out_percentage
FROM supply_chain
GROUP BY lead_time_bucket
ORDER BY stock_out_percentage DESC;
 
#14- Which warehouses hold excess inventory?
select warehouse,sum(inventory_level) as total_inventory
from supply_chain
group by warehouse
order by total_inventory desc;

#15- Does promotion increase demand compared to non-promotion?

select product,promotion , sum( demand_units) as total_demand_based_on_prmotion
from supply_chain
group by product,promotion
order by product;

#16 - What is the revenue loss due to stock-outs

SELECT 
    ROUND(
        SUM(
            (demand_units - supply_units) * selling_price
        ),2
    ) AS revenue_loss_due_to_stockout
FROM supply_chain
WHERE stock_out = 'Yes'
  AND demand_units > supply_units;






