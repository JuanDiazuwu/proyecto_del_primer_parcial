if [ $# != 1 ]; then 
	echo "Error de parametros, se necesita uno: [-a | -t]"
	exit 1
fi

if [ $1 == "-a" ]; then 
	while true; do 
		echo ""
		echo "Bienvenido a la guía rapida de Agile, para continuar seleccione un tema:" 
		echo "1.SCRUM"
		echo "2. X.P."
		echo "3. Kanban"
		echo "4. Crystal"
		echo "5. Terminar ejecución"
		echo ""
		read -p "Elija una opción : " selection_user
		echo $selection_user
	done
fi 
