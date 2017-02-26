SELECT 
a.state, 
MAX(a.quality_score) AS highest_quality_score, 
AVG(a.quality_score) AS average_quality_score, 
MAX(a.quality_score) - MIN(a.quality_score) AS range_of_quality
FROM hospital_avg_score a 
JOIN hospital_lookup b ON (a.id=b.provider_id) 
WHERE emergency_services = 'Yes' AND hospital_type = 'Acute Care Hospitals'  
GROUP BY a.state ORDER BY highest_quality_score DESC
LIMIT 10;
