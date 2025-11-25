//
//  EmployeesList.swift
//  Employees
//
//  Created by Patricia M Espert on 25/11/25.
//

import SwiftUI

struct EmployeesList: View {
    @Bindable var vm: EmployeesVM
    
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
        }
    }
}

#Preview {
    @Previewable @State var vm = EmployeesVM(repository: NetworkTest())
    EmployeesList(vm: vm)
        .task {
            await vm.getEmployees()
        }
}
