# Olist E-Commerce Analytics
### End-to-End Data Analytics | SQL | Python | Customer Segmentation | Business Intelligence

<p align="center">
  <strong>Transforming Raw E-Commerce Data into Actionable Business Intelligence</strong>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Python-Data%20Analysis-3776AB?logo=python&logoColor=white" />
  <img src="https://img.shields.io/badge/SQL-SQLite-003B57?logo=sqlite&logoColor=white" />
  <img src="https://img.shields.io/badge/Pandas-Data%20Processing-150458?logo=pandas&logoColor=white" />
  <img src="https://img.shields.io/badge/Plotly-Interactive%20Analytics-3F4F75?logo=plotly&logoColor=white" />
  <img src="https://img.shields.io/badge/Scikit--learn-Machine%20Learning-F7931E?logo=scikitlearn&logoColor=white" />
  <img src="https://img.shields.io/badge/Status-Completed-success" />
</p>

---

## 01 | Project Overview

How can an e-commerce business use transactional data to understand its performance, improve customer experience, and make better strategic decisions?

This project explores the **Brazilian E-Commerce Public Dataset by Olist**, a real-world marketplace dataset containing information about customers, orders, products, payments, sellers, reviews, and delivery operations.

The objective is to transform raw transactional data into meaningful business insights through a structured analytical workflow involving Python, SQL, exploratory data analysis, customer segmentation, and interactive business intelligence.

The project culminates in an executive dashboard designed to provide a consolidated view of marketplace performance and support data-driven decision-making.

**Project focus:** Revenue Performance | Customer Behavior | Product Analytics | Delivery Operations | Customer Segmentation | Business Intelligence

## 02 | Business Objectives

The analysis investigates the following business questions:

- How does marketplace revenue change over time?
- Which product categories contribute the most to total revenue?
- Which Brazilian states generate the highest sales?
- Which sellers contribute most to marketplace revenue?
- When are customers most active in placing orders?
- Which payment methods are most frequently used?
- How does delivery performance influence customer satisfaction?
- Can customers be grouped into meaningful segments using RFM analysis?
- What business actions can improve retention, sales, and operational performance?

## 03 | Dataset

**Dataset:** Brazilian E-Commerce Public Dataset by Olist

**Source:** [Olist Brazilian E-Commerce Dataset — Kaggle](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)

The project uses nine relational datasets containing approximately 1.6 million records across the original CSV files.

| Dataset | Records | Description |
|---|---:|---|
| Customers | 99,441 | Customer information and locations |
| Orders | 99,441 | Order status and timestamps |
| Order Items | 112,650 | Products purchased in each order |
| Payments | 103,886 | Payment methods and installments |
| Reviews | 99,224 | Customer ratings and reviews |
| Products | 32,951 | Product attributes and categories |
| Sellers | 3,095 | Seller information and locations |
| Category Translation | 71 | Portuguese-to-English category mapping |
| Geolocation | 1,000,163 | Brazilian geographic coordinates |

*Record counts represent the original source datasets, not the number of unique marketplace customers or orders.*

Raw CSV files are excluded from this repository. Users must download the dataset separately.

## 04 | Technology Stack

| Technology | Application |
|---|---|
| Python | Analytical programming |
| Pandas | Data manipulation and analysis |
| NumPy | Numerical computation |
| SQLite | Relational database management |
| SQL | Business data querying |
| Matplotlib | Data visualization |
| Seaborn | Statistical visualization |
| Plotly | Interactive dashboards |
| Scikit-learn | Feature scaling and K-Means clustering |
| Google Colab | Notebook execution |
| VS Code | Development environment |
| Git & GitHub | Version control and project management |

## 05 | Analytical Methodology

The project follows a structured end-to-end data analytics workflow.

### Phase 1 — Data Loading and Understanding

Developed a reusable, object-oriented Python DataLoader to manage the Olist datasets.

Key activities:

- Loaded and validated nine CSV datasets.
- Implemented automatic dataset directory detection.
- Checked required file availability.
- Inspected dataset dimensions and column data types.
- Examined missing values and data structure.
- Organized datasets for subsequent analysis.

**Implementation:** `src/data_loader.py`

### Phase 2 — SQL Business Analysis

Created an in-memory SQLite database and loaded the relational datasets for business-oriented querying.

The SQL analysis addresses nine areas:

