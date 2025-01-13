CREATE TABLE customers(
    customer_identifier VARCHAR NOT NULL PRIMARY KEY,
    date_last_updated VARCHAR,
    sex_code BOOLEAN,
    income_group_code INT NOT NULL,
    number_of_accounts INT,
    occupational_status_code INT,
    age INT,
    FOREIGN KEY (income_group_code) REFERENCES income_group(income_group_code)
);


CREATE TABLE income_group (
    income_group_code INT NOT NULL PRIMARY KEY,
    income_group_desc VARCHAR
);


CREATE TABLE transactions (
    transaction_id SERIAL NOT NULL PRIMARY KEY,
    transaction_description VARCHAR,
    customer_identifier VARCHAR NOT NULL,
    record_date TIMESTAMP,
    account_type_code VARCHAR,
    account_balance FLOAT,
    amt FLOAT,
    event_number INT,
    product_code VARCHAR,
    channel VARCHAR,
    account_number VARCHAR,
    transaction_reference VARCHAR,
    FOREIGN KEY (customer_identifier) REFERENCES customers(customer_identifier)
);



CREATE TABLE employment_status (
    employee_status_code INT NOT NULL PRIMARY KEY,
    employee_status_desc VARCHAR NOT NULL
);






