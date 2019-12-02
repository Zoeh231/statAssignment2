####################################
####################################
#Statistical Programming Assignment#
####################################
####################################


####################################
###installing relevant packages#####
####################################

install.packages("tidyverse")
library(tibble)
#using to read the datasets#
library(readr)
#using for joining datasets#
library(dplyr)

###################################
######Importing data files#########
###################################

#loading csv datasets into script#
advertiser <- read_csv("advertiser.csv")
campaigns <- read_csv("campaigns.csv")

#loading tsv files into script#
clicks <-read_tsv("clicks.tsv")
impressions <- read_tsv("impressions.tsv")

###################################
######Transforming the data########
###################################

#creating a function to change all of the timezones in 'clicks' to UTC timezone.#
convert_timezone <- function(data){  #using seconds as time values, ie. 8 hours = 28800 seconds#
  if(timezone == 'Pacific time')
  {
    if(time >= 68400 )
    {
      date = date + 1
    }
    time == time + 28800
    timezone == 'UTC'
  }
  elif(timezone =='Eastern time')
  {
    if(time >= 68400)
    {
      date = date + 1
    }
    time == time + 18000
    timezone == 'UTC'
  }
  else
  {
    timezone =='UTC'
  }
}
#Calling funtion on datasets to change timezones and creating new datasets#
converted_clicks <- convert_timezone(clicks)
converted_impressions <- convert_timezone(impressions)

#################################
###########Joining data##########
#################################

#Joining impressions and advertiser datasets into one dataset#
#containing errors due to no common variable names?#
impressions_processed <- left_join(advertiser, converted_impressions, by = "name")
#Joining clicks and campaigns datasets into one dataset#
#containing errors due to no common variable names?#
clicks_processed <- right_join(campaigns, converted_clicks, by = "id")

#################################
############Output###############
#################################

#Creating a new impressions csv file.#
write.csv(impressions_processed.csv)
#Creating a new clicks csv file.#
write.csv(clicks_processed.csv)
