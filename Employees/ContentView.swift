//
//  ContentView.swift
//  Employees
//
//  Created by Patricia M Espert on 22/11/25.
//

import SwiftUI

struct ContentView: View {
    @State private var vm = EmployeesVM()
    
    var body: some View {
        NavigationStack {
            VStack {
                if !vm.employees.isEmpty {
                    List(vm.employees) { employee in
                        Text(employee.email)
                    }
                } else {
                    ContentUnavailableView("No employee data", systemImage: "person.fill", description: Text("No employees found"))
                }
            }
            .navigationTitle("Employees")
            
        }
        .task(priority: .high){
            await vm.getEmployees()
        }
    }
}

#Preview {
    ContentView()
}
