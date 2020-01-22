//
//  TopRatedMovieDetailViewController.swift
//  TMDB
//
//  Created by Rafael Damasceno on 20/01/20.
//  Copyright © 2020 RafaelDamasceno. All rights reserved.
//

import UIKit

class TopRatedMovieDetailViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var imageBackDrop: UIImageView!
    @IBOutlet weak var imagePoster: UIImageView!  {
        didSet {
            imagePoster.layer.cornerRadius = 5
            imagePoster.layer.borderWidth = 1
            imagePoster.layer.borderColor = UIColor.hexStringToUIColor(hex: "#03D475").cgColor
        }
    }
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelOverview: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var labelDuration: UILabel!
    
    let presenter: TopRatedMovieDetailPresenter
    
    init(presenter: TopRatedMovieDetailPresenter) {
        self.presenter = presenter
        
        super.init(nibName: "TopRatedMovieDetailViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) { return nil }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.subviews.forEach { $0.alpha = 0 }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageBackDrop.alpha = 0
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.barTintColor = .clear
        navigationController?.navigationBar.backgroundColor = .clear
        navigationController?.navigationBar.barStyle = .black
        
        presenter.attachView(view: self)
    }
}

extension TopRatedMovieDetailViewController: TopRatedMovieDetailView {
    func setBackdrop(_ path: String) {
        imageBackDrop.loadImageFromURL(path, alpha: 0.7, hasPlaceholer: false)
    }
    
    func setPoster(_ path: String) {
        imagePoster.loadImageFromURL(path)
    }
    
    func setTitle(_ title: String) {
        labelTitle.text = title
    }
    
    func setOverview(_ text: String) {
        labelOverview.text = text
    }
    
    func setDuration(_ duration: String) {
        labelDuration.text = duration
    }
    
    func setRating(_ rating: String) {
        
    }
    
    func setImages(_ images: [String]) {
        // TODO: add movie images
    }
    
    func setCast(_ cast: [Cast]) {
        guard let view = MovieCreditsView.instanceFromNib("MovieCreditsView") else { return }
        view.setCast(cast)
        stackView.addArrangedSubview(view)
    }
    
    func startLoadingFeedback() {
        Loading.start()
    }
    
    func stopLoadingFeedback() {
        Loading.stop()
    }
    
    func presenterError(_ message: String) {
        showAlert(title: "Error", message: message)
    }
    
    func showItems() {
        view.subviews.forEach { $0.alpha = 0 }
    }
}
