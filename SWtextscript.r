# Staaaar Waaaaarss
library(rvest)
library(stringr)
library(calibrate)
library(stringi)
library(tidytext)
library(tidyverse)

url <- ("http://imsdb.com/scripts/Star-Wars-A-New-Hope.html")

newhope <- url %>% read_html() %>% 
  html_nodes(xpath = '//pre') %>%
  .[[1]] %>% 
  html_text()

str(newhope)

newhope <- data.frame(newhope)

# .scrtext > pre:nth-child(1)
# //pre

newhopeTidy <- newhope %>% 
  str_replace_all("\n", "") %>% 
  str_replace_all("[^a-zA-Z\\s]", " ") %>% 
  str_replace_all("[\\s]+", " ") %>% 
  tolower() %>% 
  trimws("both")

str(newhopeTidy)
ls(newhopeTidy)
names(newhopeTidy)


newhopedf <- data.frame(script = newhopeTidy, stringsAsFactors = FALSE)   # STRINGASFACTORS = FALSE!!!!!

newhopeTokenized <- newhopedf %>% unnest_tokens(word, script)

str(newhopeTokenized)




.scrtext > pre:nth-child(1)