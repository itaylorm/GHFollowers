//
//  GFUserInfoHeaderVC.swift
//  GHFollowers
//
//  Created by Taylor Maxwell on 1/23/20.
//  Copyright © 2020 Taylor Maxwell. All rights reserved.
//

import UIKit

class GFUserInfoHeaderVC: UIViewController {

    let avatarImageView = GFAvatarImageView(frame: .zero)
    let userNameLabel = GFTitleLabel(textAlignment: .left, fontSize: 34)
    let nameLabel = GFSecondaryTitleLabel(fontSize: 18)
    let locationImageView = UIImageView()
    let locationLabel = GFSecondaryTitleLabel(fontSize: 18)
    let bioLabel = GFBodyLabel(textAlignment: .left)
    
    let padding: CGFloat = 20
    let textImagePadding: CGFloat = 12
    
    var user: User!
    
    init(user: User) {
        super.init(nibName: nil, bundle: nil)
        self.user = user
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubviews(avatarImageView, userNameLabel, nameLabel, locationImageView, locationLabel, bioLabel)
        configureAvatarImageView()
        configureUserNameLabel()
        configureNameLabel()
        configureLocationImageView()
        configureLocationLabel()
        configureBioLabel()
        configureUIElements()
    }
    
    func configureUIElements() {
        downloadAvatarImage()
        userNameLabel.text = user.login
        nameLabel.text = user.name ?? ""
        locationLabel.text = user.location ?? "No Location"
        bioLabel.text = user.bio ?? "No bio available"
        bioLabel.numberOfLines = 3
    }
    
    func downloadAvatarImage() {
        NetworkManager.shared.downloadImage(from: user.avatarUrl) { [weak self] image in
            guard let self = self else { return }
            DispatchQueue.main.async { self.avatarImageView.image = image }
        }
    }
    
    func configureAvatarImageView() {
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
            avatarImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            avatarImageView.widthAnchor.constraint(equalToConstant: 90),
            avatarImageView.heightAnchor.constraint(equalToConstant: 90)
        ])
    }
    
    func configureUserNameLabel() {
        NSLayoutConstraint.activate([
            userNameLabel.topAnchor.constraint(equalTo: avatarImageView.topAnchor),
            userNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: textImagePadding),
            userNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            userNameLabel.heightAnchor.constraint(equalToConstant: 38)
        ])
    }
    
    func configureNameLabel() {
        NSLayoutConstraint.activate([
            nameLabel.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: textImagePadding),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    func configureLocationImageView() {
        locationImageView.image = SFSymbols.location
        locationImageView.tintColor = .secondaryLabel
        
        locationImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            locationImageView.bottomAnchor.constraint(equalTo: avatarImageView.bottomAnchor),
            locationImageView.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: textImagePadding),
            locationImageView.heightAnchor.constraint(equalToConstant: 20),
            locationImageView.widthAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    func configureLocationLabel() {
        NSLayoutConstraint.activate([
            locationLabel.centerYAnchor.constraint(equalTo: locationImageView.centerYAnchor),
            locationLabel.leadingAnchor.constraint(equalTo: locationImageView.trailingAnchor, constant: 5),
            locationLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            locationLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    func configureBioLabel() {
        NSLayoutConstraint.activate([
            bioLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: textImagePadding),
            bioLabel.leadingAnchor.constraint(equalTo: avatarImageView.leadingAnchor),
            bioLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bioLabel.heightAnchor.constraint(equalToConstant: 90)
        ])
    }

}
