--can i comment?
DROP TABLE hospital;
CREATE EXTERNAL TABLE hospital (
Provider_ID INT,
Hospital_Name STRING,
Address STRING,
City STRING,
State STRING,
ZIP_Code INT,
County_Name STRING,
Phone_Number STRING,
Hospital_Type STRING,
Hospital_Ownership STRING,
Emergency_Services STRING
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
 "separatorChar" = ",",
 "quoteChar" = '"',
 "escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/hospital';



DROP TABLE surveys;
CREATE EXTERNAL TABLE surveys (
Provider_Number INT,
Hospital_Name STRING,
Address STRING,
City STRING,
State STRING,
ZIP_Code INT,
County_Name STRING,
Communication_with_Nurses_Achievement_Points STRING,
Communication_with_Nurses_Improvement_Points STRING,
Communication_with_Nurses_Dimension_Score STRING,
Communication_with_Doctors_Achievement_Points STRING,
Communication_with_Doctors_Improvement_Points STRING,
Communication_with_Doctors_Dimension_Score STRING,
Responsiveness_of_Hospital_Staff_Achievement_Points STRING,
Responsiveness_of_Hospital_Staff_Improvement_Points STRING,
Responsiveness_of_Hospital_Staff_Dimension_Score STRING,
Pain_Management_Achievement_Points STRING,
Pain_Management_Improvement_Points STRING,
Pain_Management_Dimension_Score STRING,
Communication_about_Medicines_Achievement_Points STRING,
Communication_about_Medicines_Improvement_Points STRING,
Communication_about_Medicines_Dimension_Score STRING,
Cleanliness_and_Quietness_of_Hospital_Environment_Achievement_Points STRING,
Cleanliness_and_Quietness_of_Hospital_Environment_Improvement_Points STRING,
Cleanliness_and_Quietness_of_Hospital_Environment_Dimension_Score STRING,
Discharge_Information_Achievement_Points STRING,
Discharge_Information_Improvement_Points STRING,
Discharge_Information_Dimension_Score STRING,
Overall_Rating_of_Hospital_Achievement_Points STRING,
Overall_Rating_of_Hospital_Improvement_Points STRING,
Overall_Rating_of_Hospital_Dimension_Score STRING,
HCAHPS_Base_Score INT,
HCAHPS_Consistency_Score INT
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
 "separatorChar" = ",",
 "quoteChar" = '"',
 "escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/survey_responses';

DROP TABLE effective_care;
CREATE EXTERNAL TABLE effective_care (
Provider_ID INT,
Hospital_Name STRING,
Address  STRING,
City  STRING,
State  STRING,
ZIP_Code INT,
County_Name  STRING,
Phone_Number  STRING,
Condition  STRING,
Measure_ID STRING,
Measure_Name  STRING,
Score INT,
Sample INT,
Footnote  STRING,
Measure_Start_Date STRING,
Measure_End_Date STRING
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
 "separatorChar" = ",",
 "quoteChar" = '"',
 "escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/effective_care';

DROP TABLE measures;
CREATE EXTERNAL TABLE measures (
Measure_Name STRING,
Measure_ID STRING,
Measure_Start_Quarter STRING,
Measure_Start_Date STRING,
Measure_End_Quarter STRING,
Measure_End_Date STRING
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
 "separatorChar" = ",",
 "quoteChar" = '"',
 "escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/measures';

DROP TABLE readmission;
CREATE EXTERNAL TABLE readmission (
Provider_ID INT,
Hospital_Name STRING,
Address STRING,
City STRING,
State STRING,
ZIP_Code INT,
County_Name STRING,
Phone_Number STRING,
Measure_Name STRING,
Measure_ID STRING,
Compared_to_National STRING,
Denominator INT,
Score INT,
Lower_Estimate FLOAT,
Higher_Estimate FLOAT,
Footnote STRING,
Measure_Start_Date STRING,
Measure_End_Date STRING
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
 "separatorChar" = ",",
 "quoteChar" = '"',
 "escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/readmission';


DROP TABLE hvbp_tps;
CREATE EXTERNAL TABLE hvbp_tps(
Provider_Number INT,
Hospital_Name STRING,
Address STRING,
City STRING,
State STRING,
Zip_Code INT,
County_Name STRING,
Unweighted_Normalized_Clinical_Process_of_CarevDomain_Score FLOAT,
Weighted_Clinical_Process_of_Care_Domain_Score FLOAT,
Unweighted_Patient_Experience_of_Care_Domain_Score FLOAT,
Weighted_Patient_Experience_of_Care_Domain_Score FLOAT,
Unweighted_Normalized_Outcome_Domain_Score FLOAT,
Weighted_Outcome_Domain_Score FLOAT,
Unweighted_Normalized_Efficiency_Domain_Score FLOAT,
Weighted_Efficiency_Domain_Score FLOAT,
Total_Performance_Score FLOAT
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
 "separatorChar" = ",",
 "quoteChar" = '"',
 "escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/hvbp_tps';







