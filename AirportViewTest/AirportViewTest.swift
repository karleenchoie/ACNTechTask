//
//  AirportViewTest.swift
//  AirportViewTest
//
//  Created by Karleen Choie Molinar on 3/24/23.
//

import XCTest
@testable import ACNTechTask

class AirportViewTest: XCTestCase {
  
    var sut: NetworkManager?

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
      try super.setUpWithError()
      sut = NetworkManager()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
      sut = nil
    }
  
  func test_fetchAirport() {
    
  }
}
