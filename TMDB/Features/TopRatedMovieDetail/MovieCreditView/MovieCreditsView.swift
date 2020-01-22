//
//  MovieCreditsView.swift
//  TMDB
//
//  Created by Rafael Damasceno on 21/01/20.
//  Copyright © 2020 RafaelDamasceno. All rights reserved.
//

import UIKit

class MovieCreditsView: UIView {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var cast: [Cast] = []
    
    func setCast(_ cast: [Cast]) {
        self.cast = cast
        collectionView.register(MovieCreditsCellCollectionViewCell.nib, forCellWithReuseIdentifier: MovieCreditsCellCollectionViewCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.reloadData()
    }
}

extension MovieCreditsView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cast.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCreditsCellCollectionViewCell.identifier, for: indexPath) as! MovieCreditsCellCollectionViewCell
        cell.setup(cast: cast[indexPath.row])
        return cell
    }
}

extension MovieCreditsView : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: 112, height: 140)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
