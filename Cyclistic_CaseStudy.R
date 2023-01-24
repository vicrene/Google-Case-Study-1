options(warn=-1)

library(tidyverse)
library(dplyr)
library(lubridate)
#I imported the dataset using the local "import dataset" within R Studio Desktop


#change station start and end IDs to integers to ensure that 
#all data is consistent 
BikeData <- mutate(BikeData, start_station_id = 
                     as.integer(start_station_id))

BikeData <- mutate(BikeData, end_station_id =
                     as.integer(end_station_id))

#format into individual columns and add a day of the week column
BikeData$date <- as.Date(BikeData$started_at)
BikeData$month <- format(as.Date(BikeData$date), "%b")
BikeData$day <- format(as.Date(BikeData$date), "%d")
BikeData$year <- format(as.Date(BikeData$date), "%Y")
BikeData$day_of_week <- format(as.Date(BikeData$date), "%A")

#remove all NA's and duplicate cells
BikeData <- drop_na(BikeData)
BikeData_no_dupes <-BikeData[!duplicated(BikeData$ride_id), ]

BikeData_v2 <- BikeData_no_dupes
##ride_length column with "cleaner" data to work with
BikeData_v2$ride_length <- difftime(BikeData_v2$ended_at, 
                                    BikeData_no_dupes$started_at)

#removing trips with a ride length less than 0
nrow(BikeData_v2[BikeData_v2$ride_length <0,])
BikeData_v3 <- BikeData_v2[!BikeData_v2$ride_length <0,]
glimpse(BikeData_v3)

#calculating number of casual riders vs members
rider_type <- table(BikeData_v3$member_casual)
View(rider_type)

#tracing back steps to correct format errors
#the following code is to make sure that the data can later 
#be used for visualization
is.factor(BikeData_v3$ride_length)
BikeData_v3$ride_length <- as.numeric(as.character(BikeData_v3$ride_length))
is.numeric(BikeData_v3$ride_length)

#further cleaning "bad" data

BikeData_v3 <- BikeData_v3[!BikeData_v3$start_station_name == "HQ QR" | 
                             BikeData_v3$ride_length<0,]

#conducting stat analysis

trip_stats <- BikeData_v3 %>% 
  group_by(member_casual) %>% 
  summarise(average_ride_length = mean(ride_length), standard_dev = 
              sd(ride_length), median_ride_length = median(ride_length), 
            min_ride_length = min(ride_length), 
            max_ride_length = max(ride_length))
#stat analysis
mean(BikeData_v3$ride_length)
median(BikeData_v3$ride_length)
max(BikeData_v3$ride_length)
min(BikeData_v3$ride_length)
summary(BikeData_v3$ride_length)

aggregate(BikeData_v3$ride_length ~ BikeData_v3$member_casual, FUN = mean)
aggregate(BikeData_v3$ride_length ~ BikeData_v3$member_casual, FUN = median)
aggregate(BikeData_v3$ride_length ~ BikeData_v3$member_casual, FUN = max)
aggregate(BikeData_v3$ride_length ~ BikeData_v3$member_casual, FUN = min)


#fixing days of the week
BikeData_v3$day_of_week <- ordered(BikeData_v3$day_of_week, levels=
                                     c("Sunday", "Monday", "Tuesday", 
                                       "Wednesday", "Thursday", "Friday", 
                                       "Saturday"))

#averaging ride time by each day for members and casual users

aggregate(BikeData_v3$ride_length ~ BikeData_v3$member_casual
          + BikeData_v3$day_of_week, FUN=mean)

#analyzing ridership by type and weekday 
#(below code was gathered with the help of previous data campers and 
#Stackoverflow)
BikeData_v3 %>% 
    mutate(weekday = wday(started_at, label = TRUE)) %>% #creates weekday field
    group_by(member_casual, weekday) %>% #groups by usertype
    summarise(number_of_rides = n() #calculates num of rides and duration
              ,average_duration = mean(ride_length)) %>% 
  arrange(member_casual, weekday) #sorts


#removing outliers for ride_length
Q1 <- quantile(BikeData_v3$ride_length, .25)
Q3 <- quantile(BikeData_v3$ride_length, .75)
IQR <- IQR(BikeData_v3$ride_length)

#only keep rows in DF that have values within 1.5 * IQR of Q1 and Q3
BikeData_v4 <- subset(BikeData_v3, BikeData_v3$ride_length> (Q1 - 1.5*IQR) & 
                        BikeData_v3$ride_length< (Q3 + 1.5*IQR))
dim(BikeData_v4)


# visualize the number of rides by rider type
BikeData_v4 %>% 
  mutate(weekday = wday(started_at, label = TRUE)) %>% 
  group_by(member_casual, weekday) %>% 
  summarise(number_of_rides = n()
            ,average_duration = mean(ride_length)) %>% 
  arrange(member_casual, weekday)  %>% 
  ggplot(aes(x = weekday, y = number_of_rides, fill = member_casual)) +
  geom_col(position = "dodge")


#create a visualization for average duration
BikeData_v4 %>% 
  mutate(weekday = wday(started_at, label = TRUE)) %>% 
  group_by(member_casual, weekday) %>% 
  summarise(number_of_rides = n()
            ,average_duration = mean(ride_length)) %>% 
  arrange(member_casual, weekday)  %>% 
  ggplot(aes(x = weekday, y = average_duration, fill = member_casual)) +
  geom_col(position = "dodge")


Cyclistic <- aggregate(BikeData_v4$ride_length ~ BikeData_v4$member_casual + 
                         BikeData_v4$day_of_week, FUN = mean)




#downloading independent table as well as full dataset as CSV files
write.csv(Cyclistic, "Cyclistic.csv")

write.csv(BikeData_v4, "BikeData_v4")