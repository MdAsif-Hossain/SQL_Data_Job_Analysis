/* 
1. what are the top paying jobs fpr my role?
2. What are the skills required for those top paying roles?
3. What are the most in demand skilles in my role?
4. What are the top skills based on salary for my role?
5. What are the optimal skills to learn?
*/

WITH top_paying_jobs AS (

SELECT 
    job_id,
    job_title,
    salary_year_avg,
    name as company_name
  

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
)
SELECT 

    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC