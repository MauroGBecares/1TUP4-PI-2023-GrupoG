Algoritmo TUP4_PI_2023_GRUPO_G
	Definir cantidadProducto, cantidadPedidos Como Entero
	Definir alimentosRestaurant, alimentosHeladeria, alimentosCafeteria, busquedaProducto, opcionMenuComerciante, pedidosRealizados, usuario, contrasenia, opcionOrdernar como Caracter
	Definir opcionMenuCliente, categoria Como Caracter
	Definir preciosRestaurant, preciosHeladeria, preciosCafeteria Como Real
	Definir finalizarPrograma, primeraCargaRestaurant, primeraCargaHeladeria, primeraCargaCafeteria Como Logico
	Dimension pedidosRealizados[100,3]
	// LAS COLUMNAS DEL NUEVO ARREGLO SON // NOMBRE Y APELLIDO // DIRECCION // MONTO CON EL QUE PAGA EL CLIENTE
	finalizarPrograma <- Falso
	cantidadProducto <- 0
	primeraCargaRestaurant <- Falso
	primeraCargaHeladeria <- Falso
	primeraCargaCafeteria <- Falso
	
	cantidadPedidos <- 0
	
	Escribir "Bienvenido al APP"
	// PARA INGRESAR COMO CLIENTE: Usuario <- cliente Contraseña <- 1111
	// PARA INGRESAR COMO COMERCIANTE: Usuario <-comerciante Contraseña <- 5555
	// CUPON DE DESCUENTO: CUPON. SUBPROCESO realizarPedido. Linea 430
	Repetir
		menuPrincipal(usuario, contrasenia, finalizarPrograma)
		Si usuario == "cliente" y contrasenia == "1111" Entonces
			Repetir
				opcionMenuCliente <- menuCliente()
				Si opcionMenuCliente <> "SALIR" Entonces
					Si opcionMenuCliente == "REALIZAR PEDIDO" Entonces
						categoria <- categoriaMenu()
						Segun categoria Hacer
							"RESTAURANT":
								Si primeraCargaRestaurant Entonces
									mostrarLista(alimentosRestaurant, preciosRestaurant, cantidadProducto)
									realizarPedido(alimentosRestaurant, preciosRestaurant, cantidadProducto, cantidadPedidos, pedidosRealizados)
								Sino 
									Escribir "No hay datos productos cargados"
								FinSi
							"HELADERIA":
								Si primeraCargaHeladeria Entonces
									mostrarLista(alimentosHeladeria, preciosHeladeria, cantidadProducto)
									realizarPedido(alimentosHeladeria, preciosHeladeria, cantidadProducto, cantidadPedidos, pedidosRealizados)
								SiNo
									Escribir "No hay datos productos cargados"
								FinSi
							"CAFETERIA":
								Si primeraCargaCafeteria Entonces
									mostrarLista(alimentosCafeteria, preciosCafeteria, cantidadProducto)
									realizarPedido(alimentosCafeteria, preciosCafeteria, cantidadProducto, cantidadPedidos, pedidosRealizados)
								SiNo
									Escribir "No hay datos productos cargados"
								FinSi
						Fin Segun
					SiNo
						Si cantidadPedidos == 0 Entonces
							Escribir "No hay pedidos cargados"
						SiNo
							mostrarListaPedidos(pedidosRealizados, cantidadPedidos)
						FinSi
					FinSi
				FinSi
			Mientras Que opcionMenuCliente <> "SALIR"
		SiNo
			Si usuario == "comerciante" y contrasenia == "5555" Entonces
				Repetir
					opcionMenuComerciante <- menuComerciante()
					Si opcionMenuComerciante <> "SALIR" Entonces
						categoria <- categoriaMenu()
						Segun opcionMenuComerciante Hacer
							"CARGA DE DATOS":
								cantidadProducto <- cargarCantidadProductos()
								Segun categoria Hacer
									"RESTAURANT":
										Dimension alimentosRestaurant[cantidadProducto]
										Dimension preciosRestaurant[cantidadProducto]
										cargarProducto(alimentosRestaurant, preciosRestaurant, cantidadProducto)
										primeraCargaRestaurant <- Verdadero
									"HELADERIA":
										Dimension alimentosHeladeria[cantidadProducto]
										Dimension preciosHeladeria[cantidadProducto]
										cargarProducto(alimentosHeladeria, preciosHeladeria, cantidadProducto)
										primeraCargaHeladeria <- Verdadero
									"CAFETERIA":
										Dimension alimentosCafeteria[cantidadProducto]
										Dimension preciosCafeteria[cantidadProducto]
										cargarProducto(alimentosCafeteria, preciosCafeteria, cantidadProducto)
										primeraCargaCafeteria <- Verdadero
								Fin Segun
							"BUSQUEDA":
								Segun categoria Hacer
									"RESTAURANT":
										busquedaProductoComerciante(alimentosRestaurant, preciosRestaurant, cantidadProducto)
									"HELADERIA":
										busquedaProductoComerciante(alimentosHeladeria, preciosHeladeria, cantidadProducto)
									"CAFETERIA":
										busquedaProductoComerciante(alimentosCafeteria, preciosCafeteria, cantidadProducto)
								Fin Segun
							"ORDENAMIENTO":
								opcionOrdernar <- menuOrdenamiento()
								Segun categoria Hacer
									"RESTAURANT":
										ordenamiento(preciosRestaurant, alimentosRestaurant, cantidadProducto, opcionOrdernar)
									"HELADERIA":
										ordenamiento(preciosHeladeria, alimentosHeladeria, cantidadProducto, opcionOrdernar)
									"CAFETERIA":
										ordenamiento(preciosCafeteria, alimentosCafeteria, cantidadProducto, opcionOrdernar)
								Fin Segun
							"LISTADO":
								Segun categoria Hacer
									"RESTAURANT":
										mostrarLista(alimentosRestaurant, preciosRestaurant, cantidadProducto)
									"HELADERIA":
										mostrarLista(alimentosHeladeria, preciosHeladeria, cantidadProducto)
									"CAFETERIA":
										mostrarLista(alimentosCafeteria, preciosCafeteria, cantidadProducto)
								Fin Segun
						Fin Segun
					FinSi
				Mientras Que opcionMenuComerciante <> "SALIR"
			FinSi
		FinSi
	Mientras Que no(finalizarPrograma)
	Escribir "Muchas gracias por utilizar nuestra app"
