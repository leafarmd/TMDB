import UIKit

extension UIImageView {
    func loadImageFromURL(_ url: String?, alpha: CGFloat = 1, hasPlaceholer: Bool = true) {
        
        if let image = TMDBHolder.shared.cachedImgae[url ?? ""] {
            DispatchQueue.main.async {
                self.image = image
            }
        } else {
            let activityIndicator = UIActivityIndicatorView(style: .medium)
            activityIndicator.color = .black
            activityIndicator.alpha = 1.0
            activityIndicator.center = self.center
            
            
            self.addSubview(activityIndicator)
            
            activityIndicator.translatesAutoresizingMaskIntoConstraints = false
            let horizontalConstraint = activityIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor)
            let verticalConstraint = activityIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor)
            NSLayoutConstraint.activate([horizontalConstraint, verticalConstraint])
            
            activityIndicator.startAnimating()
            
            if let url = url {
                API.loadImage(from: url) { [weak self] result in
                    DispatchQueue.main.async {
                        activityIndicator.stopAnimating()
                        activityIndicator.removeFromSuperview()
                        switch result {
                        case .success(let image):
                            self?.image = image
                        case .failure(_), .APIError(_):
                            self?.image = UIImage(named: hasPlaceholer ? "noimage" : "")
                        }
                        self?.alpha = 0
                        UIView.animate(withDuration: 0.2) {
                            self?.alpha = alpha
                        }
                    }
                }
            } else {
                activityIndicator.stopAnimating()
                activityIndicator.removeFromSuperview()
                self.image = UIImage(named: hasPlaceholer ? "noimage" : "")
            }
        }
    }
}
