-- What are the Top paying job in data analysis?
-- find the top 10
-- removing NULL values


SELECT 
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    name as company_name,
    job_posted_date

FROM 
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_location ='Anywhere' AND
    salary_year_avg is NOT NULL

ORDER BY
    salary_year_avg DESC
LIMIT 10
