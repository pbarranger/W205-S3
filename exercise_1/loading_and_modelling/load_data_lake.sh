rm -R /home/w205/junk/ 
rm -R /home/w205/hospital_compare/hospitals/
rm -R /home/w205/hospital_compare/effective_care/
rm -R /home/w205/hospital_compare/readmissions/
rm -R /home/w205/hospital_compare/measures/
rm -R /home/w205/hospital_compare/survey_responses/
rm -R /home/w205/hospital_compare/hvbp_tps/
rm -R /home/w205/hospital_compare/

hdfs dfs -rm -R /user/w205/hospital_compare/

mkdir /home/w205/hospital_compare/hospitals
mkdir /home/w205/hospital_compare/effective_care
mkdir /home/w205/hospital_compare/readmissions
mkdir /home/w205/hospital_compare/measures
mkdir /home/w205/hospital_compare/survey_responses
mkdir /home/w205/hospital_compare/hvbp_tps
mkdir /home/w205/junk/ 

wget https://data.medicare.gov/views/bg9k-emty/files/Nqcy71p9Ss2RSBWDmP77H1DQXcyacr2khotGbDHHW_s?content_type=application%2Fzip%3B%20charset%3Dbinary&filename=Hospital_Revised_Flatfiles.zip
unzip Nqcy71p9Ss2RSBWDmP77H1DQXcyacr2khotGbDHHW_s\?content_type\=application%2Fzip\;\ charset\=binary 

tail -n +2 /home/w205/junk/Hospital\ General\ Information.csv > /home/w205/hospital_compare/hospitals/hospitals.csv
tail -n +2 /home/w205/junk/Timely\ and\ Effective\ Care\ -\ Hospital.csv  > /home/w205/hospital_compare/effective_care/effective_care.csv
tail -n +2 /home/w205/junk/Readmissions\ and\ Deaths\ -\ Hospital.csv  > /home/w205/hospital_compare/readmissions/readmissions.csv  
tail -n +2 /home/w205/junk/Measure\ Dates.csv  > /home/w205/hospital_compare/Measures/measures.csv    
tail -n +2 /home/w205/junk/hvbp_hcahps_05_28_2015.csv  > /home/w205/hospital_compare/survey_responses/survey_responses.csv
tail -n +2 /home/w205/junk/hvbp_tps_05_28_2015.csv  > /home/w205/hospital_compare/hvbp_tps/hvbp_tps.csv

hdfs dfs -put /home/w205/hospital_compare/ /user/w205/

hdfs dfs -ls hospital_compare
