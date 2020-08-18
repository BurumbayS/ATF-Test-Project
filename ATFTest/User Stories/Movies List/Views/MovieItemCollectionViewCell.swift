//
//  MovieItemCollectionViewCell.swift
//  ATFTest
//
//  Created by Sanzhar Burumbay on 8/19/20.
//  Copyright © 2020 burumbays. All rights reserved.
//

import UIKit
import Kingfisher

class MovieItemCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    func configure(withMovie movie: Movie) {
        titleLabel.text = movie.title
        posterImageView.kf.setImage(with: URL(string: movie.getSmallPosterPath()), placeholder: UIImage(named: "poster_placeholder"), options: [])
    }
}
