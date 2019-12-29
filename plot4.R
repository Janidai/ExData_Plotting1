setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
Sys.setlocale("LC_TIME", 'en_US.UTF-8')

# Read the data
data <- read.table("./data/tidy_data.txt",
                   header = TRUE,
                   sep=";",
                   na.strings = "?")
data$date <- strptime(data$date, format = "%Y-%m-%d %H:%M:%S")

# Plot several graphs
png('plot4.png')
par(mfrow = c(2,2), cex = 0.7)
within(data, {
    # First graph: Global Active Power
    plot(date,global_active_power, 
         xlab = " ",
         ylab = "Global Active Power",
         type="n")
    lines(date,global_active_power)    
    # Second graph: Voltage
    plot(date,voltage,
         xlab = "datetime",
         ylab = "Voltage",
         type="n")
    lines(date,voltage)
    # Third Graph: Sub Metering
    plot(date,sub_metering_1,
         xlab = " ",
         ylab = "Energy sub metering",
         type="n")
    lines(date,sub_metering_1)
    lines(date,sub_metering_2, col = "red")
    lines(date,sub_metering_3, col = "blue")
    legend("topright", 
           bty = "n",
           lty = c(1,1,1), 
           col = c("black","red","blue"), 
           legend = c("sub_metering_1","sub_metering_2","sub_metering_3"))
    # Fourth graph: Global Reactive Power
    plot(date,global_reactive_power,
         xlab = "datetime",
         ylab = "Global_reactive_power",
         type="n")
    lines(date,global_reactive_power)    
})

# Copy the plot to a png file
dev.off()
