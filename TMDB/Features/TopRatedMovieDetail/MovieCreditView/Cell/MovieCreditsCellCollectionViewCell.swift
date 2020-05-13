//
//  MovieCreditsCellCollectionViewCell.swift
//  TMDB
//
//  Created by Rafael Damasceno on 21/01/20.
//  Copyright © 2020 RafaelDamasceno. All rights reserved.
//

import UIKit

class MovieCreditsCellCollectionViewCell: UICollectionViewCell {
    static let identifier = "MovieCreditsCellCollectionViewCell"
    static let nib = UINib(nibName: "MovieCreditsCellCollectionViewCell", bundle: nil)
    
    @IBOutlet weak var imageCast: UIImageView! {
        didSet {
            imageCast.layer.cornerRadius = 46
        }
    }
    @IBOutlet weak var labelCharacter: UILabel!
    @IBOutlet weak var labelName: UILabel!
    
    func setup(cast: Cast) {
        imageCast.loadImageFromURL(cast.profilePath)
        labelCharacter.text = cast.character
        labelName.text = cast.name
    }
    
    override func prepareForReuse() {
        imageCast.image = nil
        super.prepareForReuse()
    }
}
