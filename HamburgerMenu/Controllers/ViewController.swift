//
//  ViewController.swift
//  HamburgerMenu
//
//  Created by Kirill Khomytsevych on 20.06.2023.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Private variables
    private var isOpenBurgetMenu = false

    // MARK: - Private @@IBOutlet
    @IBOutlet private weak var leadingConstraintFroHamburgerView: NSLayoutConstraint!
    @IBOutlet private weak var burgerView: UIView!
    @IBOutlet private weak var leadingConstraintBurgerButton: NSLayoutConstraint!
    @IBOutlet weak var burgerMenuButton: BurgerMenuButton!
//    private let burgerMenuButton = BurgerMenuButton()

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupController()
    }

    // MARK: - Private @IBAction
    @IBAction private func openClose(_ sender: Any) {
        isOpenBurgetMenu.toggle()

        UIView.animate(withDuration: 0.3) {
            self.leadingConstraintFroHamburgerView.constant = self.isOpenBurgetMenu ? 0 : -280
            self.leadingConstraintBurgerButton.constant = self.isOpenBurgetMenu ? 300 : 20
            self.burgerView.backgroundColor =  self.isOpenBurgetMenu ? UIColor.orange.withAlphaComponent(0.5)
                                                                     : UIColor.orange.withAlphaComponent(1)
            self.view.layoutIfNeeded()
        }
    }

}

// MARK: - private extensio
private extension ViewController {

    func setupController() {
        setupMainView()
        setupTap()
    }

    func setupMainView() {
        view.backgroundColor = UIColor.orange
    }

    func setupTap() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTap))
        burgerMenuButton.addGestureRecognizer(tapGestureRecognizer)
    }

}

// MARK: - @objc private extension
@objc private extension ViewController {

    func didTap() {
        isOpenBurgetMenu.toggle()
        isOpenBurgetMenu ? burgerMenuButton.openMenu() : burgerMenuButton.closeMenu()
        UIView.animate(withDuration: 0.3) {
            self.leadingConstraintFroHamburgerView.constant = self.isOpenBurgetMenu ? 0 : -280
            self.leadingConstraintBurgerButton.constant = self.isOpenBurgetMenu ? 280 : 0
            self.burgerView.backgroundColor =  self.isOpenBurgetMenu ? UIColor.orange.withAlphaComponent(0.5)
                                                                     : UIColor.orange.withAlphaComponent(1)
            self.view.layoutIfNeeded()
        }
    }

}


