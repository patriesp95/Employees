//
//  URL.swift
//  Employees
//
//  Created by Patricia M Espert on 23/11/25.
//

import Foundation

#if DEBUG
let api = URL(string: "https://localhost:8080/api")!
#else
let api = URL(string: "https://acacademy-employees-api.herokuapp.com/api")!
#endif

extension URL {
    static let getEmpleados = api.appending(path: "getEmpleados")
    static func getEmpleado(id: Int) -> URL {
        api.appending(path: "getEmpleado").appending(path: "\(id)")
    }
}
