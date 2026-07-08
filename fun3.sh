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
rev_str=""
# String reversal
reverse_string(){
str=$1
for (( i=${#str}-1; i >= 0; i-- ))
do
	rev_str=${rev_str}${str:$i:1}
done
echo $rev_str
}

reverse_string Linux
