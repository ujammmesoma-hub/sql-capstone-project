-- Missing values:
SELECT
    COUNT(*) AS total_rows,
    COUNT(*) - COUNT(id) AS missing_id,
    COUNT(*) - COUNT(first_name) AS missing_first_name,
    COUNT(*) - COUNT(last_name) AS missing_last_name,
    COUNT(*) - COUNT(email) AS missing_email,
    COUNT(*) - COUNT(gender) AS missing_gender,
    COUNT(*) - COUNT(job_field) AS missing_job_field,
    COUNT(*) - COUNT(donation) AS missing_donation,
    COUNT(*) - COUNT(state) AS missing_state,
    COUNT(*) - COUNT(shirt_size) AS missing_shirt_size
FROM donation_data;

SELECT
    COUNT(*) AS total_rows,
    COUNT(*) - COUNT(id) AS missing_id,
    COUNT(*) - COUNT(donation_frequency) AS missing_donation_frequency,
    COUNT(*) - COUNT(university) AS missing_university,
    COUNT(*) - COUNT(car) AS missing_car,
    COUNT(*) - COUNT(second_language) AS missing_second_language,
    COUNT(*) - COUNT(favourite_colour) AS missing_favourite_colour,
    COUNT(*) - COUNT(movie_genre) AS missing_movie_genre
FROM donor_data;

SELECT
    ROUND(
    100.0 * (COUNT(*) - COUNT(university)) / COUNT(*),2
    ) AS missing_university_pct,
    ROUND(
    100.0 * (COUNT(*) - COUNT(second_language)) / COUNT(*),2
    ) AS missing_second_language_pct
FROM donor_data;

-- Duplicate IDs:
SELECT
    id,
    COUNT(*)
FROM donor_data
GROUP BY id
HAVING COUNT(*) > 1;

SELECT
    id,
    COUNT(*)
FROM donation_data
GROUP BY id
HAVING COUNT(*) > 1;

-- Invalid donations:
SELECT *
FROM donation_data
WHERE donation <= 0;

-- Orphan donations - if donation exists with no corresponding donor:
SELECT 
    donation_data.id, donor_data.id
FROM donation_data
LEFT JOIN donor_data
ON donation_data.id = donor_data.id
WHERE donor_data.id IS NULL;