//
//  UIViewExtensions.swift
//  TMDB
//
//  Created by Rafael Damasceno on 20/01/20.
//  Copyright © 2020 RafaelDamasceno. All rights reserved.
//

import UIKit

extension UIView {
    class func instanceFromNib(_ nibName: String) -> Self? {
        if let view = UINib(nibName: nibName, bundle: nil).instantiate(withOwner: nil, options: nil).first as? Self {
            return view
        } else {
            return nil
        }
    }
}
