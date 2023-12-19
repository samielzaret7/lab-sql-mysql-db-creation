CREATE DATABASE IF NOT EXISTS lab_mysql;

USE lab_mysql;

CREATE TABLE customers (
customer_id int NOT NULL auto_increment,
name varchar(20),
phone_number char(12),
email varchar(255),
city varchar(20),
address varchar(255),
country varchar(60),
state varchar(105),
postal_code varchar(16),
PRIMARY KEY (customer_id)
);

CREATE TABLE salespersons (
  staff_id int NOT NULL auto_increment,
  name varchar (20),
  store char (4),
  PRIMARY KEY (staff_id)
);


CREATE TABLE cars (
  vin char(17),
  manufacturer varchar (30),
  color varchar (20),
  year smallint(4),
  model varchar(20),
  PRIMARY KEY (vin)
);

CREATE TABLE invoices (
  invoice_number int NOT NULL auto_increment,
  vin char(17),
  customer_id int,
  staff_id int,
  date datetime,
  PRIMARY KEY (invoice_number),
  CONSTRAINT vin_ref FOREIGN KEY (vin) REFERENCES cars (vin),
  CONSTRAINT cust_ref FOREIGN KEY (customer_id) REFERENCES customers (customer_id),
  CONSTRAINT staff_ref FOREIGN KEY (staff_id) REFERENCES salespersons (staff_id)
);

ALTER TABLE customers DROP COLUMN phone_number;
ALTER TABLE customers ADD phone_number CHAR(25);

ALTER TABLE customers CHANGE COLUMN phone_number phone_number CHAR(25) AFTER name;

ALTER TABLE salespersons DROP COLUMN store;
ALTER TABLE salespersons ADD store VARCHAR(30);

