//
//  AlertItem.swift
//  FreeSearch
//
//  Created by Jaime Capponi Zerene on 27-03-22.
//

import SwiftUI

struct AlertItem: Identifiable {
    var id = UUID()
    var title: Text
    var message: Text
    var dismissButton: Alert.Button?
}

enum AlertContext {
    
    //MARK: - Network Errors
    static let invalidURL       = AlertItem(title: Text("Error"),
                                            message: Text("Hay un error intentando lograr la conexión. Si esto continua, favort contactar a soporte al cliente."),
                                            dismissButton: .default(Text("Ok")))
    
    static let unableToComplete = AlertItem(title: Text("Error de conexión"),
                                            message: Text("No se puede realizar la petición. Favor de revisar su conexión a internet."),
                                            dismissButton: .default(Text("Ok")))
    
    static let invalidResponse  = AlertItem(title: Text("Error de servidor"),
                                            message: Text("Respuesta incorrecta del servidor. Por favor intente nuevamente o contacte soporte al cliente."),
                                            dismissButton: .default(Text("Ok")))
    
    static let invalidData      = AlertItem(title: Text("Error"),
                                            message: Text("Los datos recibidos desde el servidor son incorrectos. Por favor intente nuevamente o contacte soporte al cliente."),
                                            dismissButton: .default(Text("Ok")))
}
