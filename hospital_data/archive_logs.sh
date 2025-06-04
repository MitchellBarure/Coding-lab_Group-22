#!/bin/bash

# Define log file paths
LOG_DIR="hospital_data/active_logs"
ARCHIVE_DIR="hospital_data/archived_logs"

# Ensure archive directory exists
mkdir -p "$ARCHIVE_DIR"

# Display menu
echo "Select log to archive:"
echo "1) Heart Rate (heart_rate.log)"
echo "2) Temperature (temperature.log)"
echo "3) Water Usage (water_usage.log)"
read -p "Enter choice (1-3): " choice

# Get current timestamp
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")

# Process user selection
case $choice in
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
        ARCHIVE_SUBDIR="water_data_archive"
        ;;
    *)
        echo "Invalid selection. Please choose 1, 2, or 3."
        exit 1
        ;;
esac

# Validate log file existence
if [ ! -f "$LOG_DIR/$LOG_FILE" ]; then
    echo "Error: Log file '$LOG_FILE' not found."
    exit 1
fi

# Ensure specific archive folder exists
mkdir -p "$ARCHIVE_DIR/$ARCHIVE_SUBDIR"

# Archive log file
mv "$LOG_DIR/$LOG_FILE" "$ARCHIVE_DIR/$ARCHIVE_SUBDIR/${LOG_FILE%.log}_$TIMESTAMP.log"
touch "$LOG_DIR/$LOG_FILE"

echo "Archiving heart_rate.log..."
echo "Successfully archived '$LOG_FILE' to '$ARCHIVE_DIR/$ARCHIVE_SUBDIR/${LOG_FILE%.log}_$TIMESTAMP.log'"

