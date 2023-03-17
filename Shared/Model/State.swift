//
//  State.swift
//  ACNTechTask
//
//  Created by Karleen Choie Molinar on 3/17/23.
//

import Foundation

struct State : Hashable, Identifiable, Codable {
  
    let id = UUID()
    let stateCode, stateName: String?
  
    init(stateCode: String?, stateName: String?) {
        self.stateCode = stateCode
        self.stateName = stateName
    }
    
    enum CodingKeys: String, CodingKey {
        case stateCode, stateName
    }
}
