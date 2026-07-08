search_word(){
file=$1
word=$2

if grep -qi "$word" "$file"
then
	echo "'$word' found in $file"
else
	echo "'$word' not found in $file"
fi
}

search_word file1.txt Linux
