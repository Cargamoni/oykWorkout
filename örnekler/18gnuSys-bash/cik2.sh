read q
case $q in 
	[qQ])
		echo "Güle Güle"
		exit 0
		;;
	[Cc][Ii][Kk])
		echo "Güle Güle"
		exit 0
		;;
	
	*)
		echo $q
		$0
		;;
esac
