file="books.txt"
# view all books
view_books(){
cat books.txt
}

# search for a book
search_book(){
	echo "Enter book name"
	read name
	if grep -i "$name" "$file"
	then
		echo "Book found"
	else
		echo "Book not found"
	fi
}

# count books that are out of stock
count_books(){
	grep -c "OutOfStock" "$file"
	echo -n "books are out of stock"
}

# update the stock status
update_stock(){
	echo "Enter book ID to update:"
	read id
	if grep -i "$name" "$file" | grep -i "OutOfStock"
	then
		echo "The book is out of stock, would you like to mark it as available?"
		read choice
		if [[ choice == "y" ]]; then
			sed "/^$id/ s/OutOfStock/Available/" "$file"
		fi
	else
		echo "The book is available, would you like to mark it as out of stock?"
		read choice
		if [[ choice == "y" ]]; then
			sed "/^$id/ s/Available/OutOfStock/" "$file"
		fi
	fi
}

# total inventory value
calculate_total(){
	total=$(awk -F ',' '$4=="Available" {sum+=$5} END {print sum}' "$file")
	echo "The total is ${total}"
}


display_category() {

    echo "Enter category"
    read category

    awk -F',' -v cat="$category" '

    BEGIN{
        print "Books in given category"
    }

    $3==cat{
        print $1
    }

    ' "$file"

}


most_expensive() {

    awk -F',' '

    BEGIN{
        max=0
    }

    {
        if($5>max)
        {
            max=$5
            book=$2
        }
    }

    END{
        print "The most expensive book is: ",book
        print "Its price is: ",max
    }

    ' "$file"

}

view_books
search_book
count_books
update_stock
calculate_total
display_category
most_expensive

