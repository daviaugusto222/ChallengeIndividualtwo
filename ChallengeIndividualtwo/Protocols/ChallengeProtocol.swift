//
//  ChallengeProtocol.swift
//  ChallengeIndividualtwo
//
//  Created by David Augusto on 09/02/21.
//

import Foundation

protocol ChallengeDelegate: class {
    func newCombination()
    func newFavorite()
}

protocol AddArtDelegate: class {
    func addArt()
}
