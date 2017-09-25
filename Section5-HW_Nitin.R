df <- read.csv("Section5-Homework-Data.csv")
head(df)
str(df)

mydf <- data.frame(Code=Country_Code,Expectancy_1960=Life_Expectancy_At_Birth_1960
                   ,Expectancy_2013=Life_Expectancy_At_Birth_2013)
head(mydf)
?split

#Splitting the data as per column Year so it will split it into 1960 and 2013
splittedDF <- split(df,df$Year)
head(splittedDF)

dat_1960 <- splittedDF$`1960`
dat_2013 <- splittedDF$`2013`

head(dat_1960)
head(dat_2013)

#combining data
full_data_1960 <- merge(dat_1960,mydf,by.x="Country.Code",by.y="Code")
head(full_data_1960)
full_data_1960$Expectancy_2013<-NULL
head(full_data_1960)
str(full_data_1960)

#full_data_1960 <- merge(dat_1960,mydf,by.x="Country.Code",by.y="Code")
full_data_2013 <- merge(dat_2013,mydf,by.x="Country.Code",by.y="Code")
head(full_data_2013)
full_data_2013$Expectancy_1960<-NULL
head(full_data_2013)
str(full_data_2013)

qplot(data = full_data_1960,x=Fertility.Rate,y=Expectancy_1960,size=I(3),shape=I(19),color=Region)

qplot(data = full_data_2013,x=Fertility.Rate,y=Expectancy_2013,size=I(3),shape=I(19),color=Region)
