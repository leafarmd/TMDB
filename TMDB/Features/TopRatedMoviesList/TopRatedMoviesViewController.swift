//
//  TopRatedMoviesViewController.swift
//  TMDB
//
//  Created by Rafael Damasceno on 15/01/20.
//  Copyright © 2020 RafaelDamasceno. All rights reserved.
//

import UIKit

class TopRatedMoviesViewController: UIViewController {

    let presenter: TopRatedMoviesPresenter
    
    init(presenter: TopRatedMoviesPresenter) {
        self.presenter = presenter
        
        super.init(nibName: "TopRatedMoviesViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) { return nil }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.backgroundColor = UIColor.hexStringToUIColor(hex: "#042D2D")
        navigationController?.navigationBar.barStyle = .black
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.attachView(view: self)
    }
}

extension TopRatedMoviesViewController: TopRatedMoviesView {
    func setNavigationTitle(_ text: String) {
        title = text
    }
    
    func updateMoviesList() {
        
    }
    
    func startLoadingFeedback() {
        
    }
    
    func stopLoadingFeedback() {
        
    }
    
    func presenterError(message: String) {
        
    }
}

extension UIColor {
    class func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
