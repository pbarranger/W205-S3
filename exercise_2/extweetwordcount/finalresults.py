import sys
import psycopg2

# Connect to twitter word count database
conn = psycopg2.connect(database="tcount", user="postgres", password="pass", host="localhost", port="5432")
cur = conn.cursor()

if (len(sys.argv)) > 1:  # With argument
    word = sys.argv[1]
    cur.execute("SELECT word,count FROM tweetwordcount WHERE word=%s", [word])
    records = cur.fetchall()
    for rec in records:
        print("Total number of occurences of %s : %s  " % (rec[0], rec[1]))
    conn.commit()
else:  # Without argument
    # Return all words sorted alphabetically in an ascending order
    cur.execute("SELECT word, count FROM tweetwordcount ORDER BY word")
    records = cur.fetchall()
    for rec in records:
        print("<%s> %s" % (rec[0], rec[1]))
    conn.commit()

conn.close()
