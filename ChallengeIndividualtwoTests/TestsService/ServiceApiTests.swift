//
//  ServiceApi.swift
//  ChallengeIndividualtwoTests
//
//  Created by David Augusto on 11/02/21.
//

import XCTest
@testable import ChallengeIndividualtwo

class ServiceApiTests: XCTestCase {
    
    var service: ServiceApi!
    
    override func setUp() {
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        service = nil
    }

    func testDescriptionPerson() throws {
        let expectedPerson = "Essa pessoa"
        service = .person
        let descriptionPerson = service.description
        
        XCTAssertEqual(descriptionPerson, expectedPerson)
    }
    
    func testDescriptionPose() throws {
        let expectedPose = "Essa pose"
        service = .pose
        let descriptionPose = service.description
        
        XCTAssertEqual(descriptionPose, expectedPose)
    }
    
    func testDescriptionScenery() throws {
        let expectedScenery = "Essa paisagem"
        service = .scenery
        let descriptionScenery = service.description
        
        XCTAssertEqual(descriptionScenery, expectedScenery)
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
