count_errors(){
	echo "Number of error messages: "
	grep -c "ERROR" server.log
}

show_warning(){
	echo "Warning Messages"
	grep "WARNING" server.log
}

replace_error(){
	echo "Replacing ERROR with CRITICAL"
	sed 's/ERROR/CRITICAL/g' server.log
}

count_errors
show_warning
replace_error
