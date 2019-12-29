setwd("~/Repos//ExData_Plotting1")
# The goal of this script is to create a tidy Data Set wo I can upload
# it to the Repo.

# Download the file
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
if(!file.exists("./download/")){
    dir.create("./download/")}
if(!file.exists("./data/")){
    dir.create("./data/")}

zip_file <- "./download/dataset.zip"
original_data <- "./data/household_power_consumption.txt"

if(!file.exists(zip_file)) { download.file(url, zip_file,method = "wget") }
if(!file.exists(original_data)) { unzip(zip_file, exdir = "./data/") }
    
# Read
data <- read.table("./data/household_power_consumption.txt",
                   header = TRUE,
                   sep=";",
                   na.strings = "?")

# Subset
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

# Clean
names(data) <- tolower(names(data))
data$date <- as.Date(data$date,format = "%d/%m/%Y")
date_time <- paste(data$date, data$time, sep = " ")
date_time <- strptime(date_time, format = "%Y-%m-%d %H:%M:%S")
data$date <- date_time
data <- subset(data, select = -c(time))

# Create a new file to load in each plot R file
write.table(data,"./data/tidy_data.txt",sep=";")

# Remove original data and downloaded data
file.remove(original_data)
file.remove(zip_file)
