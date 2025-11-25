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
