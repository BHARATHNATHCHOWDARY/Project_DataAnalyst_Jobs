/*
Question: What are the top 10 skills with more demand 
-- Salary ranges of the demanded skills 
-- For the role Data Analyst
-- Work from home is required 
*/


SELECT
    skills,
    count(sd.skills) as Skills_Demand
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
    "skills_demand": "7291"
  },
  {
    "skills": "excel",
    "skills_demand": "4611"
  },
  {
    "skills": "python",
    "skills_demand": "4330"
  },
  {
    "skills": "tableau",
    "skills_demand": "3745"
  },
  {
    "skills": "power bi",
    "skills_demand": "2609"
  },
  {
    "skills": "r",
    "skills_demand": "2142"
  {
    "skills": "sas",
    "skills_demand": "1866"
  },
  {
    "skills": "looker",
    "skills_demand": "868"
  },
  {
    "skills": "azure",
    "skills_demand": "821"
  },
  {
    "skills": "powerpoint",
    "skills_demand": "819"
  }
]
*/