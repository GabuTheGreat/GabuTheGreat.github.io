library(twitteR)

consumerKey  = "QffMSiv8lBcSijEd3KcS3AaA7"
consumerSecret  =  "eEn1rhFJRbX3fzhJcTyrblCtuglFzUUqBkeKwG6KRMe2sM6jqR"
accessToken =  "4766523441-9fK3r9Nib3QEfc7ZPABfvVfPUI8ghlBz8hAOiP4"
accessTokenSecret = "nnU5lNwZwttEhsWcp2npIIYjD5apPjyQozxDBSzDCNRQu"
options(httr_oauth_cache=T)
setup_twitter_oauth(consumerKey, consumerSecret, accessToken, accessTokenSecret)


#get my account @mutua_ndunda\
tuser <- getUser('mutua_ndunda')
my_tweets <- userTimeline('mutua_ndunda', n=500)
my_tweets <- twListToDF(my_tweets)