FinAlgoritmo
 // -----------------------------------------------------------MENU PRINCIPAL----------------------------------------------------------------------------------------------------- //
SubProceso menuPrincipal(usuario Por Referencia, contrasenia Por Referencia, salida Por Referencia)
	Definir opcionIngreso Como Caracter
	Repetir
		Escribir "Que desea hacer?"
		Escribir "- Ingresar"
		Escribir "- Salir"
		Leer opcionIngreso
	Mientras Que no(Mayusculas(opcionIngreso) == "INGRESAR" o Mayusculas(opcionIngreso) == "SALIR")
	Si Mayusculas(opcionIngreso) == "INGRESAR" Entonces
		Repetir
			Escribir "Ingrese su nombre de usuario: "
			Leer usuario
			Escribir "Ingrese su contraseña: "
			Leer contrasenia
			Si no((usuario == "cliente" y contrasenia == "1111") o (usuario == "comerciante" y contrasenia == "5555"))
				Escribir "Las credeciales ingresadas son incorrectas, intente nuevamente"
			FinSi
		Mientras Que no((usuario == "cliente" y contrasenia == "1111") o (usuario == "comerciante" y contrasenia == "5555"))
	SiNo
		salida <- Verdadero
	FinSi
	Limpiar Pantalla
FinSubProceso
// -----------------------------------------------------------FIN MENU PRINCIPAL----------------------------------------------------------------------------------------------------- //

 // ------------------------------------------------------------------COMERCIANTE---------------------------------------------------------------------------------------------------- //
