from pyspark import SparkContext
from pyspark.streaming import StreamingContext
import json

ssc = StreamingContext(sc, 10)
lines = ssc.textFileStream("file:///tmp/datastreams")

def venues(i):
    a = open('myfile', 'a')
    print >>a, i
    a.close()
    return i

slines = lines.flatMap(lambda x: [ j['venue'] for j in json.loads('['+x+']') if 'venue' in j])
vlines = slines.map(lambda x: venues(x))

slines.pprint()
vlines.pprint()

ssc.start()
