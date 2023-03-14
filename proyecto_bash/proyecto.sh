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
			return 1
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
	if grep -Eo '\[[^]]+\]' "$1.info" | grep "$search_word"; then #if grep -e "$search_word" "$1.info"; then
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
		echo "El concepto se elimino correctamente"
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
		
		case $selection_user in
            1|SCRUM|Scrum|scrum|1SCRUM )
                while true; do
                    menu_two "SCRUM"
                    return_to_menu_two=$?
                    if [ $return_to_menu_two == 1 ];then
                        break
                    fi
                done
            ;;
            2|XP|Xp|xp|2XP )
                while true; do
                    menu_two "X.P"
                    return_to_menu_two=$?
                    if [ $return_to_menu_two == 1 ];then
                        break
                    fi
                done
            ;;
            3|Kanban|kanban|3Kanban )
                while true; do
                    menu_two "Kanban"
                    return_to_menu_two=$?
                    if [ $return_to_menu_two == 1 ];then
                        break
                    fi
                done
            ;;
            4|Crystal|crystal|4Crystal )
                while true; do
                    menu_two "Crystal"
                    return_to_menu_two=$?
                    if [ $return_to_menu_two == 1 ];then
                        break
                    fi
                done
            ;;
            5|Exit|exit|Salir|salir)
                echo "Nos vemos!!! Gracias por utilizar nuestro programa <3"
                break
            ;;
            *)
                echo "Porfavor escoga una respuesta correcta"
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
            1|Cascada|cascada|1Cascada)
                while true; do
                    menu_two "Cascada"
                    return_to_menu_two=$?
                    if [ $return_to_menu_two == 1 ];then
                        break
                    fi
                done
            ;;
            2|Espiral|espiral|2Espiral)
                while true; do
                    menu_two "Espiral"
                    return_to_menu_two=$?
                    if [ $return_to_menu_two == 1 ];then
                        break
                    fi
                done
            ;;
            3|ModeloV|modelov|modeloV|3ModeloV)
                while true; do
                    menu_two "ModeloV"
                    return_to_menu_two=$?
                    if [ $return_to_menu_two == 1 ];then
                        break
                    fi
                done
            ;;
            4|Exit|exit|Salir|salir)
                echo "Nos vemos!!! Gracias por utilizar nuestro programa <3"
                break
            ;;
            *)
                echo "Porfavor escoga una respuesta correcta"
            ;;
        esac
	done
else
	echo "Escoge un parámetro válido: [-a | -t]"
fi