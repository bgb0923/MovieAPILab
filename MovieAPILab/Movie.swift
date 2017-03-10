//
//  Movie.swift
//  MovieAPILab
//
//  Created by William Brancato on 3/10/17.
//  Copyright © 2017 William Brancato. All rights reserved.
//

import Foundation
import UIKit
class Movie {
    
    let title: String
    let year: String
    let imdbID: String
    let type: String
    var posterURL: URL?
    let plot: String?
    let yearReleased: String?
    let director: String?
    let writer: String?
    let stars: String?
    let imdbScore: String?
    let metascore: String?
    var poster: UIImage?
    
    init(dictionary: [String:Any]) {
        self.title = dictionary["Title"] as? String ?? "No Title"
        self.year = dictionary["Year"] as? String ?? "No Year"
        self.imdbID = dictionary["imdbID"] as? String ?? "No imbdID"
        self.type = dictionary["Type"] as? String ?? "No Type"
        
        if let urlString = dictionary["Poster"] as? String {
            self.posterURL = URL(string: urlString )
        }
        
        self.plot = dictionary["Plot"] as? String ?? nil
        self.yearReleased = dictionary["Year"] as? String ?? nil
        self.director = dictionary["Dictionary"] as? String ?? nil
        self.writer = dictionary["Writer"] as? String ?? nil
        self.stars = dictionary["Actors"] as? String ?? nil
        self.imdbScore = dictionary["imdbRating"] as? String ?? nil
        self.metascore = dictionary["Metascore"] as? String ?? nil
    }
    
    //     This is a temporary test to make sure the image is working
    func unwrapPoster() {
        if let url = self.posterURL {
            APIClient.getImages(url: url, completion: { (data) in
                print(data)
                self.poster = UIImage(data: data as! Data)
            })
        }
    }
}

extension Movie: CustomStringConvertible {
    var description: String {
        return "Title: \(self.title)\n"
    }
}
