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
        navigationController?.navigationBar.prefersLargeTitles = true

        if let userName = userName {
            
            NetworkManager.shared.getFollowers(for: userName, page: 1) { result in
                
                switch result {
                case .success(let followers):
                    print("Followers count: \(followers.count)")
                    print(followers)
                case .failure(let error):
                    self.presentGFAlertOnMainThread(title: "Bad Stuff Happened", message: error.rawValue, buttonTitle: "OK")
                }

            }
        }

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    

}