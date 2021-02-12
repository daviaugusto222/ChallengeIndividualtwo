//
//  ChallengeCardCellViewModel.swift
//  ChallengeIndividualtwo
//
//  Created by David Augusto on 09/02/21.
//

import Foundation

public class ChallengeCardCellViewModel: NSObject {
    private let title: String
    private let photo: PhotoChallengeModel?
    
    init(title: String, photo: PhotoChallengeModel?) {
        self.title = title
        self.photo = photo
    }
    
    public func titleLabel() -> String {
        return self.title
    }
    
    public func titlePhoto() -> String? {
        guard let titlePhoto = photo?.titlePhoto else { return "" }
        return titlePhoto
    }
    
    public func photoURL() -> URL? {
        guard let imgURL = photo?.linkPhoto else { return URL(string: "") }
        return imgURL
    }
}
