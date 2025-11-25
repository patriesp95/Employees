//
//  NetworkRepository.swift
//  Employees
//
//  Created by Patricia M Espert on 23/11/25.
//

import Foundation

protocol NetworkRepository: Sendable, NetworkInteractor {
    func getEmployees() async throws(NetworkError) -> [Employee]
    func getEmployee(id: Int) async throws(NetworkError) -> Employee
}

struct Network: NetworkRepository {
    func getEmployees() async throws(NetworkError) -> [Employee] {
        try await getJSON(.get(url: .getEmployees), type: [EmployeeDTO].self).map(\.toEmployee)
    }
    
    func getEmployee(id: Int) async throws(NetworkError) -> Employee {
        try await getJSON(.get(url: .getEmployee(id: id)), type: EmployeeDTO.self).toEmployee
    }
}
