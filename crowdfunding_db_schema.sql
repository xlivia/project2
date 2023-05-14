-- Create a new Postgres database, named crowdfunding_db.
CREATE DATABASE crowdfunding_db;

\c crowdfunding_db;

-- Table schema for the 'contacts' table
CREATE TABLE contacts (
    contact_id INT,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email VARCHAR(255),
    PRIMARY KEY (contact_id)
);

-- Table schema for the 'category' table
CREATE TABLE category (
    category_id VARCHAR(255),
    category VARCHAR(255),
    PRIMARY KEY (category_id)
);

-- Table schema for the 'subcategory' table
CREATE TABLE subcategory (
    subcategory_id VARCHAR(255),
    subcategory VARCHAR(255),
    PRIMARY KEY (subcategory_id)
);

-- Table schema for the 'campaign' table
CREATE TABLE campaign (
    cf_id INT,
    contact_id INT,
    company_name VARCHAR(255),
    description TEXT,
    goal FLOAT,
    pledged FLOAT,
    outcome VARCHAR(255),
    backers_count INT,
    country VARCHAR(255),
    currency VARCHAR(255),
    launched_date DATE,
    end_date DATE,
    category_id VARCHAR(255),
    subcategory_id VARCHAR(255),
    FOREIGN KEY (contact_id) REFERENCES contacts (contact_id),
    FOREIGN KEY (category_id) REFERENCES category (category_id),
    FOREIGN KEY (subcategory_id) REFERENCES subcategory (subcategory_id)
);

-- Verify contacts table
SELECT * FROM contacts;

-- Verify category table
SELECT * FROM category;

-- Verify subcategory table
SELECT * FROM subcategory;

-- Verify campaign table
SELECT * FROM campaign;

-- Import contacts.csv into the contacts table
\copy contacts FROM 'Resources/contacts.csv' DELIMITER ',' CSV HEADER;

-- Import category.csv into the category table
\copy category FROM 'Resources/category.csv' DELIMITER ',' CSV HEADER;

-- Import subcategory.csv into the subcategory table
\copy subcategory FROM 'Resources/subcategory.csv' DELIMITER ',' CSV HEADER;

-- Import campaign.csv into the campaign table
\copy campaign FROM 'Resources/campaign.csv' DELIMITER ',' CSV HEADER;

-- Verify contacts table
SELECT * FROM contacts;

-- Verify category table
SELECT * FROM category;

-- Verify subcategory table
SELECT * FROM subcategory;

-- Verify campaign table
SELECT * FROM campaign;
