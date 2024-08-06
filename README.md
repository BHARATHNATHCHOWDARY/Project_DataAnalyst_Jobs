# Introduction
📊This project analyzes the job market for data analyst positions by examining datasets related to skill demand and 💰salary statistics. The goal is to provide insights into the most sought-after skills, salary ranges, and emerging trends in the industry. By leveraging tools like Python, Pandas, and data visualization libraries, the project aims to help 🔥job seekers, employers, and educators understand current market dynamics. The analysis will enable informed decision-making regarding skill development, hiring practices, and educational curricula, ultimately benefiting all stakeholders in the data analytics field.

💡

🔍SQL Queries Check them out here: [Project_DataAnalyst_Jobs](/Project_DataAnalyst_Jobs/)

🔍Insights for the Queries check them out here detailed: [Project_DataAnalyst_Jobs_Insights](/Project_DataAnalyst_Jobs_Insights/)

# Background
The data analytics job market is rapidly evolving with 📈increasing demand for data-driven decision-making across industries. Understanding current trends in 🔥skill demand and salary statistics for data analyst positions is essential for job seekers, employers, and educators.

This project analyzes the job market for data analyst positions by examining datasets on skill demand and salary statistics. Using tools like Python, Pandas, and data visualization libraries, we aim to identify the most sought-after skills, salary ranges, and emerging trends in the industry. Our analysis provides insights that help job seekers develop critical skills, enable employers to make informed hiring decisions, and guide educators in designing relevant curricula.

By offering a comprehensive overview of current market dynamics, this project benefits all stakeholders in the data analytics field.

### The Question that I want to answer through my
#### SQL queries were:

1. What are the top_paying data analyst jobs?
2. What skills are required for these top_paying jobs?
3. What skills are the most in demand for data analysts?
4. What skills are associated with higher salaries?
5. What are the most optimal skills to learn?

# Tools I Used
For my deep dive into the data analyst job  market,
I harnessed the power of several key tools:

- **SQL:** Used for querying and managing the datasets, allowing for efficient data retrieval and manipulation.
- **PostgreSQL:** Utilized as the database management system to store, organize, and analyze large datasets.
- **Visual Studio Code:** Provided a powerful and flexible development environment for writing and debugging code.
- **Git & GitHub:** Facilitated version control and collaborative work, enabling seamless tracking of changes and contributions.

# The Analysis 
 Each query for this project aimed at investing specific aspects of the data analyst job market.
 Here's how I approached each question: 

 ### 1. Top Paying Data Analyst Jobs
 This section identifies the highest-paying data analyst positions in the market by analyzing salary data from various sources. It highlights which industries and roles offer the most lucrative opportunities for data analysts. This information helps job seekers target their career paths and assists employers in benchmarking their compensation packages.

```sql
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
```
Here's the breakdown of the top data analyst jobs:

- **Distribution of Salaries:** The histogram shows the distribution of average annual salaries for the jobs listed. The data is positively skewed, indicating a higher frequency of lower to mid-range salaries, with fewer jobs offering extremely high salaries.

![Alt text]()
 
- **Top 10 Companies by Average Salary:** This bar chart shows the top 10 companies offering the highest average annual salaries. The companies are ranked based on the average salary for the jobs listed.
- **Top 10 Job Titles by Average Salary** This bar chart displays the top 10 job titles with the highest average annual salaries. The jobs are ranked by the average salary associated with each title.

  ### 2. Top Paying Data Analyst Jobs with Skills
  This section presents the top-paying data analyst jobs along with the essential skills required for each position. By querying job postings and company data, we identify the highest average annual salaries for data analyst roles and provide details on the companies offering these positions. Additionally, we list the specific skills associated with each high-paying job, offering valuable insights for job seekers aiming to enhance their skill sets and target lucrative opportunities in the market.

```sql
WITH Top_Paying_Skills_jobs AS

(SELECT
    job_id,
    name as company_name,
    job_title,
    salary_year_avg
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
limit 10    
)

select
    tpsj.*,
    skills
FROM
    Top_Paying_Skills_jobs tpsj
JOIN
    skills_job_dim sjd
ON  tpsj.job_id=sjd.job_id
JOIN 
    skills_dim sd
ON  sjd.skill_id=sd.skill_id
ORDER BY 
    salary_year_avg DESC    
```
- **Top Companies by Average Salary:** The bar chart shows the top 10 companies offering the highest average salaries.This can help job seekers target these companies for better salary prospects.
- **Most In-Demand Skills:** The bar chart illustrates the top 10 skills most frequently required for high-paying jobs.Skills like SQL, Python, and R are among the top, highlighting their importance in the job market.
- **Salary Distribution by Job Title:** The boxplot provides an overview of the salary distribution for different job titles. It
shows the variation in salaries for each title, which can help in understanding the
potential earnings for different positions.


 
# What I learned
# Conclusions
