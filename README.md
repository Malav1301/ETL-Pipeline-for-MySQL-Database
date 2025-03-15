# **ETL Pipeline for MySQL Database**

## 📌 **Project Overview**
This project demonstrates a complete ETL (Extract, Transform, Load) pipeline implementation for a MySQL database. It involves extracting data from CSV files, cleaning and transforming it using Python, and loading it into a MySQL database for analysis. The pipeline concludes with analytical insights derived using SQL queries and Python.

---

## 📂 **Dataset Used**
- **Datasets**: 
  - `customers.csv`  
  - `products.csv`  
  - `orders.csv`  
  - `payments.csv`
- The datasets include features such as **Customer Details**, **Order Details**, **Product Information**, and **Payment Transactions**.

---

## 🛠️ **Data Processing Steps**

### **1️⃣ Data Cleaning & Transformation (Python)**
- Removed missing values and duplicates.  
- Converted inconsistent data types to ensure integrity.  
- Handled referential constraints to align datasets for database integration.  

### **2️⃣ Database Integration (MySQL)**
- Designed and implemented the database schema with **Primary Keys** and **Foreign Keys** to ensure relational integrity.  
- Created tables: `Customers`, `Products`, `Orders`, and `Payments`.

### **3️⃣ Data Loading (Python)**
- Utilized `MySQL Connector` and `SQLAlchemy` libraries to push transformed data into MySQL tables.  
- Verified data insertion through validation queries.

### **4️⃣ Analytical Queries (SQL)**
- Wrote SQL queries to extract insights, such as:
  - Top customers by spending.
  - Most popular product categories.
  - Orders without successful payments.

---

## 📊 **Analytical Insights**

### **Key Queries & Insights**

1. **Retrieve All Customer Details**
```sql
SELECT * FROM Customers;
 ``` 


2. **Find Top 5 Customers by Spending**
```sql
SELECT c.name, SUM(o.total_amount) AS total_spent 
FROM Customers c 
JOIN Orders o ON c.customer_id = o.customer_id 
GROUP BY c.customer_id 
ORDER BY total_spent DESC 
LIMIT 5;
```


3. **Find the Most Popular Product Category**
```sql
SELECT p.category, COUNT(o.order_id) AS total_orders 
FROM Products p 
JOIN Orders o ON p.product_id = o.product_id 
GROUP BY p.category 
ORDER BY total_orders DESC 
LIMIT 1;
```

---

## 📌 **Highlights**


### **Key Insights**
- **Most popular product category**: `Clothing`
- **Month with the most orders**: `January`
- **Most used payment method**: `Cash On Delivery`

---

## 🚀 **Future Work**
- Add support for **PostgreSQL** and other databases.
- Automate the ETL process for **real-time data ingestion**.
- Integrate **visualization tools** for enhanced reporting.


## 🔗 Contributors
👤 **Malav Menpara**  
📧 **malavmenpara2001@gmail.com**  
💼 **[GitHub](https://github.com/Malav1301)**





