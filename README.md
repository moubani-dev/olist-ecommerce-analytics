<div align="center">

OLIST E-COMMERCE ANALYTICS

End-to-End Data Analytics & Business Intelligence

Transforming Brazilian E-Commerce Data into Actionable Business Insights

<br/>

<img src="https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white" />
<img src="https://img.shields.io/badge/SQL-003B57?style=for-the-badge&logo=sqlite&logoColor=white" />
<img src="https://img.shields.io/badge/Pandas-150458?style=for-the-badge&logo=pandas&logoColor=white" />
<img src="https://img.shields.io/badge/Plotly-3F4F75?style=for-the-badge&logo=plotly&logoColor=white" />
<img src="https://img.shields.io/badge/Scikit--learn-F7931E?style=for-the-badge&logo=scikitlearn&logoColor=white" />

<br/>

<img src="https://img.shields.io/badge/Project-Completed-success?style=flat-square" />
<img src="https://img.shields.io/badge/Domain-E--Commerce-blue?style=flat-square" />
<img src="https://img.shields.io/badge/Focus-Business%20Analytics-purple?style=flat-square" />

</div>

---

## 📌 01. Executive Summary

E-commerce businesses generate substantial amounts of transactional data. However, transforming this data into meaningful business intelligence requires structured analysis, statistical interpretation, and effective visualization.

This project presents an end-to-end analysis of the **Brazilian E-Commerce Public Dataset by Olist**, exploring marketplace performance across sales, customers, products, payments, sellers, delivery operations, and customer satisfaction.

Using Python, SQL, exploratory data analysis, machine learning, and interactive visualization, the project transforms raw transactional data into actionable business insights.

The final deliverable is an interactive executive dashboard supported by analytical findings and strategic business recommendations.

**Project Scope**

- Revenue and Sales Performance Analysis
- Customer Purchasing Behaviour
- Product and Seller Performance
- Payment Behaviour Analysis
- Delivery Performance and Customer Satisfaction
- RFM-Based Customer Segmentation
- Interactive Business Intelligence Dashboard

## 🎯 02. Business Objectives

The project aims to answer key business questions:

1. How does marketplace revenue change over time?
2. Which product categories generate the highest revenue?
3. Which Brazilian states contribute the most to sales?
4. Which sellers are the strongest revenue contributors?
5. When are customers most active in placing orders?
6. Which payment methods dominate customer transactions?
7. How does delivery performance affect customer satisfaction?
8. Can customers be grouped into meaningful segments using RFM analysis?
9. What business strategies can improve customer retention and operational performance?

## 📂 03. Dataset Overview

**Dataset:** Brazilian E-Commerce Public Dataset by Olist

**Source:** [Kaggle – Olist Brazilian E-Commerce Dataset](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)

The analysis uses nine interconnected datasets containing approximately 1.6 million source records.

| Dataset | Records | Description |
|---|---:|---|
| Customers | 99,441 | Customer information and locations |
| Orders | 99,441 | Order status and timestamps |
| Order Items | 112,650 | Products purchased per order |
| Payments | 103,886 | Payment methods and installments |
| Reviews | 99,224 | Customer ratings and reviews |
| Products | 32,951 | Product attributes and categories |
| Sellers | 3,095 | Seller information |
| Category Translation | 71 | Product category translations |
| Geolocation | 1,000,163 | Geographic coordinates |

*Record counts represent the original source datasets, not unique customers or orders. Raw CSV files are not included in this repository.*

## 🛠️ 04. Technology Stack

| Category | Technologies |
|---|---|
| Programming | Python |
| Data Manipulation | Pandas, NumPy |
| Database | SQLite |
| Query Language | SQL |
| Data Visualization | Matplotlib, Seaborn, Plotly |
| Machine Learning | Scikit-learn |
| Development Environment | Google Colab, VS Code |
| Version Control | Git, GitHub |

## 🔬 05. Analytical Methodology

The project follows a structured seven-phase analytical workflow.

### Phase 01 — Data Loading & Understanding

Developed a reusable object-oriented Python DataLoader to manage the nine datasets.

**Key activities:**
- Loaded and validated all nine CSV datasets.
- Implemented dataset file validation.
- Inspected dimensions and data types.
- Examined missing values and data structure.
- Investigated relationships between datasets.

**Implementation:** `src/data_loader.py`

### Phase 02 — SQL Business Analysis

Created an in-memory SQLite database and performed nine business-oriented SQL analyses.

