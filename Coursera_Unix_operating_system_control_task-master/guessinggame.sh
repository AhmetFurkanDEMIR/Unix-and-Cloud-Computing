clear

a=$(ls | wc -l)

function run {
	clear
	read tah
	if [[ $tah -eq $a ]]
	then
		echo "Amazing!!! You finally guessed it!"


		for f in $(ls)
		do
			echo "  - $f and "
		done

	else
		if [[ $tah -gt $a ]]
		then
			echo "There is less... try again and press Enter :"
			run
		else
			echo "There is more... try again and press Enter :"
			run
		fi
	fi
}
clear
echo "Welcome to the guessing game!"
echo "Guess how many files are in the current directory (pretend you don't know) and press Enter :"
run