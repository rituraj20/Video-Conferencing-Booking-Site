CREATE TABLE Customer (
    empid VARCHAR(50) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    mobile_number VARCHAR(15) NOT NULL,
    password VARCHAR(255) NOT NULL,
    department VARCHAR(50) NOT NULL
);

