CREATE DATABASE IF NOT EXISTS lab_mysql;

USE lab_mysql;

CREATE TABLE customers (
customer_id int NOT NULL auto_increment,
name varchar(20),
phone_number varchar(25),
email varchar(255),
address varchar(255),
city varchar(20),
state varchar(105),
country varchar(60),
postal_code varchar(16),
PRIMARY KEY (customer_id)
);

CREATE TABLE salespersons (
  staff_id int NOT NULL auto_increment,
  name varchar (20),
  store varchar (60),
  PRIMARY KEY (staff_id)
);


CREATE TABLE cars (
  vin char(17),
  manufacturer varchar (30),
  model varchar(20),
   year smallint(4),
  color varchar (20),
  PRIMARY KEY (vin)
);

CREATE TABLE invoices (
  invoice_number int NOT NULL auto_increment,
  vin char,
  customer_id int,
  staff_id int,
  date datetime,
  PRIMARY KEY (invoice_number),
  CONSTRAINT vin_ref FOREIGN KEY (vin) REFERENCES cars (vin),
  CONSTRAINT cust_ref FOREIGN KEY (customer_id) REFERENCES customers (customer_id),
  CONSTRAINT staff_ref FOREIGN KEY (staff_id) REFERENCES salespersons (staff_id)
);