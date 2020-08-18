//
//  Network.swift
//  ATFTest
//
//  Created by Sanzhar Burumbay on 8/19/20.
//  Copyright © 2020 burumbays. All rights reserved.
//

import Foundation

enum RequestStatus {
    case success
    case fail
    case error
}

class Network {
    static let host = "https://api.themoviedb.org/3"
    
    static let movies = host + "/movie/top_rated"
    static let images = "https://image.tmdb.org/t/p/"
    
    private static let api_key = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmNGVmYTZlMjdjY2E3MzUyN2Y3NDk4NmQ2ZjEzYjdjZSIsInN1YiI6IjVmM2MwYWZlNjA2MjBhMDAzNWE4YjViZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Ntm-Mw4uLC8XXWx01MngiDEA7zzVhrP9ASbkVkP1aEE"
    
    static var headers: [String: String] {
        return ["Content-Type" : "application/json", "Accept" : "application/json", "Authorization" : "Bearer \(api_key)"]
    }
}
