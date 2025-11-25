//
//  ListEmptyView.swift
//  Employees
//
//  Created by Patricia M Espert on 25/11/25.
//

import SwiftUI

struct ListEmptyView: View {
    var body: some View {
        ContentUnavailableView("No employee data", systemImage: "person.fill", description: Text("There's no person data yet.\nTry refreshing the data or contact support."))
    }
}

#Preview {
    ListEmptyView()
}
