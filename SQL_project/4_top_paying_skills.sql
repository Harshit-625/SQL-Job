/*
Question: What are the top skills based on salary?
-Look at the average salary associated with each skill for Data Analyst positions
-Focuses on roles with specified salaries, regardless of location
-Why? It reveals how different skills impact salary levels for Data Analysts and helps identify the most financially rewarding skills to acquire or improve
*/

SELECT 
  skills,
  ROUND(AVG(salary_year_avg), 0) AS average_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE   
  job_title_short = 'Data Analyst'
  AND salary_year_avg IS NOT NULL
  AND job_work_from_home = TRUE
GROUP BY 
  skills
ORDER BY  
  average_salary DESC
LIMIT 25

/*
Insights :
1. PySpark Dominates
PySpark tops the list at $208K+, indicating big data + distributed computing skills are in massive demand (especially for hybrid analyst–engineer roles).

2. DevOps + Collaboration Tools Matter
Tools like Bitbucket, GitLab, Jenkins, Atlassian, and Notion show that version control, automation, and collaboration tools are highly valued — even in analyst roles.

3. Advanced ML & Big Data Tools
Couchbase, Databricks, Elasticsearch, Airflow, Kubernetes, GCP reflect cloud, orchestration, and big data analytics importance.

4. Core Data & ML Libraries Are Still Key
Pandas, NumPy, Scikit-learn, and Jupyter are classic tools in the analyst/data science toolbox — and they fetch salaries in the $125K–150K range.

5. Language Skills
Swift, Scala, and Golang show up, suggesting cross-functional roles between engineering and analytics.

6. Business Intelligence
MicroStrategy, a BI platform, still commands good pay — showing that dashboarding/reporting experience isn’t outdated.
*/