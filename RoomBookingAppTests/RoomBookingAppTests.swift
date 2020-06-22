//
//  RoomBookingAppTests.swift
//  RoomBookingAppTests
//
//  Created by Dadha Kumar on 19/6/20.
//  Copyright © 2020 Dadha Kumar. All rights reserved.
//

import XCTest
@testable import RoomBookingApp

class RoomBookingAppTests: XCTestCase {

    let apiManager = ApiManager()
    
    let webView = RoomBookingWebView()
    
    let roomBookingVC = RoomBookingVC()
    
    func testFetchRoomsDetailsList() {
        apiManager.fetchRoomsDetailsList(serviceUrl: ServiceApiKeys.serviceUrl) { (roomDetails, error) in
            XCTAssertNil(error)
            guard let roomDetailsFetched = roomDetails else {
                XCTFail()
                return
            }
            do {
                let jsonData = try JSONSerialization.data(withJSONObject: roomDetailsFetched, options: [])
                let roomDetailsDecoded = try JSONDecoder().decode([RoomDetails].self, from: jsonData)
                XCTAssertNotNil(roomDetailsDecoded)
            } catch {
                XCTFail(error.localizedDescription)
            }
        }
    }
            
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
