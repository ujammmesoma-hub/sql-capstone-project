/
*------------------------------------------------------------------
-------------
Question 1: How Much Is The Total Donation?

Approach: Aggregated all donation values.
------------------------------------------------------------------
-----------*/

SELECT
    SUM(donation) AS total_donation
FROM donation_data;

/
*------------------------------------------------------------------
------------
Question 2: What is The Total Donation by Gender?

Approach: Calculated the total donation amount for each gender.
-------------------------------------------------------------------
----------*/

SELECT
    gender,
	SUM(donation) AS total_donation
FROM donation_data
GROUP BY gender
ORDER BY total_donation DESC;

/
*----------------------------------------------------------------------
-------------
Question 3: Show the total donations and number of donations by gender

Approach: Grouped donation records by gender,
calculated the total donation amount and the number of donations.
-----------------------------------------------------------------------
-----------*/

WITH gender_donation_summary AS (
    SELECT
	    gender,
		donation
	FROM donation_data
)
SELECT
    gender,
	SUM(donation) AS total_donation,
	COUNT(donation) AS number_of_donations
FROM gender_donation_summary
GROUP BY gender
ORDER BY total_donation DESC;

/
*------------------------------------------------------------------------
--------------
Question 4: What is the total donation made by frequency of donation?

Approach: Joined donor and donations tables using id,
then aggregated donation amounts by donation frequency.
-------------------------------------------------------------------------
------------*/

WITH donation_frequency_summary AS (
    SELECT
        donor_data.donation_frequency,
	    donation_data.donation
    FROM donor_data
    INNER JOIN donation_data
    ON donor_data.id = donation_data.id
)
SELECT
    donation_frequency,
	SUM(donation) AS total_donation
FROM donation_frequency_summary
GROUP BY donation_frequency
ORDER BY total_donation DESC;

/
*---------------------------------------------------------------------------
---------------
Question 5: What is the total donations and number of donations by job field?

Approach: Grouped donation records by job field,
calculated the total donation amount and the number of donations.
----------------------------------------------------------------------------
--------------*/

WITH job_field_donation_summary AS (
    SELECT
	    job_field,
		donation
	FROM donation_data
)
SELECT
    job_field,
	SUM(donation) AS total_donation,
	COUNT(donation) AS number_of_donations
FROM job_field_donation_summary
GROUP BY job_field
ORDER BY total_donation DESC;

/
*------------------------------------------------------------------------
-----------------
Question 6: Total donation and number of donations above $200

Approach: Filtered donations greater than $200,
then calculated the total donation amount,
and counted the number of qualifying donations.
-------------------------------------------------------------------------
---------------*/

WITH donations_above_200 AS (
    SELECT
	    donation
	FROM donation_data
	WHERE donation > 200
)
SELECT
    SUM(donation) AS total_donation,
	COUNT(*) AS number_of_donations
FROM donations_above_200;

/
*-------------------------------------------------------------------------
----------------------
Question 7: Total donation and number of donations below $200

Approach: Filtered donations less than $200,
then calculated the total donation amount,
and counted the number of qualifying donations.
--------------------------------------------------------------------------
--------------------*/

WITH donations_below_200 AS (
    SELECT
	    donation
	FROM donation_data
	WHERE donation < 200
)
SELECT
    SUM(donation) AS total_donation,
	COUNT(*) AS number_of_donations
FROM donations_below_200;

/
*--------------------------------------------------------------------------
--------------------
Question 8: Which top 10 states contributes the highest donations?

Approach: Grouped donation records by state,
calculated the total donation amount for each state,
ranked them in descending order,
and returned the top 10.
---------------------------------------------------------------------------
-------------------*/

WITH state_donation_summary AS (
    SELECT
	   state,
	   donation
	FROM donation_data
)
SELECT
    state,
	SUM(donation) AS total_donation
FROM state_donation_summary
GROUP BY state
ORDER BY total_donation DESC
LIMIT 10;

/
*-----------------------------------------------------------------------------
----------------------
Question 9: Which top 10 states contributes the least donations?

Approach: Grouped donation records by state,
calculated the total donation amount for each state,
ranked them in ascending order,
and returned the top 10.
------------------------------------------------------------------------------
--------------------*/

WITH state_donation_summary AS (
    SELECT
	    state,
		donation
	FROM donation_data
)
SELECT
    state,
	SUM(donation) AS total_donation
FROM state_donation_summary
GROUP BY state
ORDER BY total_donation ASC
LIMIT 10;

/
*--------------------------------------------------------------------------------
----------------------
Question 10: What are the top 10 cars driven by the highest donors?

Approach: Joined the donor and donation tables using the donor id,
calculated the total donation amounts and number of donors by car model,
and returned the top 10 based on total donations.
---------------------------------------------------------------------------------
---------------------*/

WITH donors_cars_table AS (
    SELECT
	    donor_data.car,
	    donation_data.donation
	FROM donor_data
	INNER JOIN donation_data
	ON donor_data.id = donation_data.id
)
SELECT
    car,
	SUM(donation) AS total_donation,
	COUNT(*) AS number_of_donors
FROM donors_cars_table
GROUP BY car
ORDER BY total_donation DESC
LIMIT 10;