//
//  MoviesListViewModel.swift
//  ATFTest
//
//  Created by Sanzhar Burumbay on 8/19/20.
//  Copyright © 2020 burumbays. All rights reserved.
//

import Alamofire
import SwiftyJSON

class MoviesListViewModel {
    
    var moviesList = [Movie]()
    
    var page = 1
    
    func loadMovies(completion: ( (RequestStatus, String) -> () )? ) {
        let url = Network.movies + "?page=\(page)"
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: Network.headers)
            .responseJSON { [weak self] (response) in
                switch response.result {
                case .success(let value):
                    
                    let json = JSON(value)
                    let results = json["results"]
                    
                    print(json)
                    
                    for item in results.arrayValue {
                        let movie = Movie(json: item)
                        self?.moviesList.append(movie)
                    }
                    
                    completion?(.success, "")
                    
                case .failure(let error):
                    print(error.localizedDescription)
                    completion?(.error, "")
                }
        }
    }
    
    func turnPage(completion: ( (RequestStatus, String) -> () )? ) {
        page += 1
        loadMovies(completion: completion)
    }
    
}
