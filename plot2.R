setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

Sys.setlocale("LC_TIME", 'en_US.UTF-8')

# Read the data
data <- read.table("./data/tidy_data.txt",
                   header = TRUE,
                   sep=";",
                   na.strings = "?")
data$date <- strptime(data$date, format = "%Y-%m-%d %H:%M:%S")


# Plot lines Global Active Power vs Time
plot(data$date,data$global_active_power,
     xlab = " ",
     ylab = "Global Active Power (kilowatts)",
     type="n")
lines(data$date,data$global_active_power)

# Copy the plot to a png file
dev.copy(png,"./plot2.png")
dev.off()