| No. | SQL Analysis | Business Purpose |
|---|---|---|
| 01 | Monthly Revenue Analysis | Evaluate revenue trends |
| 02 | Top Product Categories | Identify major revenue contributors |
| 03 | State-Wise Customer and Revenue | Compare geographic performance |
| 04 | Average Delivery Time by State | Evaluate delivery efficiency |
| 05 | Late Delivery vs Customer Reviews | Investigate customer satisfaction |
| 06 | Payment Methods and Installments | Understand payment behaviour |
| 07 | Customer Ordering Patterns | Identify purchasing days and hours |
| 08 | Review Score by Product Category | Compare category-level satisfaction |
| 09 | Seller Revenue Ranking | Identify top-performing sellers |

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

### Phase 03 — Data Cleaning & Feature Engineering

Prepared the data for reliable analysis and visualization.

**Key activities:**
- Missing-value inspection and treatment.
- Duplicate record checks.
- Data type preparation.
- Product category translation.
- Date and time feature extraction.
- Creation of analytical variables.

**Six engineered features:**

| Feature | Description |
|---|---|
| `delivery_days` | Actual delivery duration |
| `is_late` | Late delivery indicator |
| `order_month` | Purchase month |
| `order_weekday` | Day of the week |
| `order_hour` | Purchase hour |
| `total_order_value` | Total order value |

The cleaned analytical dataset was exported as `olist_clean.csv`.

### Phase 04 — Exploratory Data Analysis

Conducted exploratory analysis using ten visualizations to investigate marketplace performance.

**Analysis areas:**

- Monthly revenue trends
- Product category performance
- Geographic sales distribution
- Customer purchasing patterns
- Payment method distribution
- Delivery time distribution
- Customer review scores
- Late delivery impact
- Product pricing and freight
- Numerical feature relationships

### Phase 05 — Customer Segmentation: RFM & K-Means

Applied Recency, Frequency, and Monetary analysis to understand customer value and purchasing behaviour.

**Methodology:**

1. Calculated customer-level RFM metrics.
2. Standardized features using `StandardScaler`.
3. Evaluated cluster selection using the Elbow Method.
4. Applied K-Means clustering with five clusters.
5. Analysed cluster characteristics.
6. Developed segment-specific marketing strategies.

**Identified customer segments:**

| Segment | Business Interpretation |
|---|---|
| High-Value Customers | Customers with strong monetary value and relatively recent purchases |
| Recent Low-Spend Customers | Recently active customers with lower spending |
| Premium High-Spend Customers | Customers with high monetary contribution |
| At-Risk Customers | Customers with relatively low recent activity |
| Lost Customers | Customers with long periods since their last purchase |

The segmentation provides a foundation for differentiated customer engagement and retention strategies.

### Phase 06 — Executive Business Intelligence Dashboard

Developed an interactive executive dashboard using Plotly with a dark, glassmorphism-inspired visual design.

**Key Performance Indicators**

| KPI | Result |
|---|---:|
| Total Revenue | R$15,843,553.24 |
| Total Orders | 99,441 |
| Average Order Value | R$160.58 |
| Average Review Score | 4.09 / 5 |
| Late Delivery Rate | 8.11% |

**Dashboard visualizations:**

1. Monthly Revenue Trends
2. Top Product Categories by Revenue
3. State-Wise Order Distribution
4. Delivery Performance vs Customer Reviews
5. Payment Method Distribution
6. Customer Segmentation Analysis

#### Executive Dashboard Preview

<div align="center">

<img src="images/executive_dashboard.png" alt="Olist E-Commerce Executive Dashboard" width="100%" />

**Interactive Executive Dashboard**

[Open Dashboard](dashboard/dashboard.html)

</div>

### Phase 07 — Business Insights & Recommendations

Translated analytical findings into business-oriented insights and strategic recommendations.

## 📊 06. Key Business Findings

### Marketplace Performance

| Business Metric | Finding |
|---|---:|
| Total Revenue | R$15.84 Million |
| Total Orders | 99,441 |
| Average Order Value | R$160.58 |
| Average Review Score | 4.09 / 5 |

### Customer Experience & Delivery

Delivery performance showed a meaningful relationship with customer satisfaction.

| Delivery Status | Average Review Score |
|---|---:|
| On-Time Delivery | 4.29 |
| Late Delivery | 2.57 |

Late deliveries were associated with considerably lower customer review scores, highlighting the importance of reliable fulfillment operations.

### Payment Behaviour

