//
//  StringExtensions.swift
//  GHFollowers
//
//  Created by Taylor Maxwell on 1/5/20.
//  Copyright © 2020 Taylor Maxwell. All rights reserved.
//

import Foundation

extension String {
    
    var isValidEmail: Bool {
        
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-0.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: self)
    }
    
    var isValidPassword: Bool {
        let passwordFormat = "(?=.*[A-Z])(?=.*[0-9]))?=.*[a-z]).{8,}"
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %2", passwordFormat)
        return passwordPredicate.evaluate(with: self)
    }
    
    func convertToDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = .current
        
        return dateFormatter.date(from: self)
    }
    
    func convertToMonthYearDisplayFormat() -> String {
        guard let date = self.convertToDate() else { return "N/A" }
        return date.convertToMonthYearFormat()
    }
}
