Algoritmo TUP4_PI_2023_GRUPO_G 
	Definir cantidadProducto, categoria, opcionOrdernar Como Entero
	Definir alimentosRestaurant, alimentosHeladeria, alimentosCafeteria, busquedaProducto, opcionMenu como Caracter
	Definir preciosRestaurant, preciosHeladeria, preciosCafeteria Como Real
	Definir primeraCargar, existeProducto Como Logico
	cantidadProducto <- 0
	primeraCargar <- Falso
	
	Escribir "Bienvenido al APP"
	Repetir
		opcionMenu <- menu()
		Limpiar Pantalla
		Si opcionMenu <> "SALIR" 
			categoria <- categoriaMenu()
			Segun opcionMenu Hacer
				"CARGA DE DATOS":
					Repetir
						Escribir "Ingrese la cantidad productos"
						Leer cantidadProducto
						Si cantidadProducto < 1 Entonces
							Escribir "La cantidad no puede ser menor a uno"
						Fin Si
					Mientras que cantidadProducto < 1
					
					Segun categoria Hacer
						1:
							Dimension alimentosRestaurant[cantidadProducto]
							Dimension preciosRestaurant[cantidadProducto]
							//DatosRestaurant(cantidadProducto, alimentosRestaurant, preciosRestaurant, opcionMenu)
							DatosProduto(cantidadProducto, alimentosRestaurant, preciosRestaurant, opcionMenu)
						2:
							Dimension alimentosHeladeria[cantidadProducto]
							Dimension preciosHeladeria[cantidadProducto]
//							DatosHeladeria(cantidadProducto, alimentosHeladeria, preciosHeladeria, opcionMenu)
							DatosProduto(cantidadProducto, alimentosHeladeria, preciosHeladeria, opcionMenu)
						3:
							Dimension alimentosCafeteria[cantidadProducto]
							Dimension preciosCafeteria[cantidadProducto]
//							DatosCafeteria(cantidadProducto, alimentosCafeteria, preciosCafeteria, opcionMenu)
							DatosProduto(cantidadProducto, alimentosCafeteria, preciosCafeteria, opcionMenu)
					Fin Segun
					
				"BUSQUEDA":
					Segun categoria Hacer
						1:
							//							DatosRestaurant(cantidadProducto, alimentosRestaurant, preciosRestaurant, opcionMenu)
							DatosProduto(cantidadProducto, alimentosRestaurant, preciosRestaurant, opcionMenu)
						2:
							//							DatosHeladeria(cantidadProducto, alimentosHeladeria, preciosHeladeria, opcionMenu)
							DatosProduto(cantidadProducto, alimentosHeladeria, preciosHeladeria, opcionMenu)
						3:
							//							DatosCafeteria(cantidadProducto, alimentosCafeteria, preciosCafeteria, opcionMenu)
							DatosProduto(cantidadProducto, alimentosCafeteria, preciosCafeteria, opcionMenu)
					Fin Segun
					
				"ORDENAMIENTO":
					Repetir
						Escribir "¿Como desea ordenar, ingrese el numero de indice?"
						Escribir "1- Precio"
						Escribir "2- Alfabeticamente"
						Leer  opcionOrdernar
						Si opcionOrdernar < 1 o opcionOrdernar > 2 Entonces
							Escribir "La opcion ingresada no es valida"
						FinSi
					Mientras Que  opcionOrdernar < 1 o opcionOrdernar > 2
					Segun categoria Hacer
						1:
							ordenamiento(preciosRestaurant, alimentosRestaurant, cantidadProducto, opcionOrdernar)
						2:
							ordenamiento(preciosHeladeria, alimentosHeladeria, cantidadProducto, opcionOrdernar)
						3: 
							ordenamiento(preciosCafeteria, alimentosCafeteria, cantidadProducto, opcionOrdernar)
					FinSegun
					Escribir "Ordenamiento realizado con exito!"
				"LISTADO/S":
					Segun categoria Hacer
						1:
							//							DatosRestaurant(cantidadProducto, alimentosRestaurant, preciosRestaurant, opcionMenu)
							DatosProduto(cantidadProducto, alimentosRestaurant, preciosRestaurant, opcionMenu)
						2:
							//							DatosHeladeria(cantidadProducto, alimentosHeladeria, preciosHeladeria, opcionMenu)
							DatosProduto(cantidadProducto, alimentosHeladeria, preciosHeladeria, opcionMenu)
						3:
							//							DatosCafeteria(cantidadProducto, alimentosCafeteria, preciosCafeteria, opcionMenu)
							DatosProduto(cantidadProducto, alimentosCafeteria, preciosCafeteria, opcionMenu)
					Fin Segun
			Fin Segun
		FinSi
	Hasta Que opcionMenu == "SALIR"
	Escribir "Muchas gracias por utilizar nuestra app"
	
