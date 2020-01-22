//
//  TopRatedMoviesRouter.swift
//  TMDB
//
//  Created by Rafael Damasceno on 20/01/20.
//  Copyright © 2020 RafaelDamasceno. All rights reserved.
//

import UIKit

class TopRatedMoviesRouter: TopRatedMoviesRoutering {
    
    let navigator: UINavigationController

    
    init(navigator: UINavigationController) {
        self.navigator = navigator
    }
    
    func makeViewController() -> UIViewController {
        let presenter = TopRatedMoviesPresenter()
        presenter.router = self
        return TopRatedMoviesViewController(presenter: presenter)
    }
    
    func navigateToDetail(id: Int) {
        let router = TopRatedMovieDetailRouter(navigator: navigator, id: id)
        navigator.pushViewController(router.makeViewController(), animated: true)
    }
}
