//
//  PhotoModel.swift
//  ChallengeIndividualtwo
//
//  Created by David Augusto on 08/02/21.
//

import Foundation

struct PhotoModel: Codable {

    let photographer: String
    let avgColor: String
    let src: Src

    enum CodingKeys: String, CodingKey {
        case photographer
        case avgColor = "avg_color"
        case src
    }
}

struct Src: Codable {
    let large2X: String

    enum CodingKeys: String, CodingKey {
        case large2X = "large2x"
    }
}