FinAlgoritmo

Funcion return<-menu()
	Definir optionMenu Como Cadena;
	Repetir
		Escribir "Ingrese el nombre de la opcion seleccionada"
		Escribir "1. Carga de datos"
		Escribir "2. Busqueda"
		Escribir "3. Ordenamiento"
		Escribir "4. Listado/s"
		Escribir "5. SALIR"
		Leer opMenu
	Hasta Que opMenu == "CARGA DE DATOS" 
	return <- opMenu
FinFuncion

Funcion return<-menu()
	Definir opMenu Como Cadena;
	Repetir
		Escribir "Ingrese el nombre de la opcion seleccionada"
		Escribir "1. Carga de datos"
		Escribir "2. Busqueda"
		Escribir "3. Ordenamiento"
		Escribir "4. Listado/s"
		Escribir "5. SALIR"
		Leer opMenu
		opMenu <- Mayusculas(opMenu)
		Limpiar Pantalla
		Si no(opMenu == "CARGA DE DATOS" o opMenu == "BUSQUEDA" o opMenu == "ORDENAMIENTO" o opMenu == "LISTADO/S" o opMenu == "SALIR") Entonces
			Escribir "Debe escribir el nombre de la opcion, ingrese el texto manualmente"
			Escribir "------------------------------------------------------------------"
		FinSi
	Hasta Que opMenu == "CARGA DE DATOS" o opMenu == "BUSQUEDA" o opMenu == "ORDENAMIENTO" o opMenu == "LISTADO/S" o opMenu == "SALIR"
	return <- opMenu
FinFuncion

Funcion return <- categoriaMenu()
	Definir respuesta Como Caracter
	Definir opCategoria Como Entero
	Repetir
		Escribir "Seleccione el indice de la categoria"
		Escribir "1. Restaurant"
		Escribir "2. Heladeria"
		Escribir "3. Cafeteria"
		Leer respuesta
		Si no (respuesta == "1" o respuesta == "2" o respuesta == "3")
			opCategoria <- 0
			Escribir "Debe ingresar el numero del indice"
		Sino
			opCategoria <- ConvertirANumero(respuesta)
		FinSi
	Mientras Que opCategoria < 1 o opCategoria > 3
	return <- opCategoria
FinFuncion


SubProceso DatosProduto(cantidadProducto, alimentos, precios, opcionMenu)
	Segun opcionMenu Hacer
		"CARGA DE DATOS":
			Para i <- 0 Hasta cantidadProducto -1 Hacer
				Escribir "Ingrese el nombre del producto ", i + 1
				Leer alimentos[i]
				alimentos[i] <- Mayusculas(alimentos[i])
				Escribir "Ingrese el precio ", i + 1 
				Leer precios[i]
			Fin Para
		"BUSQUEDA":
			busquedaAlimento(alimentos,precios,cantidadProducto)
		"LISTADO/S":
			mostrarLista(precios, alimentos, cantidadProducto)
	Fin Segun
FinSubProceso

