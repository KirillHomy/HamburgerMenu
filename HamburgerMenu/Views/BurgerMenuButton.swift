//
//  BurgerMenuButton.swift
//  HamburgerMenu
//
//  Created by Kirill Khomytsevych on 21.06.2023.
//

import UIKit

final class BurgerMenuButton: UIView {

    // MARK: - Private UI elements
    private let upRectangel = Rectangel()
    private let middleRectangel = Rectangel()
    private let downRectangel = Rectangel()

    // MARK: - Private constants
    private let widthRectangel = 50
    private let heightRectangel = 10
    private let marginY = 4
    private let duration = 0.8
    private let middleHeghtView = 20

    // MARK: - Life cycle
    override init(frame: CGRect) {
        super.init(frame: frame)

        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupView()
    }

}

// MARK: - External Methods
extension BurgerMenuButton {

    func openMenu() {
        UIView.animate(withDuration: duration) {
            // UpRectangel
            self.upRectangel.frame = CGRect(x: .zero, y: self.middleHeghtView, width: self.widthRectangel, height: self.heightRectangel)
            self.upRectangel.transform = CGAffineTransform(rotationAngle: .pi / 4)

            // MiddleRectangel
            self.middleRectangel.frame.size = CGSize(width: .zero, height: self.heightRectangel)
            self.middleRectangel.frame.origin = CGPoint(x: self.widthRectangel, y: 2 * self.heightRectangel)

            // DownRectangel
            self.downRectangel.frame = CGRect(x: .zero, y: self.middleHeghtView, width: self.widthRectangel, height: self.heightRectangel)
            self.downRectangel.transform = CGAffineTransform(rotationAngle: -.pi / 4)
        }
    }

    func closeMenu() {
        UIView.animate(withDuration: duration) {
            // UpRectangel
            self.upRectangel.transform = CGAffineTransform(rotationAngle: .pi * 4)
            self.upRectangel.frame = CGRect(x: .zero, y: .zero, width: self.widthRectangel, height: self.heightRectangel)

            // MiddleRectangel
            self.middleRectangel.frame.size = CGSize(width: self.widthRectangel, height: self.heightRectangel)
            self.middleRectangel.frame = CGRect(x: .zero, y: self.heightRectangel + self.marginY, width: self.widthRectangel, height: self.heightRectangel)

            // DownRectangel
            self.downRectangel.transform = CGAffineTransform( rotationAngle: -.pi * 4)
            self.downRectangel.frame = CGRect(x: .zero, y: 2 * (self.heightRectangel + self.marginY), width: self.widthRectangel, height: self.heightRectangel)
        }
    }

}

// MARK: - private extension
private extension BurgerMenuButton {

    func setupView() {
        setupAddSubview()
        setupFrame()
    }

    func setupAddSubview() {
        addSubview(upRectangel)
        addSubview(middleRectangel)
        addSubview(downRectangel)
    }

    func setupFrame() {
        upRectangel.frame = CGRect(x: .zero, y: .zero, width: widthRectangel, height: heightRectangel)
        middleRectangel.frame = CGRect(x: .zero, y: heightRectangel + marginY, width: widthRectangel, height: heightRectangel)
        downRectangel.frame = CGRect(x: .zero, y: 2 * (heightRectangel + marginY), width: widthRectangel, height: heightRectangel)
    }

}
