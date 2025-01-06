# E-Commerce Data Warehouse and Analysis Project

## Project Overview
This project focuses on designing and implementing a data warehouse (DWH) for an e-commerce platform to address key business questions. It involves dimensional modeling, data transformation, and creating insightful dashboards to aid decision-making.

## Objectives
- Design a star schema DWH model to store e-commerce data.
- Implement an ETL pipeline to transform and load data into the DWH.
- Answer critical business questions through SQL queries.
- Visualize data insights using Power BI dashboards.


## Data Sources
The project utilizes the following datasets:

1. **User Dataset**
   - Columns: `user_name`, `customer_zip_code`, `customer_city`, `customer_state`

2. **Product Dataset**
   - Columns: `product_id`, `product_category`, `product_name_length`, `product_description_length`, `product_photos_qty`, `product_weight_g`, `product_length_cm`, `product_height_cm`, `product_width_cm`

3. **Seller Dataset**
   - Columns: `seller_id`, `seller_zip_code`, `seller_city`, `seller_state`

4. **Order Item Dataset**
   - Columns: `order_id`, `order_item_id`, `product_id`, `seller_id`, `pickup_limit_date`, `price`, `shipping_cost`

5. **Order Dataset**
   - Columns: `order_id`, `user_name`, `order_status`, `order_date`, `order_approved_date`, `pickup_date`, `delivered_date`, `estimated_time_delivery`

6. **Payment Dataset**
   - Columns: `order_id`, `payment_sequential`, `payment_type`, `payment_installments`, `payment_value`

7. **Feedback Dataset**
   - Columns: `feedback_id`, `order_id`, `feedback_score`, `feedback_form_sent_date`, `feedback_answer_date`

## Data Warehouse Design

The DWH follows a star schema design with:

- **Fact Table:** `FactOrders`
- **Dimension Tables:**
  - `DimUser`
  - `DimProduct`
  - `DimSeller`
  - `DimOrderItem`

## Key Features

1. **Dimensional Modeling**
   - Designed a star schema with relationships between fact and dimension tables.

2. **ETL Process**
   - Developed a Python script to extract, transform, and load data into the PostgreSQL database.

3. **SQL Queries**
   - Addressed business questions such as peak seasons, preferred payment methods, and delivery delays.

4. **Power BI Dashboard**
   - Created an interactive dashboard to visualize insights, including:
     - Sales trends
     - Customer satisfaction
     - Delivery performance

## Business Questions Answered
1. **Peak Season Analysis**: Identified months with the highest order volume.
2. **User Activity Analysis**: Determined times users are most likely to make orders.
3. **Payment Insights**: Analyzed preferred payment methods and average installments.
4. **Delivery Performance**: Evaluated delays and their impact on customer satisfaction.
5. **Geographic Insights**: Explored order frequency and delivery delays across states.

## Technologies Used
- **Database:** PostgreSQL (pgAdmin4)
- **ETL:** Python (pandas, psycopg2)
- **Visualization:** Power BI
- **Version Control:** GitHub

## Setup Instructions

1. Clone the repository:
   ```bash
   git clone <repository-url>
   ```

2. Set up the PostgreSQL database and import the schema provided in the `sql` folder.

3. Run the ETL Python script to load data into the DWH:
   ```bash
   python etl_pipeline.py
   ```

4. Open the Power BI dashboard file (`dashboard.pbix`) to explore the insights.

## Repository Structure

```
|-- Dataset/                    # Sample datasets
|-- Schema/                     # ERD and SQL script for table creation and queries
|-- ETL.ipynb          # Python script for ETL process
|-- Analysis           # Power BI dashboard file and sql queries for answering questions
|-- README.md                # Project documentation
```

## License
This project is licensed under the MIT License. See the `LICENSE` file for details.

## Contact
For questions or collaboration opportunities, feel free to reach out:

- **Name:** Mohamed Batran
- **Email:** batranmohamed001@gmail.com
- **Location:** Giza, Egypt
- **Linkedin:** https://www.linkedin.com/in/mohamed-batran-768289203/

---

Thank you for exploring this project!
