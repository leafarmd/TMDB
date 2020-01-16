//
//  TopRatedMoviesTableViewCell.swift
//  TMDB
//
//  Created by Rafael Damasceno on 15/01/20.
//  Copyright © 2020 RafaelDamasceno. All rights reserved.
//

import UIKit

class TopRatedMoviesTableViewCell: UITableViewCell {
    
    static let identifier = "TopRatedMoviesTableViewCell"
    static let nib = UINib(nibName: "TopRatedMoviesTableViewCell", bundle: nil)
    
    @IBOutlet weak var viewCell: UIView!
    @IBOutlet weak var viewRating: UIView!
    @IBOutlet weak var imageViewPoster: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var labelRating: UILabel!
    @IBOutlet weak var labelReleaseYear: UILabel!
    
    
    func configure(data: TopMovieOutput) {
        viewCell.layer.cornerRadius = 5
        viewRating.layer.cornerRadius = 5
        imageViewPoster?.layer.cornerRadius = 5
        imageViewPoster?.clipsToBounds = true
        imageViewPoster?.loadImageFromURL(data.posterPath)
        labelTitle.text = data.title
        labelDescription.text = data.overview ?? ""
        if let rating = data.voteAverage {
            labelRating.text = "\(String(describing: rating))"
        } else {
            labelRating.text = "N/A"
        }
        
        if let releaseDate = data.releaseDate, let date = Date.fromString(releaseDate) {
            labelReleaseYear.text = date.year
        } else {
            labelReleaseYear.text = "N/A"
        }
        
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        imageViewPoster.image = nil
    }
}
