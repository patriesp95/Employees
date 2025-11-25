//
//  Untitled.swift
//  Employees
//
//  Created by Patricia M Espert on 24/11/25.
//

import SwiftUI

enum ViewState {
    case loading
    case loaded
    case empty
}

@Observable @MainActor
final class EmployeesVM {
    let repository: NetworkRepository
    
    var employees: [Employee] = []
    
    var state: ViewState = .loading
    var showError  = false
    var errorMsg = ""
    

    
    init(repository: NetworkRepository = Network()) {
        self.repository = repository
    }
    
    func getEmployees() async {
        do {
            self.employees = try await repository.getEmployees()
            state = .loaded
        } catch {
            errorMsg = error.localizedDescription
            showError.toggle()
        }
        
        if employees.isEmpty {
            state = .empty
        }
    }
}
