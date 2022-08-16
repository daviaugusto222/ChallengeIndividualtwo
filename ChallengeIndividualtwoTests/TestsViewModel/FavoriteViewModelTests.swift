//
//  FavoriteViewModelTests.swift
//  ChallengeIndividualtwoTests
//
//  Created by David Augusto on 11/02/21.
//

import XCTest
@testable import ChallengeIndividualtwo

class FavoriteViewModelTests: XCTestCase {
    
    var databaseManager: DatabaseManager!
    var favoritesViewModel: FavoritesViewModel!
    
    override func setUp() {
        super.setUp()
        
        databaseManager = DatabaseManager.inMemory
        
        let photo = PhotoChallengeModel(titlePhoto: "Essa pose", linkPhoto: URL(string: "https://images.pexels.com/photos/3236733/pexels-photo-3236733.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"))
        
        let photo1 = ChallengeCardCellViewModel(title: "Essa pose", photo: photo)
        let photo2 = ChallengeCardCellViewModel(title: "Essa paisagem", photo: photo)
        let photo3 = ChallengeCardCellViewModel(title: "Essa pessoa", photo: photo)
        
        //databaseManager.saveFavorites(photos: [photo1, photo2, photo3])
        
        favoritesViewModel = FavoritesViewModel(.inMemory)
    }

    override func tearDownWithError() throws {
        favoritesViewModel = nil
    }
    
    func testNumberOfRows() throws {

        //favoritesViewModel.fetchPhotosFromCD()
        let numberOfRows = 0 //Quantidade de favoritos no mock
        
        XCTAssertEqual(favoritesViewModel.numberOfRows(), numberOfRows)
    }
    
//    func testChangesChallenges() throws {
//        favoritesViewModel.fetchPhotosFromCD()
//        let expectedCount = 1
//        XCTAssertGreaterThanOrEqual(favoritesViewModel.challenges.count, expectedCount)
//    }
    
    func testQuantityFavorite() throws {
//        let expectedCount = 0
//        let challengesCount = favoritesViewModel.challenges.count
//        XCTAssertEqual(challengesCount, expectedCount)
    }
    
    func testCardCellReturnNil() throws {
        
        let challengeCell = favoritesViewModel.cardCellVM(forIndex: -1)
        
        XCTAssertEqual(challengeCell.titleLabel(), "")
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
