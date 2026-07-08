add_num() {
sum=$(( $1+$2 ))
echo "Sum is: ${sum}"
}

add_num

echo "Enter num1"
read num1
echo "Enter num2"
read num2

add_num $num1 $num2
