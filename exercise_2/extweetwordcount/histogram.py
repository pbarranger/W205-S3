import sys
import psycopg2

connector = psycopg2.connect(database="tcount", user="postgres", password="pass", host="localhost", port="5432")
cur = connector.cursor()

argument = str(sys.argv[1])
# Min number
k1 = int(argument.split(',')[0])
# Max number
k2 = int(argument.split(',')[1])

# Count between k1 and k2
cur.execute("SELECT word,count FROM tweetwordcount WHERE count>=%s AND count<=%s ORDER BY count DESC", (k1, k2))
records = cur.fetchall()
for rec in records:
            print("%s: %s" % (rec[0], rec[1]))
connector.commit()

connector.close()
