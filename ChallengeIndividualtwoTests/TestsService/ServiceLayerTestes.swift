//
//  ServiceLayerTestes.swift
//  ChallengeIndividualtwoTests
//
//  Created by David Augusto on 11/02/21.
//

import XCTest
@testable import ChallengeIndividualtwo

class ServiceLayerTestes: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

//    func test_ServiceLayer_url_toBeValid() throws {
//        //givin
//        let url = URL(string: "https://api.pexels.com/v1")
//        
//        let session = URLSessionMock()
//        
//        let expect = expectation(description: "getting photos")
//        let authorization = ["Authorization":"563492ad6f917000010000018754273bf6504bf382c28922c6077b48"]
//        HTTP.get.request(url: url, header: authorization) { data, response, error in
//            XCTAssertEqual(url, session.lastURL)
//        }
//        
//        wait(for: [expect], timeout: 5)
//        
//    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
