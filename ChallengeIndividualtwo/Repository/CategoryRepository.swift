//
//  PersonRepository.swift
//  ChallengeIndividualtwo
//
//  Created by David Augusto on 09/02/21.
//

import Foundation

class CategoryRepository {
    
    func searchPhoto(type: ServiceApi, page: Int, completion: @escaping (PhotoModel?) -> Void) {
        
        let url =  type.url!.absoluteString + "&per_page=1&page=\(page)"
//        let authorization = ["Authorization": "563492ad6f917000010000018754273bf6504bf382c28922c6077b48"]
        let authorization = ["Authorization": "563492ad6f917000010000018754273bf6504bf382c28922c6077b48"]
        
        HTTP.get.request(url: URL(string: url), header: authorization) { data, response, error in
            if let error = error {
                print(error)
                completion(nil)
                return
            }
            
            guard let data = data, let response = response else {
                completion(nil)
                return
            }
            
            switch response.statusCode {
            case 200:
                
                if let search = try? JSONDecoder().decode(PageModel.self, from: data) {
                    guard let photo = search.photos.first else {
                        return completion(nil)
                    }
                    completion(photo)
                } else {
                    completion(nil)
                }
                return
            default:
                completion(nil)
                return
            }
        }
    }
}
