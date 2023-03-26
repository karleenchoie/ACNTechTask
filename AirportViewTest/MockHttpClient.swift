//
//  MockHttpClient.swift
//  AirportViewTest
//
//  Created by Karleen Choie Molinar on 3/26/23.
//

import Foundation
@testable import ACNTechTask

final class MockHttpClient: HTTPClientProtocol, Mockable {
  
  func fetch<T>(url: URL) async throws -> [T] where T : Decodable, T : Encodable {
    return loadJSON(filename: "AirportResponse", type: T.self)
  }
  
}
