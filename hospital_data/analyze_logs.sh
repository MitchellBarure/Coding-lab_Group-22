
#!/bin/bash

#creating variables for file path

log_dir="/Coding-lab_Group-22/hospital_data/active_logs"
report_file="/Coding-lab_Group-22/hospital_data/reports/analysis_report.txt"

#asking for user's choice

echo "Select a log file to analyze:"
echo "1) Heart rate (heart_rate.log)"
echo "2) Temperature (temperature.log)"
echo "3) Water usage (water_usage.log)"
read -p "Select your choice (1-3): " choice

#validating user input

case $choice  in 
  1) file="heart_rate_log.log" ;;
  2) file="temperature_log.log" ;;
  3) file="water_usage_log.log" ;;
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
