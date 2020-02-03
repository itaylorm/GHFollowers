//
//  UIView+Ext.swift
//  GHFollowers
//
//  Created by Taylor Maxwell on 2/3/20.
//  Copyright © 2020 Taylor Maxwell. All rights reserved.
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: UIView ...) {
        for view in views { addSubview(view) }
    }
    
    func pinToEdges(of superView: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superView.topAnchor),
            leadingAnchor.constraint(equalTo: superView.leadingAnchor),
            trailingAnchor.constraint(equalTo: superView.trailingAnchor),
            bottomAnchor.constraint(equalTo: superView.bottomAnchor)
        ])
    }
}
