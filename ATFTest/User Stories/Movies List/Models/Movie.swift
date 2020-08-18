//
//  Movie.swift
//  ATFTest
//
//  Created by Sanzhar Burumbay on 8/19/20.
//  Copyright © 2020 burumbays. All rights reserved.
//

import SwiftyJSON

class Movie {
    let id: Int
    let overview: String
    let poster_path: String
    let vote_average: Float
    let title: String
    
    init(json: JSON) {
        id = json["id"].intValue
        title = json["title"].stringValue
        vote_average = json["vote_average"].floatValue
        overview = json["overview"].stringValue
        poster_path = json["poster_path"].stringValue
    }
    
    func getLargePosterPath() -> String {
        return Network.images + "w200" + self.poster_path
    }
    
    func getSmallPosterPath() -> String {
        return Network.images + "w500" + self.poster_path
    }
}
