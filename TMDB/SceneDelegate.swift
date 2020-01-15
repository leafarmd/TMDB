//
//  SceneDelegate.swift
//  TMDB
//
//  Created by Rafael Damasceno on 15/01/20.
//  Copyright © 2020 RafaelDamasceno. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
     private let navigator = UINavigationController()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        
        makeViewController()
    }

    private func makeViewController() {
        //navigator.isNavigationBarHidden = true
        //let router = UpcomingMoviesRouter(navigator: navigator)
        window?.rootViewController = navigator
        window?.makeKeyAndVisible()
        let firstViewController = UIViewController()
        window?.rootNavigationController?.pushViewController(TopRatedMoviesViewController(presenter: TopRatedMoviesPresenter()),
                                                                                            animated: false)
    }
}

extension UIWindow {
    var rootNavigationController: UINavigationController? {
        return rootViewController as? UINavigationController
    }
}

