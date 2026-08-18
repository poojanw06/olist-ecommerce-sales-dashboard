Olist Brazilian E-Commerce Sales Dashboard
An end-to-end Power BI dashboard analyzing revenue, customer behavior, delivery performance, 
and seller performance for a Brazilian e-commerce marketplace, built on the public Olist dataset.

Objective
This project analyzes transactional e-commerce data to answer key business questions: Where 
is revenue coming from, and how is it trending? How well is the business retaining customers?
Is delivery performance affecting customer satisfaction? Which sellers are driving the most 
value? The goal was to build a portfolio-ready analytics project covering the full pipeline -
from raw data to a polished, decision-ready dashboard.

Tech Stack
> MySQL 8.0 - data staging, schema design, analytical views
> Power BI Desktop - data modeling, DAX measures, report design
> Power Query - data cleaning and transformation
> DAX - time intelligence, KPIs, custom measures

Dashboard Pages
1. Executive Overview
KPI Summary (₹13.6M total revenue, 99K orders, 96K customers, 4.09 avg review score),
monthly revenue trend with MoM growth %, revenue by category, and top 10 states by revenue.

2. Customer Analysis
Customer base breakdown (96K total customers, 3.0% repeat rate, 1.03 avg orders per customer),
order count distribution, and a state-level summary table of customers, revenue, and average
order value.

3. Delivery & Satisfaction
Delivery performance (12.5 avg delivery days, 94.96% on-time rate), average delivery delay
by review score. review score distribution, and monthly delivery time trend.

4. Seller Performance
3,095 active sellers, ₹4.39K average revenue per seller, and a ranked table of top sellers per
state by total sales and order volume.

Key Insights
> Sao Paulo (SP) alone contributes roughly 40% of total revenue and customers, showing heavy 
geography concentration
> Repeat purchase rate is low at 3% - the business is largely acquisition-driven rather than 
retention-driven
> Average delivery time is ~12.5 days with a strong 94.96% on-time delivery rate
> Health_beauty and watches_gifts are the top two revenue-generating categories
> Delivery delays visibly correlate with lower review scores

Data Source
https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce — Kaggle

Repository Structure 
|-- sql/
    |-- olist_ecommerce_schema.sql
|-- images/
    |-- 1-executive-overview.png
    |-- 2-customer-analysis.png
    |-- 3-delivery-satisfaction.png
    |-- 4-seller-performance.png
|-- README.md

Power BI File
The .pbix file exceeds GitHub's browser upload limit, so it's hosted externally:
https://1drv.ms/u/c/04330750d35c21c2/IQApN4Obb0EOS4wD5g-DIFXsAeVbQ3XreYKsRF6EpDHY4_M?e=FlCUZF
