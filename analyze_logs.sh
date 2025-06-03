#!/bin/bash

#creating variables for file path

log_dir="/hospital_data/active_logs"
report_file="/hospital_data/reports/analysis_report.txt"

#asking for user's choice

echo "Select a log file to analyze:"
echo "1) Heart rate (heart_rate.log)"
echo "2) Temperature (temperature.log)"
echo "3) Water usage (water_usage.log)"
read -p "Select your choice (1-3): " choice

#validating user input