// MENU PRINCIPAL DEL COMERCIANTE //
Funcion return <- menuComerciante()
	Definir opMenu Como Cadena
	Repetir
		Escribir "Ingrese una opcion"
		Escribir "- Carga de datos"
		Escribir "- Busqueda"
		Escribir "- Ordenamiento"
		Escribir "- Listado"
		Escribir "- SALIR"
		Leer opMenu
		opMenu <- Mayusculas(opMenu)
		Si no(opMenu == "CARGA DE DATOS" o opMenu == "BUSQUEDA" o opMenu == "ORDENAMIENTO" o opMenu == "LISTADO" o opMenu == "SALIR") Entonces
			Escribir "La opcion ingresada es incorrecta, ingrese otra nuevamente"
		FinSi
	Hasta Que opMenu == "CARGA DE DATOS" o opMenu == "BUSQUEDA" o opMenu == "ORDENAMIENTO" o opMenu == "LISTADO" o opMenu == "SALIR"
	return <- opMenu
	Limpiar Pantalla
FinFuncion

// MENU DE CATEGORIAS //
Funcion return <- categoriaMenu()
	Definir opCategoria Como Cadena
	Repetir
		Escribir "Ingrese la categoria"
		Escribir "- Restaurant"
		Escribir "- Heladeria"
		Escribir "- Cafeteria"
		Leer opCategoria
		opCategoria <- Mayusculas(opCategoria)
		Si no(opCategoria == "RESTAURANT" o opCategoria == "HELADERIA" o opCategoria == "CAFETERIA") Entonces
			Escribir "La categoria ingresada es incorrecta, ingrese otra nuevamente"
		FinSi
	Mientras Que no(opCategoria == "RESTAURANT" o opCategoria == "HELADERIA" o opCategoria == "CAFETERIA")
	return <- opCategoria
	Limpiar Pantalla
FinFuncion

// COMO COMERCIANTE ELIJE LA CANTIDAD DE PRODUCTOS QUE QUIERE CARGAR //
Funcion return <- cargarCantidadProductos()
	Definir cantProductos Como Entero
	Repetir
		Escribir "Ingrese la cantidad de productos"
		Leer cantProductos
	Mientras Que cantProductos < 0
	return <- cantProductos
FinFuncion

// CARGAR PRODUCTO //
SubProceso cargarProducto(arrayNombreAlimentos, arrayPrecio, n)
	Para i <- 0 Hasta n-1 Hacer
		Escribir "Ingrese el nombre del producto ", i + 1
		Leer arrayNombreAlimentos[i]
		arrayNombreAlimentos[i] <- Mayusculas(arrayNombreAlimentos[i])
		Escribir "Ingrese el precio ", i + 1 
		Leer arrayPrecio[i]
	Fin Para
FinSubProceso

// BUSQUEDA DE PRODUCTO //
SubProceso busquedaProductoComerciante(arrayAlimentos, arrayPrecios, cantidadProductos)
	Definir  alimentoBuscado Como Cadena
	Definir indice Como Entero
	Escribir "Ingrese el alimento que quiere buscar"
	Leer alimentoBuscado
	alimentoBuscado <- Mayusculas(alimentoBuscado)
	indice <- buscarProducto(arrayAlimentos, arrayPrecios, cantidadProductos, alimentoBuscado)
	Si indice < 0 Entonces
		Escribir "No se encontro el alimento solicitado"
	SiNo
		Escribir arrayAlimentos[indice], " ", arrayPrecios[indice], "."
	FinSi
FinSubProceso

