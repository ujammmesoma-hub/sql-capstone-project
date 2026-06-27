SELECT * FROM Donation_Data;

SELECT * FROM Donor_Data;

SELECT COUNT(*) AS donation_records
FROM donation_data;

SELECT COUNT(*) AS donor_records
FROM donor_data;

-- How many donors are there?
SELECT COUNT(*) AS total_donors 
FROM donor_data;

-- How many donations were made?
SELECT COUNT(*) AS number__donations
FROM donation_data;

-- Distinct genders:
SELECT DISTINCT gender
FROM donation_data;

-- Distinct frequencies:
SELECT DISTINCT donation_frequency
FROM donor_data

-- Distinct states:
SELECT DISTINCT state
FROM donation_data;

-- What is the donation amount range?
SELECT
    MIN(donation) AS min_donation_amount,
    MAX(donation) AS max_donation_amount,
    ROUND(AVG(donation),2) AS average_donation
FROM donation_data;