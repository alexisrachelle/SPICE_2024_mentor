#Moannas: coral bleaching correlation w reef/pelagic fish population in Florida & affect on food chain

################################################################################################################
#RedSnapper 
#Data
RedSnapper <- read.csv("SPICE_MarineFisheries_Reef - RedSnapper.csv")

###Plot a Bar graph for Year and Total Catch
##https://stackoverflow.com/questions/60805759/how-to-move-y-axis-labels-away-from-r-plot-using-lapply-in-r
##https://www.statology.org/ggplot-axis-label-position/

par(mgp = c(3.3, 1, 0))
RSplot <- barplot(RedSnapper$TotalCatch,
                  names.arg = RedSnapper$Year,
                  main = "Comparison",
                  xlab = "Year",
                  ylab = "Red Snapper Total Catch",
                  ylim = c(0, 10000000),
                  col = "skyblue",  # Change color of bars if desired
                  border = "black",  # Add black borders around bars for clarity
                  las = 2  # Rotate x-axis labels vertically for better readability
)

################################################################################################################
Global_Bleaching <- read.csv("Global_Coral_Bleaching_Florida.csv")

###Cleaning Up the Data
#Combining columns to have one column that shows MDY (no individual columns)
library(tidyverse)
Global_Bleaching <- Global_Bleaching %>%
  unite("SampleDate", Date_Day, Date_Month, Date_Year, sep = "-")

#Recognizing 'SampleDate' within the function dmy()
Global_Bleaching$SampleDate <- dmy(Global_Bleaching$SampleDate)
class(Global_Bleaching$SampleDate)

#Scatterplot for Date vs Percent Bleaching
Bleachplot <- plot(Global_Bleaching$SampleDate, Global_Bleaching$Percent_Bleaching,
                   main = "Scatter Plot of Bleaching Percentage over Time",
                   xlab = "Sample Date",
                   ylab = "Bleaching Percentage (%)",
                   pch = 16,  # Change shape of points
                   col = "skyblue"  # Change color of points
)

#Checking class of Percent_Bleaching column 
class(Global_Bleaching$Percent_Bleaching) #class: character

#Changing class of Percent_Bleaching column to numeric!
Global_Bleaching <- Global_Bleaching %>%
  mutate(Percent_Bleaching = as.numeric(Percent_Bleaching))

class(Global_Bleaching$Percent_Bleaching) #check, class is now numeric

#Data Vis
ggplot(Global_Bleaching, aes(x=SampleDate, y=Percent_Bleaching)) +
  geom_point()+
  labs(title="Percent Bleaching vs Time",
       x="Sample Date", y = "Percent Bleaching (%)")+
  theme_classic()

justPctBleaching <- select(Global_Bleaching, Percent_Bleaching)
pctBleachingNAs <- filter(justPctBleaching, is.na(Percent_Bleaching)) #34 NA rows
