#!/bin/bash

#creating variables for file path
base_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

log_dir="$base_dir/hospital_data/active_logs"
report_file="$base_dir/hospital_data/reports/analysis_report.txt"

#asking for user's choice

echo "Select a log file to analyze:"
echo "1) Heart Rate (heart_rat.log)"
echo "2) Temperature (temperature.log)"
echo "3) Water usage (water_usage.log)"
read -p "Select your choice (1-3): " choice

#validating user input

case $choice  in 
  1) file="heart_rate.log" ;;
  2) file="temperature.log" ;;
  3) file="water_usage.log" ;;
  *) echo "Invalid Input."; exit 1 ;;
esac

#check if the file exists

file_path="$log_dir/$file"

if [[ -f "$file_path" ]]; then
 echo "Log file exists: $file_path"
else
 echo "Log file does not exist: $file_path"
 exit 1
fi

echo -e "\n--- Analysis of $file on $(date) ---" >> "$report_file"
awk '{ count[$3]++ } END { for (val in count) print val ": " count[val] " entries" }' "$file_path" >> "$report_file"
first_ts=$(head -n 1 "$file_path" | awk '{print $1, $2}')
last_ts=$(tail -n 1 "$file_path" | awk '{print $1, $2}')
echo "First Entry: $first_ts" >> "$report_file"
echo "Last Entry : $last_ts" >> "$report_file"

echo "Analysis complete. Check: $report_file"
