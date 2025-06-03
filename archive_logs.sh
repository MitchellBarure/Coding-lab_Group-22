#!/bin/bash


echo "Select log to archive:"
echo "1) Heart Rate (heart_rate.log)"
echo "2) Temperature (temperature.log)"
echo "3) Water Usage (water_usage.log)"
read -p "Enter choice (1-3): " choice

if [ "$choice" = "1" ];then
	LOG_FILE="heart_rate.log"
	ARCHIVE_SUBDIR="heart_data_archive"
elif [ "$choice" = "2" ];then
	 LOG_FILE="temperature.log"
         ARCHIVE_SUBDIR="temperature_data_archive"
 elif [ "$choice" = "3" ];then
	 LOG_FILE="water_usage.log"
         ARCHIVE_SUBDIR="water_data_archive"
 else
	 echo "Invalid Choice, Please choose either 1,2, or 3"
	 exit 1
fi


LOG_DIR="hospital_data/active_logs"
ARCHIVE_DIR="hospital_data/archived_logs"
TIMESTAMP=$(date "+%Y-%m-%d_%H-%M-%S")


if [ ! -f "$LOG_DIR/$LOG_FILE" ]; then
    echo "Error: Log file '$LOG_FILE' not found."
    exit 1
fi

if [ ! -d "$ARCHIVE_DIR/$ARCHIVE_SUBDIR" ]; then
    echo "Error: Archive folder '$ARCHIVE_DIR' not found."
    mkdir -p "$ARCHIVE_DIR/$ARCHIVE_SUBDIR/"
fi




if mv "$LOG_DIR/$LOG_FILE" "$ARCHIVE_DIR/$ARCHIVE_SUBDIR/${LOG_FILE%.log}_$TIMESTAMP.log";then
	echo "Successfully archived '$LOG_FILE' to '$ARCHIVE_DIR/$ARCHIVE_SUBDIR/${LOG_FILE%.log}_$TIMESTAMP.log'"
else
	echo "Failed to archive $log_file"
	exit 1
fi
if touch "$LOG_DIR/$LOG_FILE";then
	echo "Created new empty log file: $LOG_FILE"
else
	echo "Failed to create new log file"
	exit 1
fi