| Payment Method | Share |
|---|---:|
| Credit Card | 78.3% |
| Boleto | 17.9% |
| Voucher | 2.3% |
| Debit Card | 1.4% |

Credit cards represented the dominant payment method in the analysed marketplace.

### Customer Purchasing Behaviour

- Monday recorded 16,196 orders.
- 16:00 was the busiest ordering hour, with 6,675 orders.

These findings can support promotional scheduling and operational planning.

## 💡 07. Strategic Business Recommendations

**01. Improve Delivery Reliability**

Monitor delayed shipments, identify regional operational bottlenecks, and improve fulfillment coordination to protect customer satisfaction.

**02. Strengthen Customer Retention**

Use RFM-based segments to design targeted engagement, reactivation, and retention campaigns.

**03. Optimize Marketing Campaign Timing**

Align promotional activities with observed weekday and hourly purchasing patterns.

**04. Improve Product and Seller Strategy**

Monitor category-level revenue and seller contribution to identify growth opportunities and areas requiring operational attention.

**05. Optimize the Payment Experience**

Use payment preference insights to improve checkout convenience and support customer purchasing decisions.

## 🗂️ 08. Repository Structure

```text
olist-ecommerce-analytics/
│
├── dashboard/
│   └── dashboard.html
│
├── images/
│   └── executive_dashboard.png
│
├── notebooks/
│   ├── 01_data_understanding.ipynb
│   ├── Olist_E_commerce_Analytics.ipynb
│   └── README.md
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

*Raw and processed datasets are excluded from version control. The data directory is created locally when preparing the project environment.*

## 🚀 09. Installation & Execution

### Step 01 — Clone the Repository

```bash
git clone https://github.com/moubani-dev/olist-ecommerce-analytics.git
```

### Step 02 — Navigate to the Project

```bash
cd olist-ecommerce-analytics
```

### Step 03 — Create a Virtual Environment

```bash
python -m venv .venv
```

### Step 04 — Activate the Environment

**macOS / Linux**

```bash
source .venv/bin/activate
```

**Windows**

```bash
.venv\Scripts\activate
```

### Step 05 — Install Dependencies

```bash
pip install -r requirements.txt
```

### Step 06 — Download the Dataset

Download the [Olist Brazilian E-Commerce Dataset](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce).

Place the required CSV files inside the expected raw data directory.

Do not upload the raw dataset files to GitHub.

### Step 07 — Run the Analysis

Open the main notebook:

`notebooks/Olist_E_commerce_Analytics.ipynb`

Run the notebook cells sequentially in Google Colab or a compatible Jupyter environment.

### Step 08 — Explore the Dashboard

Open:

`dashboard/dashboard.html`

in a modern web browser.

## 📦 10. Project Deliverables

| Deliverable | Location |
|---|---|
| Main Analytical Notebook | `notebooks/` |
| Reusable DataLoader | `src/data_loader.py` |
| Nine SQL Business Queries | `sql/queries.sql` |
| Executive Dashboard | `dashboard/dashboard.html` |
| Dashboard Preview | `images/executive_dashboard.png` |
| Project Documentation | `README.md` |
| Python Dependencies | `requirements.txt` |

## 📚 11. Key Learning Outcomes

This project provided practical experience in:

- Object-oriented Python programming.
- Data acquisition and validation.
- Data cleaning and feature engineering.
- Relational database querying.
- Advanced SQL business analysis.
- Exploratory data analysis.
- Statistical data visualization.
- RFM customer analytics.
- K-Means clustering and feature scaling.
- Interactive dashboard development.
- Business insight generation.
- Analytical storytelling.
- Git and GitHub project management.

## 👩‍💻 12. Author

<div align="center">

### Moubani Das

**Aspiring Data Analyst | Python | SQL | Business Intelligence**

Turning data into insights and insights into informed decisions.

<br/>

<a href="https://github.com/moubani-dev">
  <img src="https://img.shields.io/badge/GitHub-moubani--dev-181717?style=for-the-badge&logo=github&logoColor=white" />
</a>
<a href="https://www.linkedin.com/in/developer-moubani/">
  <img src="https://img.shields.io/badge/LinkedIn-Connect%20with%20me-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white" />
</a>

<br/>

**Project Repository:** [Olist E-Commerce Analytics](https://github.com/moubani-dev/olist-ecommerce-analytics)

</div>

---

<div align="center">

### FROM DATA TO INSIGHTS. FROM INSIGHTS TO DECISIONS.

*Olist E-Commerce Analytics | Python • SQL • Data Analytics • Business Intelligence*

</div>
