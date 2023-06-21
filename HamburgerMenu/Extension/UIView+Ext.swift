//
//  UIView+Ext.swift
//  HamburgerMenu
//
//  Created by Kirill Khomytsevych on 20.06.2023.
//

import UIKit

enum CornerMask {
    case topLeft
    case topRight
    case bottomLeft
    case bottomRight

    var caCornerMask: UInt {
        switch self {
        case .topLeft:
            return CACornerMask.layerMinXMinYCorner.rawValue
        case .topRight:
            return CACornerMask.layerMaxXMinYCorner.rawValue
        case .bottomLeft:
            return CACornerMask.layerMinXMaxYCorner.rawValue
        case .bottomRight:
            return CACornerMask.layerMaxXMaxYCorner.rawValue
        }
    }
}

extension UIView {

    func cornerRadius(cornerRadius: CGFloat = 0, maskedCorners: CornerMask...) {
        let cornerMask = maskedCorners.map { $0.caCornerMask }.reduce(0) { $0 | $1 }
        self.layer.maskedCorners = CACornerMask(rawValue: cornerMask)
        self.layer.cornerRadius = cornerRadius
    }

}
