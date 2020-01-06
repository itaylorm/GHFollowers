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
            
            NetworkManager.shared.getFollowers(for: userName, page: 1) { (followers, errorMessage) in
                
                guard let followers = followers else {
                    self.presentGFAlertOnMainThread(title: "Bad Stuff Happened", message: errorMessage?.rawValue ?? "Unknown Error", buttonTitle: "OK")
                    return
                }
                
                print("Followers count: \(followers.count)")
                print(followers)
            }
        }

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    

}
