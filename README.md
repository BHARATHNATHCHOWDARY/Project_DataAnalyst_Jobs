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

![Alt text](https://github.com/BHARATHNATHCHOWDARY/Project_DataAnalyst_Jobs/blob/main/assests/1img.png)
 
- **Top 10 Companies by Average Salary:** This bar chart shows the top 10 companies offering the highest average annual salaries. The companies are ranked based on the average salary for the jobs listed.

  ![Alt text](https://github.com/BHARATHNATHCHOWDARY/Project_DataAnalyst_Jobs/blob/main/assests/2img.png)
  
- **Top 10 Job Titles by Average Salary** This bar chart displays the top 10 job titles with the highest average annual salaries. The jobs are ranked by the average salary associated with each title.

   ![Alt text](https://github.com/BHARATHNATHCHOWDARY/Project_DataAnalyst_Jobs/blob/main/assests/3img.png)
  
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

![Alt text](https://github.com/BHARATHNATHCHOWDARY/Project_DataAnalyst_Jobs/blob/main/assests/4img.png)
  
- **Most In-Demand Skills:** The bar chart illustrates the top 10 skills most frequently required for high-paying jobs.Skills like SQL, Python, and R are among the top, highlighting their importance in the job market.

![Alt text](https://github.com/BHARATHNATHCHOWDARY/Project_DataAnalyst_Jobs/blob/main/assests/5img.png)
  
- **Salary Distribution by Job Title:** The boxplot provides an overview of the salary distribution for different job titles. It shows the variation in salaries for each title, which can help in understanding the potential earnings for different positions.

![Alt text](https://github.com/BHARATHNATHCHOWDARY/Project_DataAnalyst_Jobs/blob/main/assests/6img.png)

### For more Queries & insights check them out here ###

🔍Insights for the Queries check them out here detailed: [Project_DataAnalyst_Jobs_Insights](/Project_DataAnalyst_Jobs_Insights/)

🔍SQL Queries Check them out here: [Project_DataAnalyst_Jobs](/Project_DataAnalyst_Jobs/)
 
# What I learned 📚✨ 

Throught this adventure, I've turbocharged my SQL toolkit with some serious firepower:

- **🛠️ Complex Query Crafting:** Enhanced my ability to write advanced SQL queries to extract, manipulate, and analyze large datasets, providing deeper insights into salary trends and skill demands.
- **🔍 Analytical Wizardry:** Developed a keen understanding of data analysis techniques, enabling me to identify key trends and patterns in the job market for data analysts.
- **🗄️ Database Management:** Gained proficiency in using PostgreSQL for effective database management, ensuring efficient data storage and retrieval.
- **💻 Coding and Debugging:** Improved my coding and debugging skills using Visual Studio Code, making my development process more efficient and error-free.
- **🤝 Version Control and Collaboration:** Learned the importance of version control and collaboration using Git and GitHub, which facilitated smooth teamwork and project management.

# Conclusions

### Insights
- **What are the top-paying data analyst jobs?**
This analysis identifies the highest-paying data analyst positions by examining salary data from various job postings, highlighting the most lucrative opportunities in the market.

- **What skills are required for these top-paying jobs?**
By linking job postings with required skills, we provide a comprehensive list of competencies needed for top-paying data analyst roles, guiding job seekers towards high-value skill development.

- **What skills are the most in demand for data analysts?**
Our project reveals the most sought-after skills in the data analytics job market, helping professionals focus on acquiring the abilities that employers prioritize.

- **What skills are associated with higher salaries?**
We analyze the correlation between specific skills and higher salary ranges, offering insights into which skills can lead to better compensation for data analysts.

- **What are the most optimal skills to learn?**
Based on industry trends and salary data, we recommend the most valuable skills for aspiring data analysts to focus on, ensuring they align with current market demands and job opportunities.

### Closing Thoughts 

- This project has provided a comprehensive view of the data analyst job market, revealing key insights that are crucial for both job seekers and employers. By identifying top-paying data analyst jobs 💼, we’ve highlighted the most lucrative opportunities available. Analyzing skills required for these top-paying jobs 🛠️ and those most in demand 🔍 offers clear guidance on which competencies to develop. Additionally, understanding skills associated with higher salaries 💰 and identifying the most optimal skills to learn 🎯 ensures that professionals can strategically enhance their career prospects. Overall, this project equips stakeholders with valuable information to make informed decisions about career development, hiring practices, and skill acquisition in the data analytics field.
