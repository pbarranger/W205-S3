DROP TABLE hospital_lookup;

CREATE TABLE hospital_lookup AS
SELECT Provider_ID,
Hospital_Name,
State,
Phone_Number,
Hospital_Type,
Emergency_Services
FROM hospital;

DROP TABLE hospital_avg_score;

CREATE TABLE hospital_avg_score AS 
SELECT Provider_Number as id, 
Hospital_Name as hospital,
State as state, 
CAST(Unweighted_Normalized_Clinical_Process_of_Care_Domain_Score as FLOAT) as care_score, 
CAST(unweighted_patient_experience_of_care_domain_score AS FLOAT) as patient_score, 
CAST(Total_Performance_Score  AS FLOAT) as quality_score   
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


DROP TABLE readmission_stats; 

CREATE TABLE readmission_stats AS 
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

DROP TABLE survey_results;

CREATE TABLE survey_results AS
SELECT Provider_Number,
Hospital_Name,
State,
CAST(HCAHPS_Base_Score AS FLOAT) AS HCAHPS_BASE_SCORE,
CAST(HCAHPS_Consistency_Score AS FLOAT) AS HCAHPS_Consistency_Score
FROM surveys;

