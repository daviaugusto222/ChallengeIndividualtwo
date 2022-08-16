//
//  FavoriteCardCellViewModel.swift
//  ChallengeIndividualtwo
//
//  Created by David Augusto on 10/02/21.
//

import UIKit

class FavoriteCardCellViewModel: NSObject {
    private let title: String
    private let photos: [PhotoChallengeModel]?
    private let photoArt: UIImage?
    private let favorited: Bool
    
    init(title: String, photos: [PhotoChallengeModel]?, photoArt: UIImage?, favorited: Bool) {
        self.title = title
        self.photos = photos
        self.photoArt = photoArt
        self.favorited = favorited
    }
    
    public func titleLabel() -> String {
        return  self.title
    }
    
    public func getPhotos() -> [PhotoChallengeModel] {
        guard let photos = self.photos else { return [] }
        return photos
    }
    
    public func photosURL() -> [URL]? {
        guard let photos = photos else { return nil }
        var urlPhotos: [URL] = []
        for photo in photos {
            if let url = photo.linkPhoto {
                urlPhotos.append(url)
            }
        }
        return urlPhotos
    }
    
}
