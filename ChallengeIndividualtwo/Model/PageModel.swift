//
//  ChallengeModel.swift
//  ChallengeIndividualtwo
//
//  Created by David Augusto on 08/02/21.
//

import Foundation

struct PageModel: Codable {
    let photos: [PhotoModel]
    let totalResults: Int
    
    enum CodingKeys: String, CodingKey {
        case photos
        case totalResults = "total_results"
    }
}
