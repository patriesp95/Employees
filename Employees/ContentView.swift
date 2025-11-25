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
        VStack {
            switch vm.state {
                case .loading:
                    ProgressView()
                case .loaded:
                    EmployeesList(vm: vm)
                case .empty:
                    ListEmptyView()
            }
        }
        .alert("Employee Error", isPresented: $vm.showError) {} message: {
            Text(vm.errorMsg)
        }
        .task(priority: .high) {
            await vm.getEmployees()
        }
    }
    
    
}

#Preview {
    ContentView()
}
