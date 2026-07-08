check_odd_even(){
if [[ $(($1 % 2)) -eq 0 ]]; then
	echo "It is an even number"
else
	echo "It is an odd number"
fi
}

echo "Enter a number"
read n
check_odd_even $n
