//
//  AirportListViewModelTests.swift
//  AirportViewTest
//
//  Created by Karleen Choie Molinar on 3/26/23.
//

import Combine
import XCTest
@testable import ACNTechTask

class AirportListViewModelTests: XCTestCase {
  
  var airportListVM: AirportViewModel!
  private var cancellables: Set<AnyCancellable>!
  
  override func setUp() {
    super.setUp()
    airportListVM = AirportViewModel(httpClient: MockHttpClient())
    cancellables = []
  }

  override func tearDown() {
    super.tearDown()
    airportListVM = nil
  }
  
  func testFetchAirportSuccessfully() async throws {
    
    let expectation = XCTestExpectation(description: "Fetched Airports")
    
    try await airportListVM.fetchAirport()
    
    airportListVM
      .$airports
      .dropFirst()
      .sink { value in
        XCTAssertEqual(value.count, 1)
        expectation.fulfill()
      }
      .store(in: &cancellables)
    
    wait(for: [expectation], timeout: 1)
  }
}
