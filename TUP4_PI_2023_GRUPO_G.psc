Algoritmo TUP4_PI_2023_GRUPO_G 
	Definir cantidadProducto, categoria, opcionMenu, opcionOrdernar Como Entero
	Definir alimentosRestaurant, alimentosHeladeria, alimentosCafeteria  Como Caracter
	Definir preciosRestaurant, preciosHeladeria, preciosCafeteria Como Real
	Definir primeraCargar Como Logico
	cantidadProducto <- 0
	primeraCargar <- Falso
	
	Escribir "Bienvenido al APP"
	Repetir
		opcionMenu <- menu()
		categoria <- categoriaMenu()
		Segun opcionMenu Hacer
			1:
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
						cargaDatosRestaurant(cantidadProducto, alimentosRestaurant, preciosRestaurant, opcionMenu)
					2:
						Dimension alimentosHeladeria[cantidadProducto]
						Dimension preciosHeladeria[cantidadProducto]
						cargaDatosHeladeria(cantidadProducto, alimentosHeladeria, preciosHeladeria)
					3:
						Dimension alimentosCafeteria[cantidadProducto]
						Dimension preciosCafeteria[cantidadProducto]
						cargaDatosCafeteria(cantidadProducto, alimentosCafeteria, preciosCafeteria)
				Fin Segun				
			2:
				
			3:
				Repetir
					Escribir "¿Como desea ordenar?"
					Escribir "1- Precio?"
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
			4:			
				Segun categoria Hacer
					1:
						cargaDatosRestaurant(cantidadProducto, alimentosRestaurant, preciosRestaurant, opcionMenu)
					2:
						listarDatosHeladeria(cantidadProducto, alimentosHeladeria, preciosHeladeria)
					3:
						listarDatosCafeteria(cantidadProducto, alimentosCafeteria, preciosCafeteria)
				Fin Segun
		Fin Segun
		
	Hasta Que opMenu==5
	Escribir "Muchas gracias por utilizar nuestra app"
FinAlgoritmo

Funcion return<-menu()
	Definir opMenu Como Entero;
	Repetir
		Escribir "1. Carga de datos"
		Escribir "2. Búsqueda"
		Escribir "3. Ordenamiento"
		Escribir "4. Listado/s"
		Escribir "5. SALIR";
		Leer opMenu;
	Mientras Que opMenu < 1 o opMenu > 5
	return <- opMenu;
FinFuncion

Funcion return <- categoriaMenu()
	Definir opCategoria Como Entero
	Repetir
		Escribir "Ingrese categoria"
		Escribir "1. Restaurant"
		Escribir "2. Heladeria"
		Escribir "3. Cafeteria"
		Leer opCategoria
	Mientras Que opCategoria < 1 o opCategoria > 3
	return <- opCategoria
FinFuncion

SubProceso  cargaDatosRestaurant(cantidadProducto, alimentosRestaurant, preciosRestaurant, opcionMenu)
	Segun opcionMenu Hacer
		1:
			Para i <- 0 Hasta cantidadProducto -1 Hacer
				Escribir "Ingrese el nombre del producto ", i + 1
				Leer alimentosRestaurant[i]
				Escribir "Ingrese el precio ", i + 1 
				Leer preciosRestaurant[i]
			Fin Para
		3:
			
		4:
			Para i <- 0 Hasta cantidadProducto -1 Hacer
				Escribir "Producto", i + 1, alimentosRestaurant[i]
				Escribir "Ingrese el precio ", i + 1, preciosRestaurant[i]
			Fin Para
	Fin Segun
FinSubProceso

SubProceso  cargaDatosHeladeria(cantidadProducto, alimentosHeladeria, preciosHeladeria)
	Para i <- 0 Hasta cantidadProducto -1 Hacer
		Escribir "Ingrese el nombre del producto ", i + 1
		Leer alimentosHeladeria[i]
		Escribir "Ingrese el precio ", i + 1 
		Leer preciosHeladeria[i]
	Fin Para
FinSubProceso

SubProceso  cargaDatosCafeteria(cantidadProducto, alimentosCafeteria, preciosCafeteria)
	Para i <- 0 Hasta cantidadProducto -1 Hacer
		Escribir "Ingrese el nombre del producto ", i + 1
		Leer alimentosCafeteria[i]
		Escribir "Ingrese el precio ", i + 1 
		Leer preciosCafeteria[i]
	Fin Para
FinSubProceso

SubProceso  listarDatosHeladeria(cantidadProducto, alimentosHeladeria, preciosHeladeria)
	Para i <- 0 Hasta cantidadProducto -1 Hacer
		Escribir "Producto", i + 1, alimentosHeladeria[i]
		Escribir "Ingrese el precio ", i + 1, preciosHeladeria[i]
	Fin Para
FinSubProceso

SubProceso  listarDatosCafeteria(cantidadProducto, alimentosCafeteria, preciosCafeteria)
	Para i <- 0 Hasta cantidadProducto -1 Hacer
		Escribir "Producto", i + 1, alimentosCafeteria[i]
		Escribir "Ingrese el precio ", i + 1, preciosCafeteria[i]
	Fin Para
FinSubProceso

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
FinSubProceso

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
FinSubProceso

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
FinSubProceso

SubProceso ordenamiento(precio, alimentos, n, opcionOrdernar)
	Si opcionOrdernar = 1 Entonces
		ordenarArrayPrecios(precio,alimentos,n)
	SiNo
		ordenarArrayAlimentos(precio, alimentos, n)
	FinSi
FinSubProceso


	