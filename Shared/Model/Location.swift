//
//  Location.swift
//  ACNTechTask
//
//  Created by Karleen Choie Molinar on 3/17/23.
//

import Foundation

struct Location : Hashable, Identifiable, Codable {
    let id = UUID()
    let aboveSeaLevel: Int?
    let latitude, latitudeRadius, longitude, longitudeRadius: Double?
    let latitudeDirection, longitudeDirection: String?

    init(aboveSeaLevel: Int?, latitude: Double?, latitudeRadius: Double?, longitude: Double?, longitudeRadius: Double?, latitudeDirection: String?, longitudeDirection: String?) {
        self.aboveSeaLevel = aboveSeaLevel
        self.latitude = latitude
        self.latitudeRadius = latitudeRadius
        self.longitude = longitude
        self.longitudeRadius = longitudeRadius
        self.latitudeDirection = latitudeDirection
        self.longitudeDirection = longitudeDirection
    }
    
    enum CodingKeys: String, CodingKey {
        case aboveSeaLevel, latitude, latitudeRadius, longitude, longitudeRadius, latitudeDirection, longitudeDirection
    }
}
