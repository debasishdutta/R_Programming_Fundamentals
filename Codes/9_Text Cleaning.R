require(tm)
Documents <- "Large number of people including celebrities
are joining the clean India movement, celebrities are seen with brooms
in their hands and cleaning places around them @ 123 https://www.gmail.com"

docs <- Corpus(VectorSource(Documents))
inspect(docs[1])
writeLines(as.character(docs[[1]]))

docs <- tm_map(docs, stripWhitespace)
writeLines(as.character(docs[[1]]))

docs <- tm_map(docs, content_transformer(tolower))
writeLines(as.character(docs[[1]]))

docs<-tm_map(docs, removeNumbers)
writeLines(as.character(docs[[1]]))

docs<-tm_map(docs, removePunctuation)
writeLines(as.character(docs[[1]]))


# code using gsub
toSpace<-content_transformer(function(x,pattern) gsub(pattern, " ", x))
docs<-tm_map(docs, toSpace, "^http\\+")
docs<-tm_map(docs, toSpace, "^http")
docs<-tm_map(docs, toSpace, "/")
docs<-tm_map(docs, toSpace, "@")
docs<-tm_map(docs, toSpace, "\\|")
docs<-tm_map(docs, toSpace, "RT")
docs<-tm_map(docs, toSpace, "[[:punct:]]")
docs<-tm_map(docs, toSpace, "^ ")
docs<-tm_map(docs, toSpace, " $")
docs<-tm_map(docs, toSpace, ":")
docs<-tm_map(docs, toSpace, "http")
docs<-tm_map(docs, toSpace, "rt$")
docs<-tm_map(docs, toSpace, "^on")
docs<-tm_map(docs, toSpace, "on$")
docs<-tm_map(docs, toSpace, "#")


mc_tokens <- MC_tokenizer(docs[[1]])
mc_tokens
scan_tokens <- scan_tokenizer(docs[[1]])
scan_tokens

#Ngram
library(ngram)
ngram_asweka(as.character(docs[[1]]), min = 2, max = 2)

#stemming
require(SnowballC)
stemDocument("obamacare")
stemDocument("cmos")
stemDocument("cmos", language = "porter")

