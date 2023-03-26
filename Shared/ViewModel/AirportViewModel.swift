//
//  AirportViewModel.swift
//  ACNTechTask
//
//  Created by Karleen Choie Molinar on 3/17/23.
//

import SwiftUI

class AirportViewModel: ObservableObject {
  @Published var airports = [AirportModel]()
  @Published private(set) var isRefreshing = false
  
  var httpClient: HTTPClientProtocol!
  
  init(httpClient: HTTPClientProtocol) {
    self.httpClient = httpClient
  }
  
  func fetchAirport() async throws {
    isRefreshing = true
      
    let urlString = Constants.baseURL
      
    guard let url = URL(string: urlString) else {
      throw HttpError.badURL
    }
        
    let airportResponse: [AirportModel] = try await httpClient.fetch(url: url)
      
    DispatchQueue.main.async {
      self.airports = airportResponse
      self.isRefreshing = false
    }
  }
}
