//
//  MovieDataStore.swift
//  MovieAPILab
//
//  Created by William Brancato on 3/10/17.
//  Copyright © 2017 William Brancato. All rights reserved.
//

import Foundation

class MovieDataStore {
    
    static let sharedInstance = MovieDataStore()
    var movieArray = [Movie]()
    
    private init() {}
    
    func fillArray(searchTerms: String, completion: @escaping (Bool) -> Void) {
        
        self.movieArray.removeAll()
        
        APIClient.search(terms: searchTerms) { (jsonArray) in
            jsonArray.forEach {
                let movie = Movie(dictionary: $0)
                self.movieArray.append(movie)
            }
            
            if !self.movieArray.isEmpty {
                completion(true)
            } else {
                completion(false)
            }
      
        }
    }
}
