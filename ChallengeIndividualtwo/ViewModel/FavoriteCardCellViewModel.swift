//
//  FavoriteCardCellViewModel.swift
//  ChallengeIndividualtwo
//
//  Created by David Augusto on 10/02/21.
//

import UIKit

class FavoriteCardCellViewModel: NSObject {
    private let title: String
    private let photos: [PhotoModel]?
    private let photoArt: UIImage?
    private let favorited: Bool
    
    init(title: String, photos: [PhotoModel]?, photoArt: UIImage?, favorited: Bool) {
        self.title = title
        self.photos = photos
        self.photoArt = photoArt
        self.favorited = favorited
    }
    
    public func titleLabel() -> String {
        return  self.title
    }
    
    public func photosURL() -> [URL]? {
        guard let photos = photos else { return nil }
        var urlPhotos: [URL] = []
        for photo in photos {
            urlPhotos.append(URL(string: photo.src.large2X)!)
        }
        return urlPhotos
    }
}
