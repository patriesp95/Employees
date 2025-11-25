//
//  Model.swift
//  Employee
//
//  Created by Patricia M Espert on 23/11/25.
//

import Foundation

struct Employee: Codable, Identifiable {
    let id: Int
    let firstName: String
    let lastName: String
    let email: String
    let username: String
    let avatar: URL?
    let address: String
    let zipcode: String
    let department: Department
    let gender: Gender
}

enum Department: String, Codable {
    case accounting = "Accounting"
    case businessDevelopment = "Business Development"
    case engineering = "Engineering"
    case humanResources = "Human Resources"
    case legal = "Legal"
    case marketing = "Marketing"
    case productManagement = "Product Management"
    case researchAndDevelopment = "Research and Development"
    case sales = "Sales"
    case services = "Services"
    case support = "Support"
    case training = "Training"
    case unknown = "Unknown"
}

enum Gender: String, Codable {
    case male = "Male"
    case female = "Female"
    case undertermined = "Undertermined"
}

extension Employee {
    var fullName: String {
        "\(lastName), \(firstName)"
    }
}

extension Employee {
    static let employeeTest: Employee =
    Employee(
        id: 3,
        firstName: "Patricia",
        lastName: "Martinez Espert",
        email: "patri@example.com",
        username: "patrie",
        avatar: URL(filePath: "https://randomuser.me/api/portraits/women/2.jpg"),
        address: "78 Market Road",
        zipcode: "20001",
        department: .businessDevelopment,
        gender: .female
    )
}
