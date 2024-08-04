/*
Question: What are the top 10 highest-paying 'Data Analyst' job postings 
-- where the job is a remote job
-- the salary,including job titles, job location, job schedule type,
   average annual salary, and the job posted date?
*/


SELECT
    job_id,
    name as company_name,
    job_title_short,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date::date
FROM  
    job_postings_fact jpf
JOIN
    company_dim cd
ON jpf.company_id=cd.company_id
where 
    salary_year_avg is not null 
    and job_title_short='Data Analyst'
    and job_location='Anywhere'
ORDER BY
    salary_year_avg DESC
LIMIT 10;    