// DATOS RESTAURANT //
//
//SubProceso DatosRestaurant(cantidadProducto, alimentosRestaurant, preciosRestaurant, opcionMenu)
//	Segun opcionMenu Hacer
//		"CARGA DE DATOS":
//			Para i <- 0 Hasta cantidadProducto -1 Hacer
//				Escribir "Ingrese el nombre del producto ", i + 1
//				Leer alimentosRestaurant[i]
//				alimentosRestaurant[i] <- Mayusculas(alimentosRestaurant[i])
//				Escribir "Ingrese el precio ", i + 1 
//				Leer preciosRestaurant[i]
//			Fin Para
//		"BUSQUEDA":
//			busquedaAlimento(alimentosRestaurant,preciosRestaurant,cantidadProducto)
//		"LISTADO/S":
//			mostrarLista(preciosRestaurant, alimentosRestaurant, cantidadProducto)
//	Fin Segun
//FinSubProceso


// DATOS HELADERIA  //

//SubProceso DatosHeladeria(cantidadProducto, alimentosHeladeria, preciosHeladeria, opcionMenu)
//	Segun opcionMenu Hacer
//		"CARGA DE DATOS":
//			Para i <- 0 Hasta cantidadProducto -1 Hacer
//				Escribir "Ingrese el nombre del producto ", i + 1
//				Leer alimentosHeladeria[i]
//				alimentosHeladeria[i] <- Mayusculas(alimentosHeladeria[i])
//				Escribir "Ingrese el precio ", i + 1 
//				Leer preciosHeladeria[i]
//			Fin Para
//		"BUSQUEDA":
//			busquedaAlimento(alimentosHeladeria,preciosHeladeria,cantidadProducto)
//		"LISTADO/S":
//			mostrarLista(preciosHeladeria, alimentosHeladeria, cantidadProducto)
//	Fin Segun
//FinSubProceso


// DATOS CAFETERIA  //

//SubProceso DatosCafeteria(cantidadProducto, alimentosCafeteria, preciosCafeteria, opcionMenu)
//	Segun opcionMenu Hacer
//		"CARGA DE DATOS":
//			Para i <- 0 Hasta cantidadProducto -1 Hacer
//				Escribir "Ingrese el nombre del producto ", i + 1
//				Leer alimentosCafeteria[i]
//				alimentosCafeteria[i] <- Mayusculas(alimentosCafeteria[i])
//				Escribir "Ingrese el precio ", i + 1 
//				Leer preciosCafeteria[i]
//			Fin Para
//		"BUSQUEDA":
//			busquedaAlimento(alimentosCafeteria,preciosCafeteria,cantidadProducto)
//		"LISTADO/S":
//			mostrarLista(preciosCafeteria, alimentosCafeteria, cantidadProducto)
//	Fin Segun
//FinSubProceso


// MENU DE ORDENAMIENTOS //

SubProceso ordenamiento(precio, alimentos, n, opcionOrdernar)
	Si opcionOrdernar = 1 Entonces
		ordenarArrayPrecios(precio,alimentos,n)
	SiNo
		ordenarArrayAlimentos(precio, alimentos, n)
	FinSi
FinSubProceso


// MENU DE ORDENAMIENTO PARA PRECIOS //

SubProceso ordenarArrayPrecios(precio,alimentos,n)
    Definir orderBy Como Caracter;
    Repetir
        Escribir "Ingrese ASC si quiere ordenarlo ascendentemente o DESC si quiere ordenarlo descendentemente";
        Leer orderBy;
        orderBy <- Mayusculas(orderBy);
    Mientras Que orderBy<>"ASC" y orderBy<>"DESC"
	
    si orderBy="ASC" Entonces
        ordernarArregloPrecioASC(precio,alimentos,n)
    SiNo
        ordernarArregloPrecioDESC(precio,alimentos,n)
    FinSi
FinSubProceso


// ORDENA DE MENOR A MAYOR

