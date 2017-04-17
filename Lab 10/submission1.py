from pyspark import SparkContext
from pyspark.streaming import StreamingContext

ssc = StreamingContext(sc, 1)

lines= ssc.textFileStream("file:///tmp/datastreams")
word_count_lines = lines.filter(lambda word: True if len(word) > 5  else False)
word_count_linesclines.pprint()

ssc.start()
