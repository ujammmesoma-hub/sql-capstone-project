CREATE VIEW vw_gender_donation_summary AS
SELECT
    gender,
	COUNT(*) AS number_of_donations,
	SUM(donation) AS total_donation,
	ROUND(AVG(donation),2) AS average_donation
FROM donation_data
GROUP BY gender;

CREATE VIEW view_state_donation_summary AS
SELECT
    state,
	COUNT(*) AS number_of_donations,
	SUM(donation) AS total_donation,
	ROUND(AVG(donation),2) AS average_donation
FROM donation_data
GROUP BY state
ORDER BY total_donation DESC;

CREATE VIEW view_donation_frequency_summary AS
SELECT
    donor_data.donation_frequency,
	COUNT(*) AS number_of_donations,
	SUM(donation_data.donation) AS total_donation,
	ROUND(AVG(donation_data.donation),2) AS average_donation
FROM donor_data
INNER JOIN donation_data
ON donor_data.id = donation_data.id
GROUP BY donor_data.donation_frequency
ORDER BY total_donation DESC;

CREATE VIEW view_job_field_summary AS
SELECT
    job_field,
	COUNT(*) AS number_of_donations,
	SUM(donation) AS total_donation,
	ROUND(AVG(donation),2) AS average_donation
FROM donation_data
GROUP BY job_field
ORDER BY total_donation DESC;