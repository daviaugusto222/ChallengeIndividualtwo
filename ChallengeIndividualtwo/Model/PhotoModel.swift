//
//  PhotoModel.swift
//  ChallengeIndividualtwo
//
//  Created by David Augusto on 08/02/21.
//

import Foundation

struct PhotoModel: Codable {

    let src: Src

    enum CodingKeys: String, CodingKey {
        case src
    }
}

struct Src: Codable {
    let large2X: String

    enum CodingKeys: String, CodingKey {
        case large2X = "large2x"
    }
}
