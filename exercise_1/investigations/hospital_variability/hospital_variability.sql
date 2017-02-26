SELECT 
a.measure_id, 
a.measure_name, 
MAX(a.score), 
MIN(a.score), 
MAX(a.score) - MIN(a.score) AS range_of_score 
FROM readmission_stats a  
JOIN hospital_lookup b ON (a.id=b.provider_id) 
WHERE 
emergency_services = 'Yes' 
AND hospital_type = 'Acute Care Hospitals' 
AND a.measure_start = '07/01/2011' 
GROUP BY 
a.measure_id, 
measure_name 
ORDER BY range_of_score DESC
LIMIT 10;

