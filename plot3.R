setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
Sys.setlocale("LC_TIME", 'en_US.UTF-8')

# Read the data
data <- read.table("./data/tidy_data.txt",
                   header = TRUE,
                   sep=";",
                   na.strings = "?")
data$date <- strptime(data$date, format = "%Y-%m-%d %H:%M:%S")

# Plot Submetering lines vs Time
png('plot3.png')
plot(data$date,data$sub_metering_1, 
     xlab = " ",
     ylab = "Energy sub metering",
     type="n")

lines(data$date,data$sub_metering_1)
lines(data$date,data$sub_metering_2, col = "red")
lines(data$date,data$sub_metering_3, col = "blue")

legend("topright",
       lty = c(1,1,1), 
       col = c("black","red","blue"), 
       legend = c("sub_metering_1","sub_metering_2","sub_metering_3"))

# Copy the plot to a png file
dev.off()
