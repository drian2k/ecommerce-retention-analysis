-- Sales table: cleaned e-commerce transactions
-- Source: Online Retail II dataset (UCI), cleaned via pandas
-- 779,425 rows after removing nulls, duplicates, and invalid prices

CREATE TABLE sales (
    invoice VARCHAR(20),
    stock_code VARCHAR(20),
    description VARCHAR(255),
    quantity INTEGER,
    invoice_date TIMESTAMP,
    price NUMERIC(10,2),
    customer_id INTEGER,
    country VARCHAR(100)
);