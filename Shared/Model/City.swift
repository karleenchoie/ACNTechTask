//
//  City.swift
//  ACNTechTask
//
//  Created by Karleen Choie Molinar on 3/17/23.
//

import Foundation

struct City : Hashable, Identifiable, Codable {
  
    let id = UUID()
    let cityCode, cityName, timeZoneName: String?

    init(cityCode: String?, cityName: String?, timeZoneName: String?) {
      self.cityCode = cityCode
      self.cityName = cityName
      self.timeZoneName = timeZoneName
  }
    
    enum CodingKeys: String, CodingKey {
        case cityCode, cityName, timeZoneName
    }
}
