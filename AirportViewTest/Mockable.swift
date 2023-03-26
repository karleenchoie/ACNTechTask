//
//  Mockable.swift
//  AirportViewTest
//
//  Created by Karleen Choie Molinar on 3/26/23.
//

import Foundation

protocol Mockable: AnyObject {
  var bundle: Bundle { get }
  func loadJSON<T: Decodable>(filename: String, type: T.Type) -> [T]
}

extension Mockable {
  var bundle: Bundle {
    return Bundle(for: type(of: self))
  }
  
  func loadJSON<T: Decodable>(filename: String, type: T.Type) -> [T] {
    guard let path = bundle.url(forResource: filename, withExtension: "json") else {
      fatalError("Failed to load JSON file")
    }
    
    do {
      let data = try Data(contentsOf: path)
      let decodedObject = try JSONDecoder().decode([T].self, from: data)
      
      return decodedObject
    } catch {
      print("😭")
      fatalError("Failed to decode Json")
    }
  }
}
