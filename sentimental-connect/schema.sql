-- Create database if not exists
CREATE DATABASE IF NOT EXISTS linkedin;

-- Use the linkedin database
USE linkedin;

-- Create table for users
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(128) NOT NULL
);

-- Create table for schools
CREATE TABLE IF NOT EXISTS schools (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    type ENUM('Primary', 'Secondary', 'Higher Education') NOT NULL,
    location VARCHAR(255) NOT NULL,
    founded_year INT NOT NULL
);

-- Create table for companies
CREATE TABLE IF NOT EXISTS companies (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    industry ENUM('Technology', 'Education', 'Business') NOT NULL,
    location VARCHAR(255) NOT NULL
);

-- Create table for connections with people
CREATE TABLE IF NOT EXISTS connections_people (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id1 INT NOT NULL,
    user_id2 INT NOT NULL,
    FOREIGN KEY (user_id1) REFERENCES users(id),
    FOREIGN KEY (user_id2) REFERENCES users(id)
);

-- Create table for connections with schools
CREATE TABLE IF NOT EXISTS connections_schools (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    school_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    degree VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (school_id) REFERENCES schools(id)
);

-- Create table for connections with companies
CREATE TABLE IF NOT EXISTS connections_companies (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    company_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    title VARCHAR(255),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (company_id) REFERENCES companies(id)
);

-- Insert sample data
INSERT INTO users (first_name, last_name, username, password) VALUES
('Claudine', 'Gay', 'claudine', 'password'),
('Reid', 'Hoffman', 'reid', 'password');

INSERT INTO schools (name, type, location, founded_year) VALUES
('Harvard University', 'Higher Education', 'Cambridge, Massachusetts', 1636);

INSERT INTO companies (name, industry, location) VALUES
('LinkedIn', 'Technology', 'Sunnyvale, California');

INSERT INTO connections_schools (user_id, school_id, start_date, end_date, degree) VALUES
(1, 1, '1993-01-01', '1998-12-31', 'PhD');

INSERT INTO connections_companies (user_id, company_id, start_date, end_date, title) VALUES
(2, 1, '2003-01-01', '2007-02-01', 'CEO and Chairman');
