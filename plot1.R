#---Assignment: Course Project 1---#

## 1). plot1.R

# To change your working directory, use setwd and specify the path to the desired folder.
# setwd(dir), dir – Specify a working directory.


setwd("/home/draconis/Documentos/COURSERA/DATA SCIENCE/4. Exploratory Data Analysis/WEEK_1/Course Project 1")

## Load and clean the table:

electric_power <- data.table::fread(input = "household_power_consumption.txt", 
                                    na.strings="?")

#Prevents the histogram from being printed in scientific notation:
electric_power[, Global_active_power := lapply(.SD, as.numeric), 
               .SDcols = c("Global_active_power")]

#Format date to Type Date:
electric_power[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]

#Filter data set from Feb. 1, 2007 to Feb. 2, 2007
electric_power <- electric_power[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

#Create the histogram plot.1:
hist(electric_power$Global_active_power, main="Global Active Power", 
     xlab = "Global Active Power (kilowatts)", col="red")

#Save file and close device:
dev.copy(png,"plot1.png", width=480, height=480)
dev.off()