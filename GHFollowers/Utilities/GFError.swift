//
//  ErrorMessage.swift
//  GHFollowers
//
//  Created by Taylor Maxwell on 1/6/20.
//  Copyright © 2020 Taylor Maxwell. All rights reserved.
//

import Foundation

enum GFError: String, Error {
    case invalidUserName = "This user name created an invalid request, please try again."
    case unableToComplete = "Unable to complete your request. Please check your internet connection."
    case invalidResponse = "Invalid response from the server. Please try again."
    case keyNotFound = "The data recieved from the server contained a field that did not match. Please try again."
    case typeMismatch = "The data recieved from the server contained a field that had an unexpected value type. Please try again."
    case invalidData = "The data recieved from the server was invalid. Please try again."
}
