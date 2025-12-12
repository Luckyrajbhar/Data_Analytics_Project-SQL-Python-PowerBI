🌟 Customer Shopping Behavior Analysis

SQL • Python • Power BI Dashboard

Gain insights into how customers shop — what they buy, how much they spend, how discounts affect revenue, which items perform best, and how subscription status influences purchases.
This project combines SQL analysis, Python-based EDA, and an interactive Power BI dashboard for a complete end-to-end data story.

📁 Repository Structure
📦 Customer Shopping Behavior Analysis
├── 📄 Customer_Behavior_sql_queries.sql
├── 📄 Customer_shopping_Behavior_Analysis.ipynb
├── 📄 customer_behavior_dashboard.pbix
└── 📂 data/ (Add your dataset here)


SQL Script → Clean & powerful queries for customer segmentation, revenue analysis & behaviour insights.

Python Notebook → EDA, visualization & basic modeling.

Power BI Dashboard → Interactive visuals for KPIs, trends & customer patterns.

🚀 Project Highlights
🔍 Key Questions Answered

Which customer group generates the highest revenue?

How do discounts influence purchasing behaviour?

Do subscribers spend more than non-subscribers?

Which items have the best ratings?

What segments (New, Returning, Loyal) drive the most sales?

📊 Dashboard Capabilities

Filters: Age Group, Subscription Status, Shipping Type, Items

Sales Trends

Revenue by Category

Rating & Review Distribution

Customer Persona Comparison

⚡ Quick Start Guide
1️⃣ Clone the Repository
git clone <your-repo-url>
cd <repo-folder>

2️⃣ Add Your Dataset

Place your file at:

data/customer_behavior_data.csv

3️⃣ Run the Notebook
pip install pandas numpy matplotlib scikit-learn jupyterlab
jupyter lab

4️⃣ Open SQL File

Run Customer_Behavior_sql_queries.sql in MySQL / PostgreSQL.

5️⃣ Launch Power BI Dashboard

Open customer_behavior_dashboard.pbix → Update data source.

🧠 Sample SQL Queries (At a Glance)
⭐ Revenue by Gender
SELECT gender, SUM(purchase_amount) AS revenue
FROM customer_behavior_data
GROUP BY gender;

⭐ Top 5 High-Rated Products
SELECT item_purchased, AVG(review_rating) AS avg_rating
FROM customer_behavior_data
GROUP BY item_purchased
ORDER BY avg_rating DESC
LIMIT 5;

⭐ Subscriber vs Non-Subscriber Spend
SELECT subscription_status,
       AVG(purchase_amount) AS avg_spend,
       SUM(purchase_amount) AS total_revenue
FROM customer_behavior_data
GROUP BY subscription_status;
