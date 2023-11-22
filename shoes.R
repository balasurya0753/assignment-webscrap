library(rvest)
library(dplyr)
library(robotstxt)
library(stringr)

link<-"https://www.amazon.in/s?k=shoes+for+men&rh=n%3A1983518031%2Cp_n_feature_nineteen_browse-bin%3A11301363031&dc&ds=v1%3ATMymCPgO%2Ft5seJWcOintD9xXYrpD1jlL4UPyxHwtlNo&crid=1HPYC1DUT9SYD&qid=1700645917&rnid=11301362031&sprefix=shoes%2Caps%2C301&ref=sr_nr_p_n_feature_nineteen_browse-bin_1"
path=paths_allowed(link)
web<-read_html(link)
ShoeName<-web%>%html_nodes(".s-line-clamp-1 .a-color-base")%>%html_text()
View(ShoeName)

ratings<-web%>%html_nodes(".aok-align-bottom")%>%html_text()
View(ratings)

prices<-web%>%html_nodes(".a-price-whole")%>%html_text()
View(prices)


shoeDetails<-data.frame(ShoeName,ratings,prices)
View(shoeDetails)

write.csv(shoeDetails,"shoe.csv")
