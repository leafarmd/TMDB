//
//  TopRatedMovieDetailRouter.swift
//  TMDB
//
//  Created by Rafael Damasceno on 20/01/20.
//  Copyright © 2020 RafaelDamasceno. All rights reserved.
//

import UIKit

class TopRatedMovieDetailRouter: TopRatedMovieDetailRoutering {
    
    let navigator: UINavigationController
    let id: Int
    
    init(navigator: UINavigationController, id: Int) {
        self.navigator = navigator
        self.id = id
    }
    
    func makeViewController() -> UIViewController {
        let presenter = TopRatedMovieDetailPresenter(id: id)
        return TopRatedMovieDetailViewController(presenter: presenter)
    }
}
