//
//  FavoriteViewModelTests.swift
//  ChallengeIndividualtwoTests
//
//  Created by David Augusto on 11/02/21.
//

import XCTest
@testable import ChallengeIndividualtwo

class FavoriteViewModelTests: XCTestCase {
    
    var favoritesViewModel: FavoritesViewModel!
    var challenge: FavoriteCardCellViewModel!

    override func setUpWithError() throws {
        favoritesViewModel = FavoritesViewModel()
         challenge = FavoriteCardCellViewModel(title: "", photos: nil, photoArt: nil, favorited: true)
        
        //favoritesViewModel.challenges.append(challenge)
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testNumberOfRows() throws {
        let numberOfRows = 3 //Quantidade de favoritos no mock
        
        XCTAssertEqual(favoritesViewModel.numberOfRows(), numberOfRows)
    }
    
    func testNumberOfRowsEqualZero() throws {
        let numberOfRows = 0
        
        XCTAssertEqual(favoritesViewModel.numberOfRows(), numberOfRows)
    }
    
    func testChangesChallenges() throws {
        favoritesViewModel.fetchPhotosFromCD()
        let expectedCount = 1
        XCTAssertGreaterThanOrEqual(favoritesViewModel.challenges.count, expectedCount)
    }
    
    func testQuantityFavorite() throws {
//        let expectedCount = 0
//        let challengesCount = favoritesViewModel.challenges.count
//        XCTAssertEqual(challengesCount, expectedCount)
    }
    
    func testCardCellReturnNil() throws {
        
        let challengeCell = favoritesViewModel.cardCellVM(forIndex: -1)
        
        XCTAssertEqual(challengeCell.titleLabel(), challenge.titleLabel())
    }
    
    func testCardCellReturn() throws {
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
