//
//  GFFollwerItemVC.swift
//  GHFollowers
//
//  Created by Taylor Maxwell on 1/24/20.
//  Copyright © 2020 Taylor Maxwell. All rights reserved.
//

import UIKit

class GFFollwerItemVC: GFItemInfoVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    private func configureItems() {
        itemInfoViewOne.set(itemInfoType: .followers, withCount: user.followers)
        itemInfoViewTwo.set(itemInfoType: .following, withCount: user.following)
        actionButton.set(backgroundColor: .systemGreen, title: "Get Followers")
    }

}
