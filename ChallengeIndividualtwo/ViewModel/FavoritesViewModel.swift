//
//  FavoritesViewModel.swift
//  ChallengeIndividualtwo
//
//  Created by David Augusto on 10/02/21.
//

import UIKit
import CoreData

class FavoritesViewModel: NSObject {
    
    private var databaseManager: DatabaseManager!

    private(set) var challenges: [FavoriteCardCellViewModel] = [] {
        didSet {
            DispatchQueue.main.async {
                self.bindViewModelToController()
            }
        }
    }
    
    init(_ type: StorageType = .persistent) {
        super.init()
        switch type {
        case .inMemory:
            databaseManager = DatabaseManager.inMemory
        default:
            databaseManager = DatabaseManager.shared
        }
        fetchPhotosFromCD()
    }
    
    var bindViewModelToController : (() -> ()) = {}
    
    func numberOfRows() -> Int {
        return challenges.count
    }
    
    func fetchPhotosFromCD() {
        let challengesCD: [ChallengeModel] = databaseManager.fetchChallenges()
        if !challengesCD.isEmpty {
            for item in challengesCD {
               
                self.challenges.append(FavoriteCardCellViewModel(title: item.title!, photos: item.photos, photoArt: nil, favorited: item.favorited))
            }
        }
    }
    
    public func cardCellVM(forIndex index: Int) -> FavoriteCardCellViewModel {
        if index < self.challenges.count && index >= 0 {
            return self.challenges[index]
        }
        return FavoriteCardCellViewModel(title: "", photos: nil, photoArt: nil, favorited: true)
    }
}
