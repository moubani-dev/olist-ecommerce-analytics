
# Olist E-Commerce Analytics

## Project Overview

This project focuses on analyzing e-commerce data to
understand sales performance, customer behavior, and
business trends.

Using the Olist Brazilian E-Commerce dataset, the
project aims to transform raw transactional data into
meaningful business insights through data analysis,
SQL, visualization, and customer segmentation.

## Project Objectives

- Analyze overall sales and revenue performance.
- Understand customer purchasing behavior.
- Identify product and category performance.
- Explore order trends and delivery performance.
- Perform customer segmentation using RFM analysis.
- Develop an interactive business dashboard.

## Technologies Used

- Python
- Pandas and NumPy
- SQL and SQLite
- Matplotlib and Seaborn
- Plotly
- Scikit-learn
- Git and GitHub


## Data Loading

The project uses a reusable Python-based DataLoader
to load the original Olist datasets into Pandas DataFrames.

### Implementation

The DataLoader is implemented in:

`src/data_loader.py`

It provides the following functionality:

- Automatic detection of the raw data directory.
- Validation of required CSV files.
- Loading individual datasets by name.
- Loading multiple datasets into a dictionary.
- Optional loading of the large geolocation dataset.

### Usage

```python
from src.data_loader import OlistDataLoader

# Initialize the DataLoader
loader = OlistDataLoader()

# Load the eight standard datasets
datasets = loader.load_all()

# Load geolocation separately when required
geolocation = loader.load_dataset("geolocation")
```

### Dataset Summary

| Dataset | Records |
|---|---:|
| Customers | 99,441 |
| Orders | 99,441 |
| Order Items | 112,650 |
| Payments | 103,886 |
| Reviews | 99,224 |
| Products | 32,951 |
| Sellers | 3,095 |
| Category Translation | 71 |
| Geolocation | 1,000,163 |

## Project Structure

```text
olist-ecommerce-analytics/
├── data/
│   ├── raw/
│   └── processed/
├── notebooks/
├── sql/
├── src/
├── images/
├── dashboard/
├── reports/
├── .gitignore
└── README.md
```

## Project Status

**Completed:**
- Project structure and environment setup.
- Olist dataset acquisition and organization.
- Reusable DataLoader implementation.
- Validation and loading tests for all nine datasets.

**In Progress:**
- Data understanding and quality assessment.
- SQL analysis and data cleaning.
- Exploratory data analysis.
- Customer segmentation and dashboard development.


## Author

Moubani Das

GitHub: https://github.com/moubani-dev
