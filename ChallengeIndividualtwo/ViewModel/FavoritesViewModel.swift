//
//  FavoritesViewModel.swift
//  ChallengeIndividualtwo
//
//  Created by David Augusto on 10/02/21.
//

import UIKit
import CoreData

class FavoritesViewModel: NSObject {
    
    var databaseManager = DatabaseManager()

    private(set) var challenges: [FavoriteCardCellViewModel] = [] {
        didSet {
            DispatchQueue.main.async {
                self.bindViewModelToController()
            }
        }
    }
    
    override init() {
        super.init()
        
        fetchPhotosFromCD()
    }
    
    var bindViewModelToController : (() -> ()) = {}
    
    
    func numberOfRows() -> Int {
        let rows = self.challenges.count
        if rows == 0 {
            self.fetchPhotosFromCD()
        }
        return challenges.count
    }
    
    func fetchPhotosFromCD(){
        let challengesCD: [ChallengeModel] = databaseManager.fetchChallenges()
        if !challengesCD.isEmpty {
            for item in challengesCD {
                self.challenges.append(FavoriteCardCellViewModel(title: item.title!, photos: item.photos, photoArt: nil, favorited: item.favorited))
                
            }
            
            
        }
        
    }
    
    public func CardCellVM(forIndex index: Int) -> FavoriteCardCellViewModel {
        if index < self.challenges.count {
            return self.challenges[index]
        }
        return FavoriteCardCellViewModel(title: "", photos: nil, photoArt: nil, favorited: true)
    }
}
