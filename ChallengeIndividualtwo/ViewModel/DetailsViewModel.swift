//
//  DetailsViewModel.swift
//  ChallengeIndividualtwo
//
//  Created by David Augusto on 11/02/21.
//

import UIKit

class DetailsViewModel: NSObject {
    

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
    }

    var bindViewModelToController : (() -> ()) = {}

    func numberOfRows() -> Int {
        return 3
    }

    func favoreted() -> Bool {
        return true
    }
//
//    func favoritedChallenge() {
//
//        //Detelar do coredata
//
//    }
//
    func artAdded() -> Bool {
        return true
    }


    func getPhotos() {

        self.photos = []
        


    }

    public func CardCellVM(forIndex index: Int) -> ChallengeCardCellViewModel {
        if index < self.photos.count {
            return self.photos[index]
        }
        return ChallengeCardCellViewModel(title: "", photo: PhotoModel(src: Src(large2X: "")))
    }
}
