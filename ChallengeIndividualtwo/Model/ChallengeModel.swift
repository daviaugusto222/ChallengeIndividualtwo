//
//  ChallengeModel.swift
//  ChallengeIndividualtwo
//
//  Created by David Augusto on 08/02/21.
//

import Foundation

public class ChallengeModel {
    
    let idChallenge: Double
    let title: String
    let image: URL
    
    init(idChallenge: Double, title: String, image: URL) {
        self.idChallenge = idChallenge
        self.title = title
        self.image = image
    }
}
