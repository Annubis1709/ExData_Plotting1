#---Assignment: Course Project 1---#

## 2). plot2.R

# To change your working directory, use setwd and specify the path to the desired folder.
# setwd(dir), dir – Specify a working directory.


setwd("/home/draconis/Documentos/COURSERA/DATA SCIENCE/4. Exploratory Data Analysis/WEEK_1/Course Project 1")

## Load and clean the table:

electric_power <- data.table::fread(input = "household_power_consumption.txt", 
                                    na.strings="?")

#Prevents the histogram from being printed in scientific notation:
electric_power[, Global_active_power := lapply(.SD, as.numeric), 
               .SDcols = c("Global_active_power")]

#Format dateTime Column
electric_power[, date_time := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

#Format date to Type Date:
electric_power[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]

#Filter data set from Feb. 1, 2007 to Feb. 2, 2007
electric_power <- electric_power[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

#Create plot.2:
plot(electric_power$Global_active_power~electric_power$date_time, type = "l", 
     ylab = "Global Active Power (kilowatts)", xlab = "")

#Save file and close device:
dev.copy(png,"plot2.png", width=480, height=480)
dev.off()