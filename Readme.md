PROJECT NAME:
#Hospital Data Monitoring & Archival System project
-This project simulates real-time monitoring in a hospital environment by logging patient health metrics and resource usage. It includes scripts for archiving log files and analyzing device activity over time.

##Project Features:
       1. collect real time patient health metrics and resource usage data
       2. provide controlled log archiving with user selection
       3. generate analytical reports with device statistics and temporal patterns

##Learning Objective:
-Demonstrate proficiency in interactive shell scripting using `select`, `case`, and `if` constructs
-Automate log file processing with tools like `mv`, `touch`, and `date`
-Analyze data using Linux command-line tools like `awk`, `grep`, `sort`, and `uniq`

##Repository structure:
.
├── analyze_logs.sh
├── archive_logs.sh
├── hospital_data
│   ├── active_logs
│   │   ├── heart_rate_log.log
│   │   ├── temperature_log.log
│   │   └── water_usage_log.log
│   ├── archived_logs
│   │   ├── heart_data_archive
│   │   │   ├── heart_rate_2025-06-04_02-26-46.log
│   │   │   ├── heart_rate_2025-06-04_06-44-39.log
│   │   │   ├── heart_rate_2025-06-04_06-47-57.log
│   │   │   ├── heart_rate_2025-06-04_06-55-08.log
│   │   │   ├── heart_rate_2025-06-05_01-52-18.log
│   │   │   ├── heart_rate_log_2025-06-04_07-22-35.log
│   │   │   ├── heart_rate_log_2025-06-04_07-26-43.log
│   │   │   └── heart_rate_log_2025-06-04_07-39-59.log
│   │   ├── temperature_data_archive
│   │   │   ├── temperature_2025-06-04_06-51-17.log
│   │   │   └── temperature_2025-06-05_01-52-36.log
│   │   └── water_data_archive
│   │       ├── water_usage_2025-06-04_02-27-10.log
│   │       ├── water_usage_2025-06-05_01-52-45.log
│   │       └── water_usage_log_2025-06-04_07-41-59.log
│   ├── heart_monitor.py
│   ├── reports
│   │   └── analysis_report.txt
│   ├── temp_sensor.py
│   └── water_meter.py
└── Readme.md

##System Set-up:
-create the directory structure as shown above. 
-start by creating a file for each python simulators and paste each stimulator's content into their respective files.
-open three separate terminals and respectively run each python simulator scrip using:
   1.python3 heart_monitor.py start
   2.python3 temp_sensor.py start
   3.python3 water_meter.py start
these simulators continuously append real-time data to their respective log files.
-Use 'tail -f' to verify the data collection in each log file.

##ARCHIVAL SCRIPT(archival_log.sh) 
-Write a script that automates the process of archiving log files. When executed it should ask the user to select a log type and moves the active log to its archive folder, renaming it with a timestamp and creating a new log file to ensure continous data addititon to the active logs by the simulators. Commands used in this scripts for archive_logs.sh include:
        1. echo which displays messages 
        2. read -p which takes the input from the terminal and stores it as a variable as the user is now able to enter their choice 
        3. if/elif/else which process user choices and handle various error conditons 
        4. time stamp to generate the current date and time in the specified format 
        5. mv which moves the active log file from its original location to the archive directory and renames it with the generated timestamp
        6. touch creates a new empty log file in the active logs directory after the original has been removed 
        7. mkdir for creating directories 
        8. exit to terminate the script
-To run archive_logs.sh, use './archive_logs.sh'. This will prompt a user to select a log type. The selected log type will be moved to its archive folder, appending a timestamp and creating a new empty log file to allow continous data writing by the python stimulators.

##ANALYSIS SCRIPT(analyze_logs.sh)
-Write a script that provides an interactive interface to analyze collected log data. It counts device occurences within selected log file and records timestamps of the first and last entries appending the results to an analysis report. The script should present a menu for selecting which log file to analyze, count the occurence of each device in the selected log file and append the results to reports/analysis_report.txt. The commands used for this script are:
        1. cat which  displays the content of the log file 
        2. awk used to extract timestamps from structured log file 
        3. sort to organize the lines of input in a certain order 
        4. uniq -c which displa
-To run analyze_logs.sh, usw './analyze_logs.sh'.This will prompt a user  to select a log file to analyze. The output (number of entries per device and the first and last timestamps of log entries) will be appended to the file analysis_reports.txt

##Error Handling:
Both the archival and analysis scripts include;
-Validation for incorrect menu choices
-Checks for missing log files/directories
-Error messages

##Authors:
-Group Coding Lab 22: Ailek Becky, Liliane Uwase, Manuelle Ackun, Mitchell Barure, Nyayath Chol, Oluwatomi Thompson
