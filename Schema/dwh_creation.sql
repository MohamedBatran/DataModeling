-- Create Dimension Tables
CREATE TABLE DimUser (
    user_name VARCHAR PRIMARY KEY,
    customer_zip_code VARCHAR,
    customer_city VARCHAR,
    customer_state VARCHAR
);

CREATE TABLE DimProduct (
    product_id VARCHAR PRIMARY KEY,
    product_category VARCHAR,
    product_name_length INT,
    product_description_length INT,
    product_photos_qty INT,
    product_weight_g DECIMAL,
    product_length_cm DECIMAL,
    product_height_cm DECIMAL,
    product_width_cm DECIMAL
);

CREATE TABLE DimSeller (
    seller_id VARCHAR PRIMARY KEY,
    seller_zip_code VARCHAR,
    seller_city VARCHAR,
    seller_state VARCHAR
);

CREATE TABLE DimOrderItem (
    order_item_id INT PRIMARY KEY,
    product_id VARCHAR REFERENCES DimProduct(product_id),
    seller_id VARCHAR REFERENCES DimSeller(seller_id),
    price DECIMAL,
    shipping_cost DECIMAL
);

-- Create Fact Table
CREATE TABLE FactOrders (
    order_id VARCHAR PRIMARY KEY,
    user_name VARCHAR REFERENCES DimUser(user_name),
    order_item_id INT REFERENCES DimOrderItem(order_item_id),
    payment_type VARCHAR,
    payment_installments INT,
    payment_value DECIMAL,
    order_status VARCHAR,
    order_date DATE,
    delivered_date DATE,
    estimated_time_delivery DATE,
    feedback_score INT
);
