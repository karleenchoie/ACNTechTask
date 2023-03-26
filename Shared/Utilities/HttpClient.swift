//
//  HttpClient.swift
//  ACNTechTask (iOS)
//
//  Created by Karleen Choie Molinar on 3/26/23.
//

import Foundation

enum MIMEType: String {
    case JSON = "application/json"
}

enum HttpHeaders: String {
    case contentType = "Content-Type"
}

enum HttpError: Error {
    case badURL, badResponse, errorDecodingData, invalidURL
}

protocol HTTPClientProtocol {
  func fetch<T: Codable>(url: URL) async throws -> [T]
}

class HttpClient: HTTPClientProtocol {
  
    func fetch<T: Codable>(url: URL) async throws -> [T] {
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw HttpError.badResponse
        }
        
        guard let object = try? JSONDecoder().decode([T].self, from: data) else {
            throw HttpError.errorDecodingData
        }
        return object
    }
}