SubProceso ordernarArregloPrecioASC(precio,alimentos,n)
    Definir aux Como Entero;
    Definir aux2 Como Caracter
    para i<-0 hasta n-2 Hacer 
        para j<-i+1 hasta n-1 Hacer 
            si precio[i]>precio[j] Entonces
                aux <- precio[i]; 
                aux2 <- alimentos[i]
                precio[i] <- precio[j]; 
				alimentos[i] <- alimentos[j]
                precio[j] <- aux; 
                alimentos[j] <- aux2
            FinSi
        FinPara
    FinPara
	mostrarLista(precio, alimentos, n)
FinSubProceso


// ORDENA DE MAYOR A MENOR  //

SubProceso ordernarArregloPrecioDESC(precio,alimentos,n)
    Definir aux Como Entero;
	Definir aux2 Como Caracter
    para i<-0 hasta n-2 Hacer
        para j<-i+1 hasta n-1 Hacer
            si precio[i]<precio[j] Entonces
                aux <- precio[i]; 
                aux2 <- alimentos[i]
                precio[i] <- precio[j]; 
				alimentos[i] <- alimentos[j]
                precio[j] <- aux; 
                alimentos[j] <- aux2
            FinSi
        FinPara
    FinPara
	mostrarLista(precio, alimentos, n)
FinSubProceso


// ORDENAR ALFABETICAMENTE A-Z  //

SubProceso ordenarArrayAlimentos(precio, alimentos, n)
	Definir aux Como Caracter
	Definir aux2 Como Real
	Para i <- 0 Hasta n - 2 Hacer
		Para j <- i + 1 Hasta n - 1 Hacer
			Si alimentos[i] > alimentos[j] Entonces
				aux <- alimentos[i]; 
				aux2 <- precio[i]
				alimentos[i] <- alimentos[j]; 
				precio[i] <- precio[j]
				alimentos[j] <- aux; 
				precio[j] <- aux2
			Fin Si
		Fin Para
	Fin Para
	mostrarLista(precio, alimentos, n)
FinSubProceso

SubProceso mostrarLista(arrayPrecio, arrayAlimento, n)
	Escribir "PRODUCTO     PRECIO"
	Para i <- 0 Hasta n -1 Hacer
		Escribir arrayAlimento[i]," - ", arrayPrecio[i]
	Fin Para
FinSubProceso

// BUSQUEDA //

SubProceso busquedaAlimento(alimentos, precios, cantidadProducto)
	Definir i, indiceInferior, indiceSuperior, centro Como Entero
	Definir  alimentoBuscado Como Cadena
	Definir elementoEncontrado Como Logico
	elementoEncontrado <- Falso
	
	ordenarArrayBusquedaBinaria(precios, alimentos, cantidadProducto)
	
	indiceInferior<-0
	indiceSuperior<-cantidadProducto-1
	
	Escribir "Ingrese el alimento que quiere buscar"
	Leer alimentoBuscado
	alimentoBuscado <- Mayusculas(alimentoBuscado)
	
	Mientras indiceInferior<=indiceSuperior y no elementoEncontrado
		centro <- trunc((indiceInferior+indiceSuperior)/2)
		si alimentos[centro] == alimentoBuscado Entonces
			Escribir alimentos[centro], " ", precios[centro], "."
			elementoEncontrado <- Verdadero
		SiNo 
			Si alimentos[centro] > alimentoBuscado Entonces
				indiceSuperior <- centro -1
			SiNo
				indiceInferior <- centro +1
			FinSi
		FinSi
	FinMientras
	
	Si no elementoEncontrado Entonces
		Escribir "No se encontro el alimento solicitado";
	FinSi
FinSubProceso


SubProceso ordenarArrayBusquedaBinaria(precio, alimentos, n)
	Definir aux Como Caracter
	Definir aux2 Como Real
	Para i <- 0 Hasta n - 2 Hacer
		Para j <- i + 1 Hasta n - 1 Hacer
			Si alimentos[i] > alimentos[j] Entonces
				aux <- alimentos[i]; 
				aux2 <- precio[i]
				alimentos[i] <- alimentos[j]; 
				precio[i] <- precio[j]
				alimentos[j] <- aux; 
				precio[j] <- aux2
			Fin Si
		Fin Para
	Fin Para
FinSubProceso


