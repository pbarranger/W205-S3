from __future__ import absolute_import, print_function, unicode_literals

from collections import Counter
from streamparse.bolt import Bolt

import psycopg2

class WordCounter(Bolt):

    def initialize(self, conf, ctx):
        self.counts = Counter()


    def process(self, tup):
        word = tup.values[0]
	
	#cleaning to avoid errors
	word = ''.join(i for i in word if i.isalnum())
        
	# Database name: tcount 
        # Table name: tweetwordcount 

        self.counts[word] += 1
	connector = psycopg2.connect(database="tcount", user="postgres", password="pass", host="localhost", port="5432")
	cur = connector.cursor()
        cur.execute("SELECT word,count FROM tweetwordcount WHERE word=%s", [word])
        record = cur.fetchone()
        
	if record is None: 
            cur.execute("INSERT INTO tweetwordcount  (word,count) VALUES (%s,%s)", (word, 1))
            connector.commit()
        else:
            cur.execute("UPDATE tweetwordcount SET count=%s WHERE word=%s;", (self.counts[word], word))
            connector.commit()

	self.emit([word, self.counts[word]])

	
        # Log the count - just to see the topology running
        self.log('%s: %d' % (word, self.counts[word]))
