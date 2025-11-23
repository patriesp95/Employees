//
//  NetworkInteractor.swift
//  Employees
//
//  Created by Patricia M Espert on 23/11/25.
//

import Foundation

protocol NetworkInteractor {}

extension NetworkInteractor {
    func getJSON<JSON>(_ request: URLRequest, type: JSON.Type) async throws(NetworkError) -> JSON where JSON: Codable {
        let (data, httpResponse) = try await URLSession.shared.getData(for: request)
        if httpResponse.statusCode == 200 {
            do {
                return try JSONDecoder().decode(type, from: data)
            } catch {
                throw NetworkError.json(error)
            }
        } else {
            throw NetworkError.status(httpResponse.statusCode)
        }
    }
}