// BUSCAR PRODUCTO //
Funcion return <- buscarProducto(arrayAlimentos, arrayPrecios, cantidadProductos, elementoABuscar)
	Definir indiceInferior, indiceSuperior, centro Como Entero
	Definir elementoEncontrado Como Logico
	elementoEncontrado <- Falso
	
	ordenarArrayAlimentos(arrayPrecios, arrayAlimentos, cantidadProductos)
	
	indiceInferior<-0
	indiceSuperior<-cantidadProductos-1
	
	Mientras indiceInferior <= indiceSuperior y no elementoEncontrado
		centro <- trunc((indiceInferior+indiceSuperior)/2)
		si arrayAlimentos[centro] == elementoABuscar Entonces
			elementoEncontrado <- Verdadero
		SiNo 
			Si arrayAlimentos[centro] > elementoABuscar Entonces
				indiceSuperior <- centro - 1
			SiNo
				indiceInferior <- centro + 1
			FinSi
		FinSi
	FinMientras
	
	Si no elementoEncontrado Entonces
		return <- -1
	SiNo
		return <- centro
	FinSi
FinSubProceso

// MENU ORDENAMIENTO PRINCIPAL //
Funcion return <- menuOrdenamiento()
	Definir opcionOrdernar Como Caracter
	Repetir
		Escribir "¿Como desea ordenar?"
		Escribir "- Precio"
		Escribir "- Alfabeticamente"
		Leer opcionOrdernar
		opcionOrdernar <- Mayusculas(opcionOrdernar)
		Si no(opcionOrdernar == "PRECIO" o opcionOrdernar == "ALFABETICAMENTE") Entonces
			Escribir "La opcion ingresada no es valida"
		FinSi
	Mientras Que no(opcionOrdernar == "PRECIO" o opcionOrdernar == "ALFABETICAMENTE")
	return <- opcionOrdernar
FinFuncion

// ORDENAMIENTO //

SubProceso ordenamiento(precio, alimentos, n, opcionOrdernar)
	Si opcionOrdernar == "PRECIO" Entonces
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

// ORDENA DE MENOR A MAYOR PRECIOS //

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

// ORDENA DE MAYOR A MENOR PRECIOS //

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
FinSubProceso

// MOSTRAR LISTA //
SubProceso mostrarLista(arrayAlimentos, arrayPrecios, n)
	Escribir "PRODUCTO     PRECIO"
	Para i <- 0 Hasta n -1 Hacer
		Escribir arrayAlimentos[i]," - ", arrayPrecios[i]
	Fin Para
FinSubProceso

// ------------------------------------------------------------------FIN COMERCIANTE--------------------------------------------------------------------------------------------------- //

// ------------------------------------------------------------------CLIENTE----------------------------------------------------------------------------------------------------------- //
// MENU CLIENTE
Funcion return <- menuCliente()
	Definir opMenu Como Cadena;
	Repetir
		Escribir "Ingrese una opcion"
		Escribir "- Realizar pedido"
		Escribir "- Ver pedidos realizados"
		Escribir "- SALIR"
		Leer opMenu
		opMenu <- Mayusculas(opMenu)
		Si no(opMenu == "REALIZAR PEDIDO" o opMenu == "VER PEDIDOS REALIZADOS" o opMenu == "SALIR") Entonces
			Escribir "La opcion ingresada es incorrecta, ingrese otra nuevamente"
		FinSi
	Mientras Que no(opMenu == "REALIZAR PEDIDO" o opMenu == "VER PEDIDOS REALIZADOS" o opMenu == "SALIR")
	return <- opMenu
	Limpiar Pantalla
FinFuncion

