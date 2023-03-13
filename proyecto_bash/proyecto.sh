if [ $# != 1 ]; then 
	echo "Error de parametros, se necesita uno: [-a | -t]"
	exit 1
fi

if [ $1 == "-a" ]; then 
	while true; do 
		echo ""
		echo "Bienvenido a la guía rapida de Agile, para continuar seleccione un tema:" 
		echo "1. SCRUM"
		echo "2. X.P."
		echo "3. Kanban"
		echo "4. Crystal"
		echo "5. Terminar ejecución"
		echo ""
		read -p "Elija una opción : " selection_user
		echo $selection_user
		
		case $selection_user in 
			1 )
				while true; do
				       echo "Buenas"	
				done
			;;
			2 )
				while true; do
				       echo "Buenas"	
				done
			;;
			3 )
				while true; do
				       echo "Buenas"	
				done
			;;	
			4 )
				while true; do
				       echo "Buenas"	
				done
			;;	
			5 )
				while true; do
				       echo "Buenas"	
				done
			;;	
		esac
	done
fi


