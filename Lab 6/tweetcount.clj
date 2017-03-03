(ns tweetcount
  (:use     [streamparse.specs])
  (:gen-class))

(defn tweetcount [options]
   [
    ;; spout configuration
    {"sentences-spout" (python-spout-spec
          options
          "spouts.sentences.Sentences"
          ["sentence"]
          )
    }
    ;; Bolts
    {
     	;; bolt configuration 1
        "parse-bolt" (python-bolt-spec
          options
          {"sentences-spout" :shuffle}
          "bolts.parse.ParseTweet"
          ["valid_words"]
          :p 1
          )
	;; bolt configuration 2
        "count-bolt" (python-bolt-spec
          options
          {"parse-bolt" :shuffle}
          "bolts.tweetcounter.TweetCounter"
          ["word", "count"]
          :p 2

          )
    }
  ]
)
