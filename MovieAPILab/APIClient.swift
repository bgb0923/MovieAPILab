//
//  APIClient.swift
//  MovieAPILab
//
//  Created by William Brancato on 3/10/17.
//  Copyright © 2017 William Brancato. All rights reserved.
//

import Foundation
import UIKit
class APIClient {
    
    class func search(terms: String, completion: @escaping ([[String:Any]]) -> Void) {
        let terms = terms.replacingOccurrences(of: " ", with: "+")
        let urlString = "https://www.omdbapi.com/?s=\(terms)"
        if let url = URL(string: urlString) {
            let session = URLSession.shared
            let dataTask = session.dataTask(with: url) { (data, response, error) in
                if let data = data {
                    do {
                        if let outerDictionary = try? JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
                            if let json = outerDictionary?["Search"] as? [[String:Any]] {
                                completion(json)
                            }
                        }
                    }
                }
            }
            dataTask.resume()
        }
    }
    
    class func retrieveDetail(imdbID: String, completion: @escaping ([String:Any]) -> Void) {
        let urlString = "https://www.omdbapi.com/?i=\(imdbID)"
        if let url = URL(string: urlString) {
            let session = URLSession.shared
            let dataTask = session.dataTask(with: url) { (data, response, error) in
                if let data = data {
                    do {
                        if let movieDetail = try? JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
                            if let unwrappedMovieDetail = movieDetail {
                                print(unwrappedMovieDetail)
                                completion(unwrappedMovieDetail)
                            }
                        }
                    }
                }
            }
            dataTask.resume()
        }
    }
    
    class func getImages(url: URL, completion: @escaping (Any) -> Void) {
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url) { (data, response, error) in
            if let data = data {
                completion(data) // will eliminate later
            }
        }
        dataTask.resume()
    }
}

