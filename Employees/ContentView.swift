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
            List(vm.employees) { employee in
                HStack {
                    VStack(alignment: .leading){
                        Text(employee.fullName)
                            .font(.headline)
                        Text(employee.email)
                            .font(.footnote)
                            .foregroundStyle(.secondary)
                        Text(employee.username)
                            .font(.caption)
                    }
                }
            }
            .navigationTitle("Employees")
            .alert("Employee Error", isPresented: $vm.showError) {} message: {
                Text(vm.errorMsg)
            }
            .overlay {
                if vm.noData {
                    ContentUnavailableView("No employee data", systemImage: "person.fill", description: Text("No employees found"))
                }
            }
        }
        .task(priority: .high){
            await vm.getEmployees()
        }
    }
}

#Preview {
    ContentView()
}
