/*
Question: What are the top 10  salary skills with more demand 
-- Salary ranges of the demanded skills 
-- For the role Data Analyst
-- -- Salary in max,min and avg
*/


SELECT
    skills,
    count(sd.skills) as Skills_Demand,
    round(avg(salary_year_avg),1) as Salary_Avg_Demand,
    MAX(salary_year_avg) as Salary_Max,
    MIN(salary_year_avg) as Salary_Min
FROM
    job_postings_fact jpf
JOIN
    skills_job_dim sjd
ON  jpf.job_id=sjd.job_id
JOIN 
    skills_dim sd
ON  sjd.skill_id=sd.skill_id
where 
    job_title_short='Data Analyst' 
    AND job_work_from_home=True
GROUP BY 
    skills
order by 
    Skills_Demand DESC
limit 10


/*
//RESULTS
[
  {
    "skills": "sql",
    "skills_demand": "7291",
    "salary_avg_demand": "97237.2",
    "salary_max": "255829.5",
    "salary_min": "35000.0"
  },
  {
    "skills": "excel",
    "skills_demand": "4611",
    "salary_avg_demand": "87288.2",
    "salary_max": "255829.5",
    "salary_min": "36000.0"
  },
  {
    "skills": "python",
    "skills_demand": "4330",
    "salary_avg_demand": "101397.2",
    "salary_max": "255829.5",
    "salary_min": "35000.0"
  },
  {
    "skills": "tableau",
    "skills_demand": "3745",
    "salary_avg_demand": "99287.7",
    "salary_max": "255829.5",
    "salary_min": "41000.0"
  },
  {
    "skills": "power bi",
    "skills_demand": "2609",
    "salary_avg_demand": "97431.3",
    "salary_max": "255829.5",
    "salary_min": "47500.0"
  },
  {
    "skills": "r",
    "skills_demand": "2142",
    "salary_avg_demand": "100498.8",
    "salary_max": "255829.5",
    "salary_min": "35000.0"
  },
  {
    "skills": "sas",
    "skills_demand": "1866",
    "salary_avg_demand": "98902.4",
    "salary_max": "165000.0",
    "salary_min": "46500.0"
  },
  {
    "skills": "looker",
    "skills_demand": "868",
    "salary_avg_demand": "103795.3",
    "salary_max": "167000.0",
    "salary_min": "35000.0"
  },
  {
    "skills": "azure",
    "skills_demand": "821",
    "salary_avg_demand": "111225.1",
    "salary_max": "255829.5",
    "salary_min": "65000.0"
  },
  {
    "skills": "powerpoint",
    "skills_demand": "819",
    "salary_avg_demand": "88701.1",
    "salary_max": "255829.5",
    "salary_min": "47500.0"
  }
]
*/