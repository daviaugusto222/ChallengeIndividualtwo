//
//  ChallengeViewModel.swift
//  ChallengeIndividualtwo
//
//  Created by David Augusto on 08/02/21.
//

import Foundation
import CoreData

class ChallengeViewModel: NSObject {
    
    private var apiService: CategoryRepository!
    private var databaseManager = DatabaseManager.shared
    
    private(set) var photos: [ChallengeCardCellViewModel] = [] {
        didSet {
            DispatchQueue.main.async {
                self.bindViewModelToController()
            }
        }
    }
    
    override init() {
        super.init()
        self.apiService = CategoryRepository()
        searchPhotos()
    }
    
    var bindViewModelToController : (() -> ()) = {}
    
    func numberOfRows() -> Int {
        return 3
    }
    
    func favoritedChallenge() {
        
        databaseManager.saveFavorites(photos: photos)
        
    }
    
    func createNewCombination() -> Int {
        let randomInt = Int.random(in: 1..<1000)
        return randomInt
    }
    
    func searchPhotos() {
        
        self.photos = []
        let page = createNewCombination()
        self.apiService.searchPhoto(type: .person, page: page) { (photoPerson) in
            if let photoPerson = photoPerson {
                let cell = ChallengeCardCellViewModel(title: ServiceApi.person.description, photo: PhotoChallengeModel(titlePhoto: ServiceApi.person.description, linkPhoto: URL(string: photoPerson.src.large2X) ))
                self.photos.append(cell)
            }
            
        }
        self.apiService.searchPhoto(type: .pose, page: page) { (photoPose) in
            if let photoPose = photoPose {
                let cell = ChallengeCardCellViewModel(title: ServiceApi.pose.description, photo: PhotoChallengeModel(titlePhoto: ServiceApi.pose.description, linkPhoto: URL(string: photoPose.src.large2X) ))
                self.photos.append(cell)
            }
            
        }
        self.apiService.searchPhoto(type: .scenery, page: page) { (photoScenery) in
            if let photoScenery = photoScenery {
                let cell = ChallengeCardCellViewModel(title: ServiceApi.scenery.description, photo: PhotoChallengeModel(titlePhoto: ServiceApi.scenery.description, linkPhoto: URL(string: photoScenery.src.large2X) ))
                self.photos.append(cell)
            }
            
        }
        
    }
    
    public func cardCellVM(forIndex index: Int) -> ChallengeCardCellViewModel {
        if index < self.photos.count {
            return self.photos[index]
        }
        return ChallengeCardCellViewModel(title: "", photo: PhotoChallengeModel(titlePhoto: "", linkPhoto: URL(string: "") ?? nil))
    }
    
}
