Select hospital_type From hospital Group by hospital_type;

SELECT 
a.hospital, 
a.quality_score 
FROM hospital_avg_score a 
JOIN hospital b ON (a.id=b.provider_id) 
WHERE emergency_services = 'Yes' AND hospital_type = 'Acute Care Hospitals' 
GROUP BY 
a.hospital, 
a.quality_score 
ORDER BY quality_score DESC 
LIMIT 10;