| Analysis | Business Purpose |
|---|---|
| Monthly Revenue | Understand revenue performance over time |
| Top Product Categories | Identify major revenue contributors |
| State-Wise Performance | Compare customer and revenue distribution |
| Delivery Time by State | Evaluate regional delivery efficiency |
| Late Delivery vs Reviews | Understand delivery and satisfaction relationships |
| Payment Analysis | Examine payment methods and installment behavior |
| Customer Ordering Patterns | Identify purchasing days and hours |
| Seller Revenue Ranking | Evaluate seller contribution |
| Review Score by Category | Compare customer satisfaction across categories |

**SQL concepts applied:**

- INNER JOIN and LEFT JOIN
- GROUP BY and HAVING
- ORDER BY
- Aggregate functions
- CASE WHEN
- Common Table Expressions (CTEs)
- Date and time functions
- Subqueries and conditional logic

**Implementation:** `sql/queries.sql`

### Phase 3 — Data Cleaning and Feature Engineering

Prepared the data for reliable analysis and visualization.

Key activities:

- Inspected and handled missing values.
- Checked duplicate records.
- Prepared date and time columns.
- Translated product categories into English.
- Created additional analytical features.

**Engineered features:**

| Feature | Business Meaning |
|---|---|
| `delivery_days` | Time taken to deliver an order |
| `is_late` | Identifies whether an order was delivered late |
| `order_month` | Purchase month for trend analysis |
| `order_weekday` | Day of the week an order was placed |
| `order_hour` | Hour of purchase |
| `total_order_value` | Order value for transactional analysis |

The resulting analysis-ready dataset was exported as `olist_clean.csv`.

### Phase 4 — Exploratory Data Analysis

Conducted exploratory analysis to identify patterns, distributions, relationships, and business trends.

The analysis includes ten visualizations:

1. Monthly Revenue Trends
2. Top Product Categories by Revenue
3. Customer Distribution by State
4. Delivery Time Distribution
5. Customer Review Score Distribution
6. Late Delivery vs Customer Reviews
7. Order Activity by Weekday and Hour
8. Payment Method Distribution
9. Product Price vs Freight Value
10. Numerical Feature Correlation Heatmap

The visualizations help investigate marketplace performance from commercial, operational, and customer perspectives.

### Phase 5 — Customer Segmentation Using RFM and K-Means

Applied RFM analysis to understand customer purchasing behavior and identify customer groups with different business value characteristics.

**RFM methodology:**

| Metric | Definition |
|---|---|
| Recency | How recently a customer made a purchase |
| Frequency | How many purchases a customer made |
| Monetary | How much a customer spent |

**Machine learning workflow:**

1. Calculated customer-level RFM metrics.
2. Standardized the features using `StandardScaler`.
3. Evaluated cluster selection using the Elbow Method.
4. Applied K-Means clustering with five clusters.
5. Examined cluster characteristics.
6. Developed segment-specific marketing recommendations.

**Customer segments identified:**

- High-Value Customers
- Recent Low-Spend Customers
- Premium High-Spend Customers
- At-Risk Customers
- Lost Customers

The segmentation provides a framework for targeted marketing, customer engagement, and retention strategies.

### Phase 6 — Executive Business Intelligence Dashboard

Developed a dark-themed, interactive executive dashboard using Plotly.

The dashboard consolidates key marketplace performance indicators and business visualizations into a single analytical interface.

**Key Performance Indicators**

| KPI | Result |
|---|---:|
| Total Revenue | R$15,843,553.24 |
| Total Orders | 99,441 |
| Average Order Value | R$160.58 |
| Average Review Score | 4.09 / 5 |
| Late Delivery Rate | 8.11% |

**Dashboard visualizations:**

- Monthly Revenue Trend
- Top 10 Product Categories by Revenue
- Top Brazilian States by Orders
- Customer Satisfaction: On-Time vs Late Delivery
- Payment Method Distribution
- Customer Segmentation Analysis

### Dashboard Preview

![Olist Executive Intelligence Dashboard](images/executive_dashboard.png)

**[Open the Interactive Executive Dashboard](dashboard/dashboard.html)**

The HTML dashboard can be downloaded and opened in a modern web browser to explore its interactive visualizations.

### Phase 7 — Business Insights and Recommendations

Translated analytical findings into business-oriented insights and recommendations.

The final analysis focuses on revenue performance, purchasing behavior, payment preferences, customer satisfaction, seller contribution, and customer segmentation.

## 06 | Key Business Findings

The analysis produced the following findings:

### Marketplace Performance

- Total analyzed revenue: **R$15.84 million**
- Total orders: **99,441**
- Average order value: **R$160.58**
- Average customer review score: **4.09 / 5**

### Customer Experience and Delivery

