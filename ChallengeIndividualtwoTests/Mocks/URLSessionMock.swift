//
//  URLSessionMock.swift
//  ChallengeIndividualtwoTests
//
//  Created by David Augusto on 11/02/21.
//

import Foundation

class URLSessionMock: URLSession {
    var lastURL: URL?
    
    override init() {}
    
    override func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        defer { completionHandler(nil, nil, nil) }
        lastURL = request.url
        return DataTaskMock()
    }
}
