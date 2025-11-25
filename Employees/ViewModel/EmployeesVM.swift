//
//  Untitled.swift
//  Employees
//
//  Created by Patricia M Espert on 24/11/25.
//

import SwiftUI

@Observable @MainActor
final class EmployeesVM {
    let repository: NetworkRepository
    
    var employees: [Employee] = []
    
    init(repository: NetworkRepository = Network()) {
        self.repository = repository
    }
    
    func getEmployees() async {
        do {
            self.employees = try await repository.getEmployees()
        } catch {
            print(error)
        }
    }
}
