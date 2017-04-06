Exercise 2 for pbarranger

How to run this application

Assumptions: It is assumed that you have python and postgres installed. Additionally you need to have Twitter credentials. 

1. Start a EC2 instance using the following AMI:

AMI Name: UCB MIDS W205 EX2-FULL
AMI ID: ami-d4dd4ec3

2. Clone this repository: git clone https://github.com/pbarranger/W205-S3.git

3. Navigate to extweetwordcount in Exercise 2: cd W205-S3/exercise_2/extweetwordcount

4. Start Postgres

5. Install psycopg:  pip install psycopg2==2.6.2

6. Install tweepy: pip install tweepy

NOTE: It is assumed that you have the correct database created in Postgres. If this is your first time running and do not have the database setup, run:

psql -U postgres
create database tcount;
\c tcount
create table tweetwordcount(word TEXT PRIMARY KEY NOT NULL,count INT NOT NULL);
 \q

7. Enter Twitter Credentials in tweets.py: nano W205-S3/exercise_2/extweetwordcount/src/spouts/tweets.py

8. Navigate back to the extweetwordcount file

9. Run the Application: sparse run
**Use ctrl+c to stop the Application

You can now query your resulting data.

Optional: 
Run finalresults.py to get the count of a word in dataset: python finalresults.py <word>
Run histogram.py to see all the words with counts between range k1 & k2 (inclusive): python histogram.py <k1>,<k2>
