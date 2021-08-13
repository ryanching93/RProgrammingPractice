getwd()                                                                                     #check my path directory

movies <- read.csv("Section6-Homework-Data.csv",stringsAsFactors = T)                       #get data
head(movies)

colnames(movies) <- c("DayOfWeek","Director","Genre","MovieTitle","ReleaseDate","Studio",   #rename colnames
                      "AdjustedGrossMillions","BudgetMillions","GrossMillions",
                      "IMDBRating","MovieLensRating","OverseasRevMillion",
                      "OverseasRevPercent","Profit","ProfitPercentage",
                      "RuntimeMinute","USRev","USRevPercent")
                      
tail(movies)

str(movies)                                         #check data structure
summary(movies)

movies$DayOfWeek <- NULL                            #filter data 
movies$Director <- NULL                             #step 1: remove unnecessary columns
movies$ReleaseDate <- NULL
movies$IMDBRating <- NULL
movies$MovieLensRating <- NULL
movies$RuntimeMinute <- NULL

#filter method 1
filterGenre <- movies$Genre == "action" | movies$Genre == "adventure" | movies$Genre == "animation" | movies$Genre == "comedy" | movies$Genre == "drama"
filterStudio <- movies$Studio == "Buena Vista Studios" | movies$Studio == "Fox" | movies$Studio == "Paramount Pictures" | movies$Studio == "Sony" | movies$Studio == "Universal" | movies$Studio == "WB"
         
#filter method 2    
genre <- c("action","adventure","animation","comedy","drama")
studio <- c("Buena Vista Studios","Fox","Paramount Pictures","Sony","Universal","WB") #create referential vectors

filterGenre <- movies$Genre %in% genre
filterGenre 
filterStudio <- movies$Studio %in% studio
filterStudio

a <- ggplot(data=movies[filterGenre & filterStudio,],aes(x=Genre,y=USRevPercent))     #plotting our boxplot graph
b <- a + geom_jitter(aes(size=BudgetMillions, colour=Studio)) +
  geom_boxplot (size=1.2,alpha=0.7,outlier.colour=NULL)
b

c <- b + xlab("Genre") + ylab("Gross % US") +                                         #adding themes
  ggtitle("Domestic Gross % by Genre") +
  theme(axis.title.x = element_text(colour = "LightBlue",size=10),
        axis.title.y = element_text(colour = "LightBlue",size=10),
        axis.text.x = element_text(size=8),
        axis.text.y = element_text(size=8),
        
        legend.title = element_text(size=10),
        legend.text = element_text(size=8),
        
        plot.title = element_text(size=30,colour="Black"))

c$labels$size="Budget $M"                                                             #change legend label
c
