//
//  GFDataLoadingViewController.swift
//  GHFollowers
//
//  Created by Taylor Maxwell on 1/31/20.
//  Copyright © 2020 Taylor Maxwell. All rights reserved.
//

import UIKit

class GFDataLoadingVC: UIViewController {

    var containerView: UIView!
    
    func showLoadingView() {
         containerView = UIView(frame: view.bounds)
         view.addSubview(containerView)
         
         containerView.backgroundColor = .systemBackground
         containerView.alpha = 0 // Transparent
         
         UIView.animate(withDuration: 0.25) {
            self.containerView.alpha = 0.8
         }
         
         let activityIndicator = UIActivityIndicatorView(style: .large)
         containerView.addSubview(activityIndicator)
         activityIndicator.translatesAutoresizingMaskIntoConstraints = false
         
         NSLayoutConstraint.activate([
             activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
             activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor)
         ])
         
         activityIndicator.startAnimating()
     }
     
     func dismissLoadingView() {
         
         DispatchQueue.main.async {
            self.containerView.removeFromSuperview()
            self.containerView = nil
         }

     }
     
     func showEmptyStateView(with message: String, in view: UIView) {
         let emptyStateView = GFEmptyStateView(message: message)
         emptyStateView.frame = view.bounds
         view.addSubview(emptyStateView)
     }
}
