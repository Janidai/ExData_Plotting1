setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

# Read the data
data <- read.table("./data/tidy_data.txt",
                        header = TRUE,
                        sep=";",
                        na.strings = "?")
data$date <- strptime(data$date, format = "%Y-%m-%d %H:%M:%S")

# Plot Global Active Power frequency
hist(data$global_active_power,
     col = "red", 
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

# Copy the plot to a png file
dev.copy(png, "./plot1.png")
dev.off()