//
//  APIService.swift
//  ChallengeIndividualtwo
//
//  Created by David Augusto on 09/02/21.
//

import Foundation

enum ServiceApi: Router {
    case person
    case pose
    case scenery
    
    var description: String {
        switch self {
        case .person: return "Essa pessoa"
        case .pose: return "Essa pose"
        case .scenery: return "Essa paisagem"
        }
    }
    
    var hostname: String {
        return "https://api.pexels.com/v1"
    }
    
    var url: URL? {
        switch self {
        case .person: return URL(string: "\(hostname)/search?query=Person")
        case .pose: return URL(string: "\(hostname)/search?query=Pose")
        case .scenery: return URL(string: "\(hostname)/search?query=Scenery")
            
        }
    }
    
}
