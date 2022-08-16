//
//  DetailsViewModel.swift
//  ChallengeIndividualtwo
//
//  Created by David Augusto on 11/02/21.
//

import UIKit

class DetailsViewModel: NSObject {
    
    var databaseManager = DatabaseManager.shared

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

    func artAdded() -> Bool {
        return true
    }

    func getPhotos(challenge: FavoriteCardCellViewModel) {
        let photos = challenge.getPhotos()
        for photo in photos {
            let photo = ChallengeCardCellViewModel(title: challenge.titleLabel(), photo: photo)
            self.photos.append(photo)
        }
        
    }

    public func cardCellVM(forIndex index: Int) -> ChallengeCardCellViewModel {
        if index < self.photos.count {
            return self.photos[index]
        }
        return ChallengeCardCellViewModel(title: "", photo: PhotoChallengeModel(titlePhoto: "", linkPhoto: URL(string: "")!))
    }
}
