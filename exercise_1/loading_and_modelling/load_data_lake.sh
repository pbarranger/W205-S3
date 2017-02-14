cd junk/ 
wget https://data.medicare.gov/views/bg9k-emty/files/Nqcy71p9Ss2RSBWDmP77H1DQXcyacr2khotGbDHHW_s?content_type=application%2Fzip%3B%20charset%3Dbinary&filename=Hospital_Revised_Flatfiles.zip
unzip Nqcy71p9Ss2RSBWDmP77H1DQXcyacr2khotGbDHHW_s\?content_type\=application%2Fzip\;\ charset\=binary 
cd ~
tail -n +2 /home/w205/junk/Hospital > /home/w205/local_machine_hospital                      
tail -n +2 /home/w205/junk/Hospital\ General\ Information.csv > /home/w205/local_machine_hospital/hospitals.csv
tail -n +2 /home/w205/junk/Timely\ and\ Effective\ Care\ -\ Hospital.csv  > /home/w205/local_machine_hospital/effective_care.csv
tail -n +2 /home/w205/junk/Readmissions\ and\ Deaths\ -\ Hospital.csv  > /home/w205/local_machine_hospital/readmissions.csv  
tail -n +2 /home/w205/junk/Measure\ Dates.csv  > /home/w205/local_machine_hospital/Measures.csv    
tail -n +2 /home/w205/junk/hvbp_hcahps_05_28_2015.csv  > /home/w205/local_machine_hospital/survey_responses.csv
mv local_machine_hospital hospital_compare
hdfs dfs -put /home/w205/hospital_compare/ /user/w205/                
hdfs dfs -ls hospital_compare
