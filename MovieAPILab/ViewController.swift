//
//  ViewController.swift
//  MovieAPILab
//
//  Created by William Brancato on 3/10/17.
//  Copyright © 2017 William Brancato. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var sectionInsets: UIEdgeInsets!
    var spacing: CGFloat!
    var itemSize: CGSize!
    var referenceSize: CGSize!
    var numberOfColumns: CGFloat!
    
    //    var movies: [Movie] = MovieDataStore.sharedInstance.movieArray
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        MovieDataStore.sharedInstance.fillArray(searchTerms: "star") { (_) in
            DispatchQueue.main.async {
                print(MovieDataStore.sharedInstance.movieArray)
            }
        }
//        let url = URL(string: "https://images-na.ssl-images-amazon.com/images/M/MV5BZGEzZTExMDEtNjg4OC00NjQxLTk5NTUtNjRkNjA3MmYwZjg1XkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SX300.jpg")
//        APIClient.getImages(url: url!)
    }
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return MovieDataStore.sharedInstance.movieArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PosterCell", for: indexPath) as! PosterCollectionViewCell
        let movie = MovieDataStore.sharedInstance.movieArray[indexPath.item]
        // will move later
        APIClient.getImages(url: movie.posterURL!) { (poster) in
            cell.poster.image = poster
            print(poster)
        }
//        movie.unwrapPoster()
//        if let poster = movie.poster {
//            print("poster has been unwrapped")
//            cell.poster.image = poster
//        }
        return cell
    }
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return spacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return spacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return itemSize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return referenceSize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return referenceSize
    }
    
    func configureLayout() {
        self.spacing = 5
        self.sectionInsets = UIEdgeInsetsMake(spacing, spacing / 2, spacing, spacing / 2)
        self.referenceSize = CGSize(width: UIScreen.main.bounds.width, height: 60)
        let itemSizeWidth = (UIScreen.main.bounds.width / 2) - (20)
        let itemSizeHeight = (UIScreen.main.bounds.height / 2)
        itemSize = CGSize(width: itemSizeWidth,height: itemSizeHeight)
    }
    
    
}




