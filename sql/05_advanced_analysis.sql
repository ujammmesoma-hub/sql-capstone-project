/
*----------------------------------------------
------------
Donor Ranking
-----------------------------------------------
----------*/

WITH donor_rankings AS (
    SELECT
	    id,
		first_name,
		last_name,
		donation,
		RANK() OVER (
		    ORDER BY donation DESC
		) AS donor_rank
	FROM donation_data
)
SELECT *
FROM donor_rankings
ORDER BY donor_rank;

/
*--------------------------------------------------------
-------------------
Top 20 donors
---------------------------------------------------------
------------------*/

SELECT
    id,
	first_name,
	last_name,
	donation
FROM donation_data
ORDER BY donation DESC
LIMIT 20;

/
*---------------------------------------------------------
---------------------
Average donation amount for each donation frequency
----------------------------------------------------------
--------------------*/

WITH donation_frequency_analysis AS (
    SELECT
	    donor_data.donation_frequency,
		donation_data.donation
	FROM donor_data
	INNER JOIN donation_data
	ON donor_data.id = donation_data.id
)
SELECT
    donation_frequency,
	COUNT(*) AS number_of_donations,
	SUM(donation) AS total_donation,
	ROUND(AVG(donation),2) AS average_donation
FROM donation_frequency_analysis
GROUP BY donation_frequency
ORDER BY average_donation DESC;
/
*---------------------------------------------------
---------------
Highest donor in each state
----------------------------------------------------
--------------*/

WITH ranked_donors AS (
    SELECT
	    state,
		first_name,
		last_name,
		donation,
		RANK() OVER(
		    PARTITION BY state
		    ORDER BY donation DESC
		) AS donor_rank
	FROM donation_data
)
SELECT
    state,
	first_name,
	last_name,
	donation
FROM ranked_donors
WHERE donor_rank = 1
ORDER BY donation DESC;