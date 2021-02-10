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
    private let background: String
    
    init(title: String, photo: PhotoModel?, background: String) {
        self.title = title
        self.photo = photo
        self.background = background
    }
    
    public func titleLabel() -> String {
        return self.title
    }
    
    public func photoURL() -> URL? {
        guard let imgURL = photo?.src.large2X else { return URL(string: "") }
        return URL(string: imgURL)
    }
    
    public func backgroundColor() -> String {
        return self.background
    }
}
