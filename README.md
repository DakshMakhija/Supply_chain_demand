📦 Supply Chain Demand & Inventory Analytics (End-to-End Project)
📌 Project Overview

This project is an end-to-end Supply Chain Analytics solution focused on demand planning, inventory performance, stock-out analysis, and business impact.
It uses Python for data engineering, SQL for analytical KPIs, and Power BI for executive dashboards.

The objective is to help business stakeholders:

Reduce stock-outs

Improve supplier performance

Optimize inventory across warehouses

Understand revenue loss due to supply gaps

🧰 Tools & Technologies

Python (Pandas, NumPy)

MySQL

SQL (CTEs, Window Functions, Aggregations)

SQLAlchemy

Power BI

GitHub

📊 Dataset Overview

Industry: Supply Chain & Operations

Rows: 50,000+

Key Columns:

product

demand_units

supply_units

demand_supply_gap

inventory_level

stock_out_flag

revenue

profit

supplier

lead_time_days

warehouse

region

season

month_name

promotion

🐍 Python: Data Cleaning & Feature Engineering
Key Steps

Standardized column names

Handled missing values

Created business features:

demand_supply_gap

stock_out_flag

Removed redundant columns

Prepared analytics-ready dataset

Example Logic
df['demand_supply_gap'] = df['demand_units'] - df['supply_units']

df['stock_out_flag'] = np.where(
    df['inventory_level'] < df['demand_units'],
    'Yes',
    'No'
)

🗄️ MySQL: Data Storage

Loaded cleaned dataset into MySQL using SQLAlchemy

Table used for analysis: supply_chain

df.to_sql(
    name='supply_chain',
    con=conn,
    if_exists='replace',
    index=False
)

📐 SQL: Business KPI Analysis
Core KPIs Used for Power BI

Total Demand, Supply & Gap

Total Revenue & Profit

Stock-out Percentage

Demand by Product

Revenue by Region

Stock-outs by Warehouse

Top Products Causing Stock-outs

Monthly Demand Trend

Seasonal Demand

Monthly Revenue Trend

Top 3 Products per Season

Avg Lead Time by Supplier

Lead Time vs Stock-outs

Inventory by Warehouse

Promotion Impact on Demand

Revenue Loss Due to Stock-outs

Example Query
SELECT
    SUM(demand_units) AS total_demand,
    SUM(supply_units) AS total_supply,
    SUM(demand_supply_gap) AS demand_supply_gap
FROM supply_chain;

📊 Power BI Dashboards
1️⃣ Executive Supply Chain Overview

Total Revenue & Profit

Total Demand vs Supply

Demand-Supply Gap

Stock-out Percentage

Revenue by Region

Monthly Demand Trend

Demand by Product

2️⃣ Inventory & Warehouse Performance

Stock-outs by Warehouse

Inventory Levels by Warehouse

Stock-out Percentage

Warehouse Comparison Table

3️⃣ Supplier & Business Impact

Lead Time vs Stock-outs

Avg Lead Time by Supplier

Revenue Loss Due to Stock-outs

Demand by Season & Product

Promotion Impact on Demand

📈 Key Business Insights

High lead times directly increase stock-out risk

Certain warehouses face consistently higher stock-outs

Promotions significantly boost demand but increase supply risk

Seasonal demand variation impacts inventory planning

Stock-outs result in large revenue leakage

💡 Business Recommendations

Reduce supplier lead times for high-risk products

Improve inventory buffers in high stock-out warehouses

Align promotions with supply readiness

Use seasonal demand forecasts for proactive planning

🎯 Skills Demonstrated

✔ Python (Data Cleaning & Feature Engineering)
✔ SQL (Advanced Analytics & KPIs)
✔ Supply Chain Analytics
✔ Power BI Dashboard Design
✔ Business Insight Generation

👤 Author

Daksh Makhija
Data Analyst | Supply Chain Analytics | SQL | Python | Power BI