// SUBPROCESO QUE REALIZA PEDIDO - CUPON DE DESCUENTO: CUPON//  
SubProceso realizarPedido(arrayAlimentos, arrayPrecios, n, cantidadPedidos Por Referencia, pedidosRealizados)
	Definir pedido, nombre, IngresaCuponDescuento, direccion, listaProductos, confirmacionPedido Como Caracter
	Definir indice, cantidadPedido, i, cantidad, descuento Como Entero
	Definir subTotal, total, costoEnvio, costoServicio Como Real
	costoEnvio <- 300
	costoServicio <- 100
	descuento <- 0
	Escribir "Cuantos tipos de productos desea pedir: "
	Leer cantidadPedido
	Dimension listaProductos[cantidadPedido, 3]
	i <- 0
	Repetir
		Repetir
			Escribir "Que quiere pedir?"
			Leer pedido
			pedido <- Mayusculas(pedido)
			indice <- buscarProducto(arrayAlimentos, arrayPrecios, n, pedido)
			Si indice < 0 Entonces
				Escribir "Lo solicitado no se encuentra en la lista"
			FinSi
		Mientras Que indice < 0
		Repetir
			Escribir "Ingrese la cantidad: "
			Leer cantidad
		Mientras Que cantidad < 0
		listaProductos[i, 0] <- pedido
		listaProductos[i, 1] <- ConvertirATexto(cantidad)
		listaProductos[i, 2] <- ConvertirATexto(cantidad * arrayPrecios[indice])
		subTotal <- subTotal + (arrayPrecios[indice] * cantidad)
		i <- i + 1
	Mientras Que i < cantidadPedido
	
	Escribir "Ingrese su nombre: "
	Leer nombre
	
	Escribir "Ingrese su dirección: "
	Leer direccion
	
	Repetir
		Escribir "Posee cupon de descuento?(Si/No)"
		Leer IngresaCuponDescuento
		IngresaCuponDescuento <- Mayusculas(IngresaCuponDescuento)
	Mientras Que no(IngresaCuponDescuento == "SI" o IngresaCuponDescuento == "NO")
	Si IngresaCuponDescuento == "SI" Entonces
		Repetir
			Escribir "Ingrese el cupon de descuento o *SALIR* si decide no ingresarlo"
			Leer cuponDescuento
			cuponDescuento <- Mayusculas(cuponDescuento)
			Si no(cuponDescuento == "CUPON") Entonces
				Escribir "El cupon ingresado no es válido o ya caduco"
			FinSi
		Mientras Que no(cuponDescuento == "CUPON" o cuponDescuento == "SALIR")
	FinSi
	
	Si cuponDescuento == "CUPON" Entonces
		Escribir "Usted tendra un 5% de descuento en su proxima compra"
		descuento <- subTotal * 0.05
	FinSi
	
	total <- subTotal - descuento + costoEnvio + costoServicio
	
	Escribir "Detalle del pedido: "
	Escribir "Nombre: ", nombre
	Escribir "Dirección: ", direccion
	Escribir "Subtotal: ", subTotal
	Escribir "Descuento: ", descuento
	Escribir "Producto          Cantidad          Monto"
	Para i<-0 Hasta cantidadPedido - 1 Hacer
		Escribir listaProductos[i,0], "         ",listaProductos[i,1], "         ",listaProductos[i,2]
	Fin Para
	Escribir "Costo de envio: ", costoEnvio
	Escribir "Costo de servicio: ", costoServicio
	Escribir "Total: ", total
	
	Repetir
		Escribir "Confirmar pedido?(Si/No)"
		Leer confirmacionPedido
		confirmacionPedido <- Mayusculas(confirmacionPedido)
	Mientras Que no(confirmacionPedido == "SI" o confirmacionPedido == "NO")
	
	Si confirmacionPedido == "SI" Entonces
		pedidosRealizados[cantidadPedidos, 0] <- nombre
		pedidosRealizados[cantidadPedidos, 1] <- direccion
		pedidosRealizados[cantidadPedidos, 2] <- ConvertirATexto(total)
		cantidadPedidos <- cantidadPedidos + 1
	FinSi
FinSubProceso

SubProceso mostrarListaPedidos(lista, n)
	Escribir "Nombre            Direccion             Total"
	Para i<-0 Hasta n-1 Hacer
		Escribir lista[i,0], "            ",lista[i,1], "              ",lista[i,2]
	Fin Para
FinSubProceso
	