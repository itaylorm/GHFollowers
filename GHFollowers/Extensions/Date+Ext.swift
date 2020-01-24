//
//  Date+Ext.swift
//  GHFollowers
//
//  Created by Taylor Maxwell on 1/24/20.
//  Copyright © 2020 Taylor Maxwell. All rights reserved.
//

import Foundation

extension Date {
    
    func convertToMonthYearFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM yyyy"
        return dateFormatter.string(from: self)
    }
}
