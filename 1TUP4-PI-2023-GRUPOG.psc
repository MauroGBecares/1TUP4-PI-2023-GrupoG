Algoritmo TUP4_PI_2023_GRUPO_G 
	Definir cantidadProducto, categoria Como Entero
	Definir alimentosRestaurant, alimentosHeladeria, alimentosCafeteria  Como Caracter
	Definir preciosRestaurant, preciosHeladeria, preciosCafeteria Como Real
	Definir primeraCargar Como Logico
	cantidadProducto <- 0
	primeraCargar <- Falso
	
	Escribir "Bienvenido al APP"
	
	
	Repetir
		menu(opcionMenu)
		
		Segun opcionMenu Hacer
			1:
				Escribir "Ingrese categoria"
				Escribir "1. Restaurant"
				Escribir "2. Heladeria"
				Escribir "3. Cafeteria"
				Leer categoria
				
				Segun categoria Hacer
					1:
						Leer cantidadProducto
						Dimension alimentosRestaurant[cantidadProducto]
						Dimension preciosRestaurant[cantidadProducto]
						Para i <- 0 Hasta cantidadProducto -1 Hacer
							Escribir "Ingrese el nombre del producto ", i + 1
							Leer alimentosRestaurant[i]
							Escribir "Ingrese el precio ", i + 1 
							Leer preciosRestaurant[i]
						Fin Para
						
					2:
						Leer cantidadProducto
						Dimension alimentosHeladeria[cantidadProducto]
						Dimension preciosHeladeria[cantidadProducto]
						Para i <- 0 Hasta cantidadProducto -1 Hacer
							Escribir "Ingrese el nombre del producto ", i + 1
							Leer alimentosHeladeria[i]
							Escribir "Ingrese el precio ", i + 1 
							Leer preciosHeladeria[i]
						Fin Para
					3:
						Leer cantidadProducto
						Dimension alimentosCafeteria[cantidadProducto]
						Dimension preciosCafeteria[cantidadProducto]
						Para i <- 0 Hasta cantidadProducto -1 Hacer
							Escribir "Ingrese el nombre del producto ", i + 1
							Leer alimentosCafeteria[i]
							Escribir "Ingrese el precio ", i + 1 
							Leer preciosCafeteria[i]
						Fin Para
				Fin Segun
				
				
			2:
				
			3:
				
			4:
				Escribir "Seleccione la categoria de deseea listar"
				
				Escribir "Ingrese categoria"
				Escribir "1. Restaurant"
				Escribir "2. Heladeria"
				Escribir "3. Cafeteria"
				Leer categoria
				
				
				Segun categoria Hacer
					1:
						Para i <- 0 Hasta cantidadProducto -1 Hacer
							Escribir "Producto", i + 1, alimentosRestaurant[i]
							Escribir "Ingrese el precio ", i + 1, preciosRestaurant[i]
						Fin Para
						
					2:
						Para i <- 0 Hasta cantidadProducto -1 Hacer
							Escribir "Producto", i + 1, alimentosHeladeria[i]
							Escribir "Ingrese el precio ", i + 1, preciosHeladeria[i]
						Fin Para
					3:
						Para i <- 0 Hasta cantidadProducto -1 Hacer
							Escribir "Producto", i + 1, alimentosCafeteria[i]
							Escribir "Ingrese el precio ", i + 1, preciosCafeteria[i]
						Fin Para
				Fin Segun
		Fin Segun
		
	Hasta Que opMenu==5

FinAlgoritmo


SubProceso menu(opMenu Por Referencia)
	Repetir
		Escribir "1. Carga de datos"
		Escribir "2. Búsqueda"
		Escribir "3. Ordenamiento"
		Escribir "4. Listado/s"
		Escribir "5. SALIR";
		Leer opMenu
	Mientras Que opMenu < 1 o opMenu > 5
FinSubProceso