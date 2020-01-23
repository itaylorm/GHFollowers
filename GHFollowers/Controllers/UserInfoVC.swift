//
//  UserInfoVC.swift
//  GHFollowers
//
//  Created by Taylor Maxwell on 1/13/20.
//  Copyright © 2020 Taylor Maxwell. All rights reserved.
//

import UIKit

class UserInfoVC: UIViewController {

    let headerVew = UIView()
    
    var userName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        navigationItem.rightBarButtonItem = doneButton
        
        NetworkManager.shared.getUserInfo(for: userName) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let user):
                DispatchQueue.main.async {
                    self.add(childVC: GFUserInfoHeaderVC(user: user), to: self.headerVew)
                }

            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Something went wrong", message: error.rawValue, buttonTitle: "OK")
                break
            }
        }
        
        layoutUI()
    }
    
    func layoutUI() {
        view.addSubview(headerVew)
        
        headerVew.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerVew.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerVew.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerVew.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerVew.heightAnchor.constraint(equalToConstant: 180)
        ])
    }

    func add(childVC: UIViewController, to containerView: UIView) {
        addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = containerView.bounds
        childVC.didMove(toParent: self)
    }
    
    @objc func dismissVC() {
        dismiss(animated: true)
    }
}
