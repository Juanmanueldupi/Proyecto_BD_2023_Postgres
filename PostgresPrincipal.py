from PostgresPython3 import *

db=Conexion_BD(host="localhost",port="5432",dbname="Python3",user="postgres",password="postgres")

opcion=MostrarMenu()
while opcion != 0:
    if opcion == 1:
        Listar_Pais(db)
        print()
    elif opcion == 2:
        Listar_Alojamiento(db)
    elif opcion == 3:
        Listar(db)    
        print()
    elif opcion == 4:
        fecha = input("Introduce una fecha por pantalla(aaaa-mm-dd): ")
        Buscar(db,fecha)
        print()
    elif opcion == 5:
        PaisOrigen= input("Introduce el nombre de tu pais de origen: ")
        BuscarRelacionada(db,PaisOrigen)
        print()
    elif opcion == 6:
        nuevo={}
        nuevo["NumAsociado"]=input("Introduce el numero de Asociado: ")
        print()
        nuevo["NumCorrelativo_Pais"]=input("Introduce el codigo de tu Pais(1-7): ")
        print()
        nuevo["Nombre"]=input("Introduce el Nombre: ")
        print()
        nuevo["Telefono"]=input("Introduce el Telefono: ")
        print()
        nuevo["Direccion"]=input("Introduce la Direccion:")
        NuevoParticipante(db,nuevo)
        print()
    elif opcion == 7:
        borrar = input("Introduce el nombre de un pais: ")
        BorrarInformacion(db,borrar)
        print()
    elif opcion == 8:
        actualizar = input("Introduce un numero de asociado: ")
        ActualizarInformacion(db,actualizar)
    opcion=MostrarMenu()
Dexconexion_BD(db)