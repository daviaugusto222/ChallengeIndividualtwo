//
//  DetailsViewModel.swift
//  ChallengeIndividualtwo
//
//  Created by David Augusto on 11/02/21.
//

import UIKit

class DetailsViewModel: NSObject {
    
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


    func getPhotos(challenge: FavoriteCardCellViewModel) {
        
        guard let urls = challenge.photosURL() else {return}
        for url in urls {
            let photo = ChallengeCardCellViewModel(title: challenge.titleLabel(), photo: PhotoModel(src: Src(large2X: url.absoluteString)))
            self.photos.append(photo)
        }
        
        
    }

    public func CardCellVM(forIndex index: Int) -> ChallengeCardCellViewModel {
        if index < self.photos.count {
            return self.photos[index]
        }
        return ChallengeCardCellViewModel(title: "", photo: PhotoModel(src: Src(large2X: "")))
    }
}
