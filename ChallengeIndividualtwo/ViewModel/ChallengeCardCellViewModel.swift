//
//  ChallengeCardCellViewModel.swift
//  ChallengeIndividualtwo
//
//  Created by David Augusto on 09/02/21.
//

import Foundation

public class ChallengeCardCellViewModel: NSObject {
    private let title: String
    private let photo: PhotoModel?
    
    init(title: String, photo: PhotoModel?) {
        self.title = title
        self.photo = photo
    }
    
    public func titleLabel() -> String {
        return self.title
    }
    
    public func photoURL() -> URL? {
        guard let imgURL = photo?.src.large2X else { return URL(string: "") }
        return URL(string: imgURL)
    }
}
