Drop Table h_grade; 

CREATE TABLE h_grade AS 
SELECT 
a.id,  
a.hospital, 
a.measure_id,
CASE WHEN  a.comp = 'Better than the National Rate' THEN 1 ELSE 0 END as better_than_score, 
CASE WHEN a.comp = 'Worse than the National Rate' THEN 1 ELSE 0 END AS worse_than_score 
FROM readmission_stats a
JOIN hospital_lookup b ON (a.id=b.provider_id) 
WHERE 
emergency_services = 'Yes' 
AND hospital_type = 'Acute Care Hospitals'
GROUP BY 
a.id,  
a.hospital,
a.measure_id,
a.comp;

DROP TABLE h_grade_group;

CREATE TABLE h_grade_group AS 
SELECT id,
sum(better_than_score) - sum(worse_than_score) as final_grade 
From h_grade 
GROUP BY 
id;

SELECT 
final_grade, 
count(id) 
FROM h_grade_group 
Group by final_grade 
ORDER BY final_grade;

SELECT a.final_grade, 
AVG(patient_score) 
FROM h_grade_group a 
JOIN hospital_avg_score b ON a.id=b.id 
WHERE a.final_grade >= -3 AND a.final_grade <= 4
GROUP BY a.final_grade 
ORDER BY a.final_grade;