A significant relationship was observed between delivery performance and customer satisfaction.

| Delivery Status | Average Review Score |
|---|---:|
| On-Time Delivery | 4.29 |
| Late Delivery | 2.57 |

Late deliveries were associated with substantially lower customer review scores, highlighting the importance of reliable fulfillment operations.

### Payment Behavior

Credit cards represented approximately **78.3%** of payment transactions, followed by boleto payments at approximately **17.9%**.

### Purchasing Patterns

- Monday recorded 16,196 orders.
- 16:00 was the busiest ordering hour, with 6,675 orders.

These patterns can inform campaign scheduling and operational planning.

## 07 | Strategic Business Recommendations

Based on the analytical findings, the following actions are recommended:

**1. Improve Delivery Reliability**

Monitor late deliveries, identify regional bottlenecks, and improve fulfillment coordination to protect customer satisfaction.

**2. Strengthen Customer Retention**

Use RFM-based customer segments to design targeted engagement, reactivation, and retention campaigns.

**3. Optimize Marketing Timing**

Align promotional campaigns with observed weekday and hourly purchasing patterns.

**4. Improve Product and Seller Strategy**

Monitor category-level revenue and seller contribution to identify growth opportunities and areas requiring operational attention.

**5. Optimize the Payment Experience**

Use payment preference insights to improve checkout convenience and support customer purchasing decisions.

## 08 | Repository Structure

```text
olist-ecommerce-analytics/
│
├── dashboard/
│   └── dashboard.html
│
├── data/
│   ├── raw/
│   └── processed/
│
├── images/
│   └── executive_dashboard.png
│
├── notebooks/
│   └── Olist_E_commerce_Analytics.ipynb
│
├── reports/
│
├── sql/
│   └── queries.sql
│
├── src/
│   ├── __init__.py
│   └── data_loader.py
│
├── .gitignore
├── requirements.txt
└── README.md
```

## 09 | Installation and Execution

### 1. Clone the repository

```bash
git clone https://github.com/moubani-dev/olist-ecommerce-analytics.git
```

### 2. Navigate to the project directory

```bash
cd olist-ecommerce-analytics
```

### 3. Create a virtual environment

```bash
python -m venv .venv
```

### 4. Activate the environment

**macOS / Linux**

```bash
source .venv/bin/activate
```

**Windows**

```bash
.venv\Scripts\activate
```

### 5. Install dependencies

```bash
pip install -r requirements.txt
```

### 6. Download and prepare the dataset

Download the [Olist Brazilian E-Commerce Dataset](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce).

Place the required CSV files in the project's expected raw data directory.

Do not upload the raw datasets to GitHub.

### 7. Run the analysis

Open the notebook:

`notebooks/Olist_E_commerce_Analytics.ipynb`

Run the notebook cells sequentially in Google Colab or a compatible Jupyter environment.

### 8. Explore the dashboard

Open:

`dashboard/dashboard.html`

in a modern web browser.

## 10 | Project Deliverables

| Deliverable | Location |
|---|---|
| Main Analysis Notebook | `notebooks/` |
| Reusable DataLoader | `src/data_loader.py` |
| SQL Business Queries | `sql/queries.sql` |
| Executive Dashboard | `dashboard/dashboard.html` |
| Dashboard Preview | `images/executive_dashboard.png` |
| Project Documentation | `README.md` |
| Python Dependencies | `requirements.txt` |

## 11 | Key Learning Outcomes

This project provided practical experience in:

- Object-oriented Python programming.
- Data acquisition and validation.
- Data cleaning and feature engineering.
- Relational database design and SQL querying.
- Exploratory data analysis.
- Statistical data visualization.
- Customer segmentation using RFM.
- K-Means clustering and feature scaling.
- Interactive business intelligence dashboard development.
- Business insight generation and analytical storytelling.
- Git and GitHub project management.

## 12 | Author

**Moubani Das**

Aspiring Data Analyst | Python | SQL | Business Intelligence

- **GitHub:** [moubani-dev](https://github.com/moubani-dev)
- **LinkedIn:** [Connect with me](https://www.linkedin.com/in/developer-moubani/)
- **Project Repository:** [Olist E-Commerce Analytics](https://github.com/moubani-dev/olist-ecommerce-analytics)

---

<p align="center">
  **Let's connect and explore the world of data!**
</p>

---

<p align="center">
  <strong>From Data to Insights. From Insights to Decisions.</strong>
  <br/>
  <sub>Olist E-Commerce Analytics | Python • SQL • Business Intelligence</sub>
</p>
