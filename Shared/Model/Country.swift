//
//  Country.swift
//  ACNTechTask
//
//  Created by Karleen Choie Molinar on 3/17/23.
//

import Foundation

struct Country : Hashable, Identifiable, Codable {
  
    let id = UUID()
    let countryCode, countryName: String?
  
    init(countryCode: String?, countryName: String?) {
        self.countryCode = countryCode
        self.countryName = countryName
    }
    
    enum CodingKeys: String, CodingKey {
        case countryCode, countryName
    }
}
