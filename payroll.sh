file="employees.txt"

calculate_payroll(){
	awk '
	$3 > 60000 {
		print $1, $2, $3, 15
	}
	$3 >= 30001 && $3 <= 60000 {
		print $1, $2, $3, 10
	}
	$3 <= 30000 {
		print $1, $2, $3, 5
	}
	' $file > test.txt
}

calculate_bonus(){
        awk '
        $3 > 50000 {
                print $1, $2, $3, $4, 5000
        }
        $3 <= 50000 {
                print $1, $2, $3, $4, 2000
        }
        ' test.txt > payroll_report1.txt
}

calculate_payroll
calculate_bonus


calculate_net(){
        awk '
        $1==$1 {
	print $1, $2, $3, $4, $5, $3-(($4/100)*$3)+$5
        }
	' payroll_report1.txt > payroll_report.txt
}
calculate_net
