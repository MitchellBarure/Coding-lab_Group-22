#this is the hospital data monitoring & archival system project where we were tasked to; 
       1. collect real time patient health metrics and resource usage data 
       2. provide controlled lof archiving with user selection 
       3. generate analytical reports with device statidtics and temporal patterns 
      4. show profiency in interactive shell scripting, log file processing and data analysis with linux tools

#the repository contains scripts and python simulation files for the Hospital Data Monitoring and Archival System project 

#start by creating files and pasting the python simulators 
#creating directory structure as provided 
# opened three separate terminals and in each terminal run on the python simulator scripts and these scripts will continously add data to their respective log files 
#task 1 : wrote a script that automates the process of archiving log files, when executed it asks the user to select a llog type and moves the active log to its archive folder and rename it with a timestamo and creates a new log file to ensure continous data collection by the simulators.
for the commands used in this scripts for archive_logs.sh include;
echo which displays messages 
read -p which takes the input from the terminal and stores it as a variable as the user are  now able to enter their choice 
if/elif/else which process user choices and handle various error conditons 
time stamp to generate the current date and time in the specified format 
mv which moves the active log file from its original location to the archive directory and renames it with the generated timestamp
touch creates a new empty log file in the active logs directory after the original has been removed 
mkdir for creating directories 
exit terminate the script 
 
#script 2 analyze_logs.sh
this script provides an interactive interface to analyze collected log data.it counts device occurences within selected log file anf records timestamps of the first and last entries appending the results to analysis report 
. the script presents a menu for selecting which log file to analyze 
. it counts the occurence of each device in the selected log file 
. appends the results to reports/analysis_report.txt
the commands used for this script are;
cat displays the content of the log file 
awk used to extract timestamps from structured log file 
sort sorts the lines of input in a certain order 
uniq -c displays unique lines 
 


