
import sys
import psycopg2

# Connect to twitter word count database
conn = psycopg2.connect(database="tcount", user="postgres", password="pass", host="localhost", port="5432")
cur = conn.cursor()

# Note syntax is "python histogram.py 3,5" not "python histogram.py 3 5"
argument = str(sys.argv[1])
# Minimum word count number
k1 = int(argument.split(',')[0])
# Maximum word count number
k2 = int(argument.split(',')[1])

# Query records with counts between k1 and k2
cur.execute("SELECT word,count FROM tweetwordcount WHERE count>=%s AND count<=%s ORDER BY count DESC", (k1, k2))
records = cur.fetchall()
for rec in records:
            print("<%s> %s" % (rec[0], rec[1]))
conn.commit()

conn.close()
