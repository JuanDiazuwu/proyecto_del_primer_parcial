#!/bin/bash

function menu_two {
	echo ""
	echo "Usted esta en la sección $1 seleccione la opción que desea utilizar."
	echo "1. Agregar información"
	echo "2. Buscar"
	echo "3. Eliminar información"
	echo "4. Leer base de información"
	echo "5. Salir al menú principal"
   	echo ""
   	read -p "Porfavor, seleccione una opción: " selection_menu_two
   	
   	case $selection_menu_two in
		1)
			save_info "$1"
		;;
		2)
			search "$1"
		;;
		3)
			delete "$1"
		;;
		4)
			read_uwu $1
		;;
		5)
			echo "Falta esta parte"
		;;
		*)
			echo "Porfavor escoja una respuesta correcta"
		;;
	esac
}

function save_info {
	if [ ! -e "$1.info" ]; then
		touch "$1.info"
		echo "Archivo creado"
	fi
	read -p "Ingrese el concepto: " concept
	read -p "Ingrese la definición de $concept: " definition
	echo "[$concept] .- $definition." >> "$1.info"
}

function search {
	read -p "Ingrese la palabra que quiere buscar: " search_word
	if grep -Eo '\[[^]]+\]' "$1.info" | grep "$search_word"; then 
		echo "La palabra "$search_word" si existe"
	else
		echo "La palabra "$search_word" no existe"
	fi
}

function _search {
	if grep -Eo '\[[^]]+\]' "$1.info" | grep "$2"; then
		return 0
	else
		return 1
	fi
}

function delete {
	read -p "Ingresa el concepto que deseas eliminar: " delete_word
	_search $1 $delete_word
	aux=$?
	#echo "EL valor de aux: $aux"
	if [ $aux == 0 ]; then 
		sed -i "/\[.*$delete_word.*\]/d" "$1.info" 
	else
		echo "El concepto no existe en $1.info"
	fi
}

function read_uwu {
	echo ""
	echo "El contenido del archivo $1.info es: "
	echo ""
	cat $1.info
}

if [ $# != 1 ]; then 
	echo "Error de parámetros, se necesita uno: [-a | -t]"
	exit 1
fi

if [ $1 == "-a" ]; then 
	while true; do 
		echo ""
		echo "Bienvenido a la guía rápida de Agile, para continuar seleccione un tema:" 
		echo "1. SCRUM"
		echo "2. X.P."
		echo "3. Kanban"
		echo "4. Crystal"
		echo "5. Terminar ejecución"
		echo ""
		read -p "Elija una opción: " selection_user
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
                		echo "Nos vemos!!! Gracias por utilizar nuestro programa <3"
                		break
			;;	
		esac
	done
elif [ $1 == "-t" ];then
	while true; do
        	echo ""
        	echo "Bienvenido a la guía rápida de metodologías tradicionales, para continuar seleccione un tema:"
        	echo "1. Cascada"
        	echo "2. Espiral"
        	echo "3. Modelo V"
        	echo "4. Terminar ejecución"
        	read -p "Elija una opción: " selection_user
        	case $selection_user in 
			1 )
				while true; do
					menu_two "cascada"	
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
				echo "Nos vemos!!! Gracias por utilizar nuestro programa <3"
				break
			;;
		esac   
	done
else
	echo "Escoge un parámetro válido: [-a | -t]"
fi