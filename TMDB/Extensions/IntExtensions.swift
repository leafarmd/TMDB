//
//  IntExtensions.swift
//  TMDB
//
//  Created by Rafael Damasceno on 21/01/20.
//  Copyright © 2020 RafaelDamasceno. All rights reserved.
//

import Foundation

extension Int {

    func minToTime() -> String {

        let (h,m) = (self / 60, self % 60)

        let h_string = "\(h)"
        let m_string =  m < 10 ? "0\(m)" : "\(m)"

        return "\(h_string)h \(m_string)min"
    }
}
