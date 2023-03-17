//
//  Region.swift
//  ACNTechTask
//
//  Created by Karleen Choie Molinar on 3/17/23.
//

import Foundation

struct Region : Hashable, Identifiable, Codable {
  
    let id = UUID()
    let regionCode, regionName: String?
  
    init(regionCode: String?, regionName: String?) {
          self.regionCode = regionCode
          self.regionName = regionName
    }
    
    enum CodingKeys: String, CodingKey {
        case regionCode, regionName
    }
}
