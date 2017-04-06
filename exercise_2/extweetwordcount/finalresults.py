import sys
import psycopg2

connector = psycopg2.connect(database="tcount", user="postgres", password="pass", host="localhost", port="5432")
cur = connector.cursor()

if (len(sys.argv)) > 1:
    word = sys.argv[1]
    cur.execute("SELECT word,count FROM tweetwordcount WHERE word=%s", [word])
    records = cur.fetchall()
    for i in records:
        print("Total number of occurences of \"%s\" : %s  " % (i[0], i[1]))
    connector.commit()
else:  
    cur.execute("SELECT word, count FROM tweetwordcount ORDER BY word")
    records = cur.fetchall()
    for i in records:
        print("<%s> %s" % (i[0], i[1]))
    connector.commit()

connector.close()
