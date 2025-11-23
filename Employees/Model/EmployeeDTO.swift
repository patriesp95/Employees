//
//  Model.swift
//  EmployeesDTO
//
//  Created by Patricia M Espert on 22/11/25.
//

import Foundation

struct EmployeeDTO: Codable {
    let id: Int
    let firstName: String
    let lastName: String
    let email: String
    let username: String
    let avatar: String
    let address: String
    let zipcode: String
    let department: DepartmentDTO
    let gender: GenderDTO
    
    struct DepartmentDTO: Codable {
        let name: String
        let id: Int
    }
    
    struct GenderDTO: Codable {
        let gender: String
        let id: Int
    }
}

extension EmployeeDTO {
    var toEmployee: Employee {
        Employee(
            id: id,
            firstName: firstName,
            lastName: lastName,
            email: email,
            username: username,
            avatar: URL(string: avatar),
            address: address,
            zipcode: zipcode,
            department: Department(rawValue: department.name) ?? .unknown,
            gender: Gender(rawValue: gender.gender) ?? .undertermined
        )}
}

