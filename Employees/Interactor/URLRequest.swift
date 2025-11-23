//
//  URLRequest.swift
//  Employees
//
//  Created by Patricia M Espert on 23/11/25.
//


import Foundation

extension URLRequest {
    static func get(url: URL) -> URLRequest {
        var request = URLRequest(url: url)
        request.timeoutInterval = 60
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        //request.setValue("Bearer lajsdñkajsdñlkjasdñlkjasñdlkj", forHTTPHeaderField: "Authorization")
        return request
    }
}
