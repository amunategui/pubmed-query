#install.packages("RISmed")
library(RISmed)

search_topic <- 'copd'
search_query <- EUtilsSummary(search_topic, retmax=100, mindate=2012,maxdate=2012)
summary(search_query)

# see the ids of our returned query
QueryId(search_query)

# get actual data from PubMed
records<- EUtilsGet(search_query)
class(records)

# store it
pubmed_data <- data.frame('Title'=ArticleTitle(records),'Abstract'=AbstractText(records))
head(pubmed_data,1)

pubmed_data$Abstract <- as.character(pubmed_data$Abstract)
pubmed_data$Abstract <- gsub(",", " ", pubmed_data$Abstract, fixed = TRUE)

# see what we have
str(pubmed_data)