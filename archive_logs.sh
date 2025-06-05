#!/bin/bash



echo "Select log to archive:"
echo "1) Heart Rate (heart_rate.log)"
echo "2) Temperature (temperature.log)"
echo "3) Water Usage (water_usage.log)"
read -p "Enter choice (1-3): " choice


if [ "$choice" = "1" ]; then
    log_file="heart_rate_log.log"
    archive_subdir="heart_data_archive"
elif [ "$choice" = "2" ]; then
    log_file="temperature_log.log"
    archive_subdir="temperature_data_archive"
elif [ "$choice" = "3" ]; then
    log_file="water_usage_log.log"
    archive_subdir="water_data_archive"
else
    echo "Invalid Choice, Please choose either 1, 2, or 3"
    exit 1
fi



log_dir="hospital_data/active_logs"
archive_dir="hospital_data/archived_logs"


if [ ! -f "$log_dir/$log_file" ]; then
    echo "Error: Log file '$log_file' not found."
    exit 1
fi


if [ ! -d "$archive_dir/$archive_subdir" ]; then
    mkdir -p "$archive_dir/$archive_subdir"
fi

timestamp=$(date "+%Y-%m-%d_%H-%M-%S")
new_name="${log_file%.log}_$timestamp.log"
if mv "$log_dir/$log_file" "$archive_dir/$archive_subdir/$new_name"; then
    echo "Successfully archived '$log_file' to '$archive_dir/$archive_subdir/$new_name'"
else
    echo "Failed to archive $log_file"
    exit 1
fi


if touch "$log_dir/$log_file"; then
    echo "Created new empty log file: $log_file"
else
    echo "Failed to create new log file"
    exit 1
fi
