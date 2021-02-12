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
    var databaseManager = DatabaseManager()
    
    var user: User?
    
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
        user = databaseManager.getUser()
        searchPhotos()
    }
    
    var bindViewModelToController : (() -> ()) = {}
    
    func numberOfRows() -> Int {
        return 3
    }
    
    func favoritedChallenge() {
        
        let context = DatabaseManager.persistentContainer.viewContext
        var title = ""
        let newChallenge = Challenge(context: context)
        newChallenge.favorited = true
        
        for photo in photos {
            let newPhoto = Photo(context: context)
            newPhoto.src = photo.photoURL()?.absoluteString
            newPhoto.title = photo.titleLabel()
            title.append("." + photo.titleLabel())
            
            newChallenge.addToPhotos(newPhoto)
        }
        
        newChallenge.title = title
        
        user?.addToChallengers(newChallenge)
        
        databaseManager.saveContext()
    }
    
    func createNewCombination() -> Int {
        let randomInt = Int.random(in: 1..<1000)
        return randomInt
    }
    
    func searchPhotos() {
       
        self.photos = []
        let page = createNewCombination()
        self.apiService.searchPhoto(type: .person, page: page) { (photoPerson) in
            let cell = ChallengeCardCellViewModel(title: ServiceApi.person.description, photo: photoPerson!)
            self.photos.append(cell)
            
        }
        self.apiService.searchPhoto(type: .pose, page: page) { (photoPose) in
            let cell = ChallengeCardCellViewModel(title: ServiceApi.pose.description, photo: photoPose!)
            self.photos.append(cell)
            
        }
        self.apiService.searchPhoto(type: .scenery, page: page) { (photoScenery) in
            let cell = ChallengeCardCellViewModel(title: ServiceApi.scenery.description, photo: photoScenery!)
            self.photos.append(cell)
            
        }
        
    }
    
    public func cardCellVM(forIndex index: Int) -> ChallengeCardCellViewModel {
        if index < self.photos.count {
            return self.photos[index]
        }
        return ChallengeCardCellViewModel(title: "", photo: PhotoModel(src: Src(large2X: "")))
    }
    
}
