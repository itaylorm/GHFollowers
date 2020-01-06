//
//  User.swift
//  GHFollowers
//
//  Created by Taylor Maxwell on 1/5/20.
//  Copyright © 2020 Taylor Maxwell. All rights reserved.
//

import Foundation

struct User: Codable {
    
    
    var login: String
    var avatarUrl: String
    var location: String
    var name: String?
    var bio: String?
    var publicRepos: Int
    var publicGists: Int
    var followers: Int
    var following: Int
    var htmlUrl: String
    var createdAt: String
}
