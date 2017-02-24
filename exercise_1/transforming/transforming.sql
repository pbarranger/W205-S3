DROP TABLE hospital_avg_score;

CREATE TABLE hospital_avg_score AS 
SELECT Provider_Number as id, 
Hospital_Name as hospital,
State as state, 
CAST(Unweighted_Normalized_Clinical_Process_of_CarevDomain_Score as FLOAT) as care_score, 
CAST(unweighted_patient_experience_of_care_domain_score AS FLOAT) as patient_score, 
CAST(
Total_Performance_Score  AS FLOAT) as quality_score   
FROM hvbp_tps;

DROP TABLE measure_scores; 
CREATE TABLE measure_score AS 
SELECT provider_id as id, 
hospital_name AS hospital, 
state, 
measure_id, 
measure_name, 
CAST(score AS FLOAT) AS score 
FROM effective_care;


DROP TABLE death; 
CREATE TABLE death AS 
SELECT provider_id as id, 
hospital_name as hospital, 
measure_id, 
measure_name, 
compared_to_national as comp, 
CAST(score as FLOAT) as score, 
lower_estimate, 
higher_estimate, 
measure_start_date as measure_start 
FROM readmission;

