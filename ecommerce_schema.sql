PRAGMA foreign_keys = ON;

CREATE TABLE customers (
  customer_id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT NOT NULL,
  email TEXT UNIQUE,
  signup_date DATE
);

CREATE TABLE products (
  product_id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT NOT NULL,
  category TEXT,
  price REAL NOT NULL
);

CREATE TABLE orders (
  order_id INTEGER PRIMARY KEY AUTOINCREMENT,
  customer_id INTEGER NOT NULL,
  order_date DATE,
  total_amount REAL,
  status TEXT,
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
  order_item_id INTEGER PRIMARY KEY AUTOINCREMENT,
  order_id INTEGER NOT NULL,
  product_id INTEGER NOT NULL,
  quantity INTEGER NOT NULL,
  price REAL NOT NULL,
  FOREIGN KEY (order_id) REFERENCES orders(order_id),
  FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE payments (
  payment_id INTEGER PRIMARY KEY AUTOINCREMENT,
  order_id INTEGER NOT NULL,
  amount REAL,
  payment_date DATE,
  method TEXT,
  FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

-- sample data
INSERT INTO customers (name,email,signup_date) VALUES
('Asha Patel','asha@example.com','2024-05-01'),
('Ravi Singh','ravi@example.com','2024-06-10'),
('Maya Rao','maya@example.com','2024-07-15');

INSERT INTO products (name,category,price) VALUES
('T-Shirt','Apparel',299.00),
('Coffee Mug','Home',199.00),
('Laptop Stand','Accessories',1499.00),
('Notebook','Stationery',79.00);

INSERT INTO orders (customer_id,order_date,total_amount,status) VALUES
(1,'2024-07-01',598.00,'completed'),
(2,'2024-07-02',1499.00,'completed'),
(1,'2024-07-10',79.00,'completed'),
(3,'2024-07-20',199.00,'pending');

INSERT INTO order_items (order_id,product_id,quantity,price) VALUES
(1,1,2,299.00),
(2,3,1,1499.00),
(3,4,1,79.00),
(4,2,1,199.00);

INSERT INTO payments (order_id,amount,payment_date,method) VALUES
(1,598.00,'2024-07-01','card'),
(2,1499.00,'2024-07-02','netbanking'),
(3,79.00,'2024-07-10','upi');
