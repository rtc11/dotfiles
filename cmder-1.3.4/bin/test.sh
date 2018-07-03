#-#-#-#-#-#-#-#-#-#-#-#
#    ONE ARGUMENT 	  #
#-#-#-#-#-#-#-#-#-#-#-#
if [ $# -eq 1 ]; then

	echo -ne "\e[36m mvn test -Dtest=$1"
	echo -e "\e[0m"
	echo "..."
	mvn test -Dtest=$1

#-#-#-#-#-#-#-#-#-#-#-#
# 	TWO ARGUMENTS     #
#-#-#-#-#-#-#-#-#-#-#-#
elif [ $# -eq 2 ]; then

	echo -ne "\e[36m mvn test -Dtest=$1#$2"
	echo -e "\e[0m"
	echo "..."
	mvn test -Dtest=$1

#-#-#-#-#-#-#-#-#-#-#-#
# 	THREE ARGUMENTS   #
#-#-#-#-#-#-#-#-#-#-#-#
elif [ $# -eq 3 ]; then

	echo "not implemented"

fi