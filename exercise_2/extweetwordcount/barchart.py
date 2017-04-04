import matplotlib.pyplot as plt
import psycopg2
import numpy as np

# Get top 20 words and their count
conn = psycopg2.connect(database="tcount", user="postgres", password="pass", host="localhost", port="5432")
cur = conn.cursor()
cur.execute("SELECT word,count FROM tweetwordcount ORDER BY count DESC LIMIT 20;")
records = cur.fetchall()
words = []
counts = []
for rec in records:
    words.append(rec[0])
    counts.append(int(rec[1]))
conn.commit()
conn.close()

# Plot bar chart
wordIndex = np.arange(len(words))
barWidth = 0.5
plt.bar(wordIndex, counts, barWidth, color='b')
plt.title("Top 20 Words")
plt.xlabel("Word")
plt.xticks(wordIndex + barWidth, words,rotation=90)
plt.ylabel("Count")
plt.savefig('top20.png')
