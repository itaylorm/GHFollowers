//
//  FolllowerListVCViewController.swift
//  GHFollowers
//
//  Created by Taylor Maxwell on 1/5/20.
//  Copyright © 2020 Taylor Maxwell. All rights reserved.
//

import UIKit

class FollowerListVC: UIViewController {

    var userName: String? {
        willSet {
            guard let username = newValue else { return }
            configure(with: username)
        }
    }
    
    private func configure(with username: String) {
        title = username
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true

    }
    

}