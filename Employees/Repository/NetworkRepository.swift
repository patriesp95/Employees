//
//  NetworkRepository.swift
//  Employees
//
//  Created by Patricia M Espert on 23/11/25.
//

import Foundation

protocol NetworkRepository: NetworkInteractor {
    func getEmployees() async throws(NetworkError) -> [Employee]
}

struct Network: NetworkRepository {
    func getEmployees() async throws(NetworkError) -> [Employee] {
        try await getJSON(.get(url: .getEmployees), type: [EmployeeDTO].self).map(\.toEmployee)
    }
}
