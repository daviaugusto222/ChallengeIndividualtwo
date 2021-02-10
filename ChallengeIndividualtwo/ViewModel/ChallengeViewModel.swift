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
    var user: User?
    var chalenge: Challenge?
    var databaseManager = DatabaseManager()
    
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
        self.user = databaseManager.getUser()
        
        searchPhotos()
//        fetchPhotosFromCD()
        
    }
    
//    func fetchPhotosFromCD(){
//        let photos: [PhotoModel] = databaseManager.fetchPhotos()
//        if !photos.isEmpty {
//            for photo in photos {
//                self.photos.append(ChallengeCardCellViewModel(title: photo.photographer, photo: photo, background: ""))
//            }
//        }
//
//    }
    
    var bindViewModelToController : (() -> ()) = {}
    
    func numberOfRows() -> Int {
        return 4
    }
    
    func artAdded() -> Bool {
        return true
    }
    
    func createNewCombination() -> Int {
        let randomInt = Int.random(in: 1..<1000)
        return randomInt
    }
    
    func searchPhotos() {
       
        let _ = databaseManager.fetchPhotos()
        self.photos = []
        let page = createNewCombination()
        self.apiService.searchPhotos(type: .person ,page: page){ (photoPerson) in
            let cell = ChallengeCardCellViewModel(title: ServiceApi.person.description, photo: photoPerson!, background: photoPerson!.avgColor)
            self.photos.append(cell)
            
        }
        self.apiService.searchPhotos(type: .pose, page: page){ (photoPose) in
            let cell = ChallengeCardCellViewModel(title: ServiceApi.pose.description, photo: photoPose!, background: photoPose!.avgColor)
            self.photos.append(cell)
            
        }
        self.apiService.searchPhotos(type: .scenery, page: page){ (photoScenery) in
            let cell = ChallengeCardCellViewModel(title: ServiceApi.scenery.description, photo: photoScenery!, background: photoScenery!.avgColor)
            self.photos.append(cell)
            
        }
        
        
//        if !photos.isEmpty {
//            let newPhoto = Photo(context: DatabaseManager.persistentContainer.viewContext)
//            newPhoto.photographer = "Foto salva 1"//photos[0].titleLabel()
//            newPhoto.avgColor = photos[0].backgroundColor()
//            newPhoto.src = photos[0].photoURL()?.absoluteString
//
//            let newPhotoPose = Photo(context: DatabaseManager.persistentContainer.viewContext)
//            newPhotoPose.photographer = "Foto salva 2"//photos[0].titleLabel()
//            newPhotoPose.avgColor = photos[1].backgroundColor()
//            newPhotoPose.src = photos[1].photoURL()?.absoluteString
//
//            let newPhotoScenery = Photo(context: DatabaseManager.persistentContainer.viewContext)
//            newPhotoScenery.photographer = "Foto salva 3"//photos[0].titleLabel()
//            newPhotoScenery.avgColor = photos[2].backgroundColor()
//            newPhotoScenery.src = photos[2].photoURL()?.absoluteString
//
//
//
//            chalenge?.addToPhotos(newPhoto)
//            chalenge?.addToPhotos(newPhotoPose)
//            chalenge?.addToPhotos(newPhotoScenery)
//
//            databaseManager.saveContext()
//        }
        
        
        
    }
    
    public func CardCellVM(forIndex index: Int) -> ChallengeCardCellViewModel {
        if index < self.photos.count {
            return self.photos[index]
        }
        return ChallengeCardCellViewModel(title: "", photo: nil, background: "")
    }
    
}
