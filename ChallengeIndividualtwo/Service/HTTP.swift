//
//  HTTP.swift
//  ChallengeIndividualtwo
//
//  Created by David Augusto on 09/02/21.
//

import Foundation

enum HTTP {
    case get
    
    func request(url: URL?, header: [String: String] = ["Content-Type":"application/json"], body: [String: Any] = [:], completion: @escaping (Data?, HTTPURLResponse?, String?) -> Void = { data, response, error in }) {
        
        guard let url = url else {
            completion(nil, nil, "URL Invalida")
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.allHTTPHeaderFields = header
        //urlRequest.httpBody = body
        switch self {
        case .get:
            
            URLSession.shared.dataTask(with: urlRequest) { data, response, error in
                completion(data, response as? HTTPURLResponse, error?.localizedDescription)
            }.resume()
        }
    }
}
