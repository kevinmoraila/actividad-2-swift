import Foundation

// Estructura para representar un artículo del inventario
struct Articulo {
    var nombre: String
    var cantidad: Int
}

// Función para registrar un artículo
func registrarArticulo() -> Articulo {
    print("Por favor, ingrese el nombre del artículo a registrar y presione enter:")
    let nombre = readLine() ?? ""
    
    print("Ingrese la cantidad de artículos a registrar:")
    if let cantidadString = readLine(), let cantidad = Int(cantidadString) {
        return Articulo(nombre: nombre, cantidad: cantidad)
    } else {
        return Articulo(nombre: nombre, cantidad: 0)
    }
}

// Función para ver la lista de artículos
func verListaArticulos(articulos: [Articulo]) {
    print("Lista de artículos:")
    for (index, articulo) in articulos.enumerated() {
        print("Artículo \(index + 1): \(articulo.nombre) - Cantidad: \(articulo.cantidad)")
    }
}

// Función para consultar los artículos en existencia
func consultarExistencia(articulos: [Articulo]) {
    var totalExistencia = 0
    for articulo in articulos {
        totalExistencia += articulo.cantidad
    }
    print("Total de artículos en existencia: \(totalExistencia)")
}

// Función principal
func main() {
    var inventario: [Articulo] = []
    var opcion = 0
    
    while opcion != 4 {
        print("\nMenú:")
        print("1. Registrar un artículo")
        print("2. Ver la lista de artículos")
        print("3. Consultar los artículos en existencia")
        print("4. Salir")
        print("Ingrese la opción deseada:")
        
        if let opcionString = readLine(), let opcionInt = Int(opcionString) {
            opcion = opcionInt
            
            switch opcion {
            case 1:
                let nuevoArticulo = registrarArticulo()
                inventario.append(nuevoArticulo)
                print("Artículo registrado exitosamente.")
            case 2:
                verListaArticulos(articulos: inventario)
            case 3:
                consultarExistencia(articulos: inventario)
            case 4:
                print("Saliendo del programa.")
            default:
                print("Opción inválida. Por favor, ingrese una opción válida.")
            }
        } else {
            print("Opción inválida. Por favor, ingrese una opción válida.")
        }
    }
}

// Llamamos a la función main para iniciar el programa
main()
