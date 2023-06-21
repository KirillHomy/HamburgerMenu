//
//  HamburgerViewController.swift
//  HamburgerMenu
//
//  Created by Kirill Khomytsevych on 20.06.2023.
//

import UIKit

class HamburgerViewController: UIViewController {

    // MARK: - Private @IBOutlet
    @IBOutlet private weak var profileView: UIView!

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupController()
    }
 
}

// MARK: - private extension
private extension HamburgerViewController {

    func setupController() {
        setupProfileView()
    }

    func setupProfileView() {
        profileView.cornerRadius(cornerRadius: 50.0, maskedCorners: .bottomRight )
    }

}
