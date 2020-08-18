//
//  MovieDetailsHeaderTableViewCell.swift
//  ATFTest
//
//  Created by Sanzhar Burumbay on 8/19/20.
//  Copyright © 2020 burumbays. All rights reserved.
//

import UIKit

class MovieDetailsHeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    func configure(withMovie movie: Movie) {
        titleLabel.text = movie.title
        posterImageView.kf.setImage(with: URL(string: movie.getLargePosterPath()), placeholder: UIImage(named: "poster_placeholder"), options: [])
        ratingLabel.text = "Rating: \(movie.vote_average)"
        overviewLabel.text = movie.overview
    }
    
}
