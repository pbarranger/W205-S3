import tweepy

consumer_key = "MHhET7suSQliaCJQngaYM9Cyi";
#eg: consumer_key = "YisfFjiodKtojtUvW4MSEcPm";


consumer_secret = "3yjQS84epQHJXrlaffDGhe9FmikSxWrPtGVfzjd2icrMXZkuPf";
#eg: consumer_secret = "YisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPm";

access_token = "74556444-IrO8m6PcTdgFNUGBBXHXmGbfPdRAVobUsRoynFEFa";
#eg: access_token = "YisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPm";

access_token_secret = "L15gUthyYQTCGIv02m7W9wtpz1foasMZJQEi29fH6G1hY";
#eg: access_token_secret = "YisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPm";


auth = tweepy.OAuthHandler(consumer_key, consumer_secret)
auth.set_access_token(access_token, access_token_secret)

api = tweepy.API(auth)



