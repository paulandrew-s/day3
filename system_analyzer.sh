info_count=0
error_count=0
warn_count=0
file=$1

analyze_log(){
	line=$1
	if echo "$line" | grep -q "INFO"
	then
	((info_count++))
	elif echo "$line" | grep -q "WARNING"
	then
	((warn_count++))
	else
	((error_count++))
	fi

}

check_status(){
status=""
if [[ $error_count -gt 10 ]]
then
	status="Critical"
elif [[ $error_count -gt 0 ]]
then
	status="Warning"
else
	status="Healthy"
fi
}

# read input file
echo "enter log file: "
read logfile

if [[ ! -f $logfile ]]
then
	echo "File does not exist"
	exit
fi


while read line
do
analyze_log "$line"
done < $logfile

check_status

{
echo "System Analyzer Report"
echo "INFO count: $info_count"
echo "WARNING count: $warn_count"
echo "ERROR count: $error_count"
echo
echo "System status: $status"
} > report.txt
