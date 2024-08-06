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


 
# What I learned
# Conclusions
