//
//  AirportModel.swift
//  ACNTechTask
//
//  Created by Karleen Choie Molinar on 3/17/23.
//

import Foundation

struct AirportModel : Hashable, Identifiable, Codable {
    let id = UUID()
    let airportCode: String?
    let internationalAirport, domesticAirport, regionalAirport, onlineIndicator: Bool?
    let eticketableAirport: Bool?
    let location: Location?
    let airportName: String?
    let city: City?
    let state: State?
    let country: Country?
    let region: Region?

    init(airportCode: String?, internationalAirport: Bool?, domesticAirport: Bool?, regionalAirport: Bool?, onlineIndicator: Bool?, eticketableAirport: Bool?, location: Location?, airportName: String?, city: City?, state: State?, country: Country?, region: Region?) {
          self.airportCode = airportCode
          self.internationalAirport = internationalAirport
          self.domesticAirport = domesticAirport
          self.regionalAirport = regionalAirport
          self.onlineIndicator = onlineIndicator
          self.eticketableAirport = eticketableAirport
          self.location = location
          self.airportName = airportName
          self.city = city
          self.state = state
          self.country = country
          self.region = region
       }
    
    enum CodingKeys: String, CodingKey {
        case airportCode, internationalAirport, domesticAirport, regionalAirport, onlineIndicator, eticketableAirport, location, airportName, city, state, country, region
    }
}


