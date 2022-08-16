//
//  FavoriteCellViewModelTests.swift
//  ChallengeIndividualtwoTests
//
//  Created by David Augusto on 11/02/21.
//

import XCTest
@testable import ChallengeIndividualtwo

class FavoriteCellViewModelTests: XCTestCase {

    var favoriteCellViewModel: FavoriteCardCellViewModel!
    var photos: [PhotoChallengeModel]!
    
    override func setUpWithError() throws {
        
        favoriteCellViewModel = FavoriteCardCellViewModel(title: "Title Card", photos: nil, photoArt: nil, favorited: false)
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        photos = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPhotosUrl() throws {
        photos = [PhotoChallengeModel(titlePhoto: "Essa Pose", linkPhoto: URL(string: "https://images.pexels.com/photos/2014422/pexels-photo-2014422.jpeg"))]
        favoriteCellViewModel = FavoriteCardCellViewModel(title: "", photos: photos, photoArt: nil, favorited: false)
        let expectedUrl = "https://images.pexels.com/photos/2014422/pexels-photo-2014422.jpeg"
        let urls = favoriteCellViewModel.photosURL()
        
        XCTAssertEqual(urls?.first?.absoluteString, expectedUrl)
    }
    
    func testPhotosUrlNil() throws {
       
        XCTAssertNil(favoriteCellViewModel.photosURL())
    }
    
    func testTitleReturn() throws {
        let title = "Title Card"
        XCTAssertEqual(favoriteCellViewModel.titleLabel(), title)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
