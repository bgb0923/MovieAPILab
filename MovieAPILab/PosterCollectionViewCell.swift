//
//  PosterCollectionViewCell.swift
//  MovieAPILab
//
//  Created by William Brancato on 3/10/17.
//  Copyright © 2017 William Brancato. All rights reserved.
//

import UIKit

class PosterCollectionViewCell: UICollectionViewCell {
    
    var movie: Movie! {
        didSet {
            self.movie.unwrapPoster()
            self.poster.image = self.movie.poster
        }
    }
    
    @IBOutlet weak var poster: UIImageView!
    
}
