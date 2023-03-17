//
//  AirportViewModel.swift
//  ACNTechTask
//
//  Created by Karleen Choie Molinar on 3/17/23.
//

import Foundation

final class AirportViewModel: ObservableObject {
  
  @Published var datas = [AirportModel]()
  @Published var hasError = false
  @Published var error: AirportError?
  @Published private(set) var isRefreshing = false
  
  init() {
    fetchAirport()
  }
  
  func fetchAirport() {
    
    isRefreshing = true
    hasError = false
    
    let airportUrlString = "https://api.qantas.com/flight/refData/airport"
    
    if let url = URL(string: airportUrlString) {
      URLSession
        .shared
        .dataTask(with: url) { [weak self] data, response, error in
          
          DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            
            if let error = error {
              self?.hasError = true
              self?.error = AirportError.custom(error: error)
            } else {
              
              let decoder = JSONDecoder()
              decoder.keyDecodingStrategy = .convertFromSnakeCase // airport_name > airportname
              
              if let data = data {
                  do {
                      let results = try JSONDecoder().decode([AirportModel].self, from: data)
                      DispatchQueue.main.async {
                        self?.datas = results
                      }
                  }
                  catch {
                      print(error)
                  }
              } else {
                self?.hasError = true
                self?.error = AirportError.failedToDecode
              }
            }
            
            self?.isRefreshing = false
          }
          // TODO: Handle returning data on Main thread
        }.resume()
    }
  }
}

extension AirportViewModel {
  enum AirportError : LocalizedError {
    case custom(error: Error)
    case failedToDecode
    
    var errorDescription: String? {
      switch self {
      case .failedToDecode:
        return "Failed to get response"
      case .custom(let error):
        return error.localizedDescription
      }
    }
  }
}

