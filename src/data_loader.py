
from pathlib import Path

import pandas as pd


class OlistDataLoader:
    """
    Loads the original Olist e-commerce datasets
    from the project's raw data directory.
    """

    DATASETS = {
        "customers": "olist_customers_dataset.csv",
        "geolocation": "olist_geolocation_dataset.csv",
        "order_items": "olist_order_items_dataset.csv",
        "order_payments": "olist_order_payments_dataset.csv",
        "order_reviews": "olist_order_reviews_dataset.csv",
        "orders": "olist_orders_dataset.csv",
        "products": "olist_products_dataset.csv",
        "sellers": "olist_sellers_dataset.csv",
        "category_translation": "product_category_name_translation.csv",
    }

    def __init__(self, data_dir=None):
        if data_dir is None:
            project_root = Path(__file__).resolve().parent.parent
            self.data_dir = project_root / "data" / "raw"
        else:
            self.data_dir = Path(data_dir)

    def validate_files(self):
        """Check whether all expected CSV files exist."""

        missing_files = [
            filename
            for filename in self.DATASETS.values()
            if not (self.data_dir / filename).is_file()
        ]

        if missing_files:
            raise FileNotFoundError(
                f"Missing dataset files: {missing_files}"
            )

        return True

    def load_dataset(self, dataset_name):
        """Load one dataset by its registered name."""

        if dataset_name not in self.DATASETS:
            raise ValueError(
                f"Unknown dataset: {dataset_name}. "
                f"Available datasets: {list(self.DATASETS.keys())}"
            )

        file_path = self.data_dir / self.DATASETS[dataset_name]

        if not file_path.is_file():
            raise FileNotFoundError(
                f"Dataset file not found: {file_path}"
            )

        return pd.read_csv(file_path)

    def load_all(self, include_geolocation=False):
        """Load all datasets into a dictionary of DataFrames."""

        self.validate_files()

        datasets = {}

        for name in self.DATASETS:
            if name == "geolocation" and not include_geolocation:
                continue

            datasets[name] = self.load_dataset(name)

        return datasets
