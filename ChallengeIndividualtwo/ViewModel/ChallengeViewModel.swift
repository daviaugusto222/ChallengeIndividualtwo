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
            //title.append(photo.titleLabel() + ".")
            
            newChallenge.addToPhotos(newPhoto)
        }
        
        let components = Calendar.current.dateComponents([.day, .month, .year], from: Date())
        let day = components.day ?? 0
        let month = components.month ?? 0
//        let year = components.year ?? 0
//        let date = Calendar.current.date(from: components) ?? Date()
        title.append("\(day)/\(month)")
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
            let cell = ChallengeCardCellViewModel(title: ServiceApi.person.description, photo: PhotoChallengeModel(titlePhoto: ServiceApi.person.description, linkPhoto: URL(string: (photoPerson?.src.large2X)!) ))
            self.photos.append(cell)
            
        }
        self.apiService.searchPhoto(type: .pose, page: page) { (photoPose) in
            let cell = ChallengeCardCellViewModel(title: ServiceApi.pose.description, photo: PhotoChallengeModel(titlePhoto: ServiceApi.pose.description, linkPhoto: URL(string: (photoPose?.src.large2X)!) ))
            self.photos.append(cell)
            
        }
        self.apiService.searchPhoto(type: .scenery, page: page) { (photoScenery) in
            let cell = ChallengeCardCellViewModel(title: ServiceApi.scenery.description, photo: PhotoChallengeModel(titlePhoto: ServiceApi.scenery.description, linkPhoto: URL(string: (photoScenery?.src.large2X)!) ))
            self.photos.append(cell)
            
        }
        
    }
    
    public func cardCellVM(forIndex index: Int) -> ChallengeCardCellViewModel {
        if index < self.photos.count {
            return self.photos[index]
        }
        return ChallengeCardCellViewModel(title: "", photo: PhotoChallengeModel(titlePhoto: "", linkPhoto: URL(string: "") ?? nil))
    }
    
}
