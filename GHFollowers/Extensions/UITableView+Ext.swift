//
//  UITableView+Ext.swift
//  GHFollowers
//
//  Created by Taylor Maxwell on 2/3/20.
//  Copyright © 2020 Taylor Maxwell. All rights reserved.
//

import UIKit

extension UITableView {
    
    func reloadDataOnMainThread() {
        DispatchQueue.main.async { self.reloadData() }
    }
    
    func removeExcessCells() {
        tableFooterView = UIView(frame: .zero)
    }
}
