#!/bin/bash

echo "Which log do you want to archive?"
echo "1) Heart Rate"
echo "2) Temperature"
echo "3) Water Usage"
read -p "Enter 1, 2, or 3: " choice

case "$choice" in
  1)
    LOG_FILE="heart_rate.log"
    ARCHIVE_SUBDIR="heart_data_archive"
    ;;
  2)
    LOG_FILE="temperature.log"
    ARCHIVE_SUBDIR="temperature_data_archive"
    ;;
  3)
    LOG_FILE="water_usage.log"
    ARCHIVE_SUBDIR="water_usage_data_archive"
    ;;
  *)
    echo "Invalid choice."
    exit 1
    ;;
esac

active_path="Hospital_data/actice_logs/$LOG_FILE"
archive_path="hospital_data/archived_logs/$ARCHIVE_FOLDER"

if [ ! -f "$active_path" ]; then 
	echo "ERROR:Active log file '$log_filee'not found."
	exit 1
fi

if[ ! -d "$archive_path" ];
	echo "ERROR: Active folder '$archive_path' not found"
	exit 1
fi 
