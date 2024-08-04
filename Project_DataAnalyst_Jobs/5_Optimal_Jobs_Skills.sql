/*
Question:what are the top job_skills or optimal skills required
-- Includiong th Demand count
-- With there salary average and maximum salary ordered
-- demand count should atleast be greater condition

*/
 
WITH optimal AS
(SELECT
    sd.skill_id,
    count(sd.skill_id) as Demand_count,
    round(avg(salary_year_avg),0) as avg_salary,
    round(MAX(salary_year_avg),0) as Salary_Max
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
    and job_work_from_home=True 
    and salary_year_avg IS NOT NULL
GROUP BY 
    sd.skill_id
limit 10
)

SELECT
    op.skill_id,
    sd2.skills,
    op.Demand_count,
    op.avg_salary,
    op.Salary_Max
FROM
    optimal op
JOIN 
    skills_dim sd2
on  op.skill_id=sd2.skill_id
WHERE 
    Demand_count>=5
ORDER BY 
    avg_salary,
    Demand_count DESC

/*
--The Most Optimal Skills Required For The Role Of Data Analyst
*/    

/*
//RESULTS
[
  {
    "skill_id": 0,
    "skills": "sql",
    "demand_count": "398",
    "avg_salary": "97237",
    "salary_max": "255830"
  },
  {
    "skill_id": 9,
    "skills": "javascript",
    "demand_count": "20",
    "avg_salary": "97587",
    "salary_max": "145000"
  },
  {
    "skill_id": 7,
    "skills": "sas",
    "demand_count": "63",
    "avg_salary": "98902",
    "salary_max": "165000"
  },
  {
    "skill_id": 5,
    "skills": "r",
    "demand_count": "148",
    "avg_salary": "100499",
    "salary_max": "255830"
  },
  {
    "skill_id": 1,
    "skills": "python",
    "demand_count": "236",
    "avg_salary": "101397",
    "salary_max": "255830"
  },
  {
    "skill_id": 2,
    "skills": "nosql",
    "demand_count": "13",
    "avg_salary": "101414",
    "salary_max": "150000"
  },
  {
    "skill_id": 4,
    "skills": "java",
    "demand_count": "17",
    "avg_salary": "106906",
    "salary_max": "170000"
  },
  {
    "skill_id": 8,
    "skills": "go",
    "demand_count": "27",
    "avg_salary": "115320",
    "salary_max": "205000"
  },
  {
    "skill_id": 3,
    "skills": "scala",
    "demand_count": "5",
    "avg_salary": "124903",
    "salary_max": "160515"
  }
]
*/