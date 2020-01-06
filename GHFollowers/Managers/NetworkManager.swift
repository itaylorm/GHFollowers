//
//  NetworkManager.swift
//  GHFollowers
//
//  Created by Taylor Maxwell on 1/6/20.
//  Copyright © 2020 Taylor Maxwell. All rights reserved.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    let baseUrl = "https://api.github.com/users/"
    
    private init() {}
    
    func getFollowers(for username: String, page: Int, completed: @escaping([Follower]?, String?) -> Void) {
        let endpoint = baseUrl + "\(username)/followers?per_page=100&page=\(page)"
        
        guard let  url = URL(string: endpoint) else {
        
            completed(nil, "This user name created an invalid request, please try again")
            return
        }

        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        
            if let _ = error {
                completed(nil, "Unable to complete your request. Please check your internet connection")
                return
            }
            
            // Check if repsonse is nil and status code is not success (200)
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(nil, "Invalid response from the server. Please try again")
                return
            }
            
            guard let data = data else {
                completed(nil, "The data recieved from the server was invalid. Please try again")
                return
            }

            do {
                
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                
                completed(followers, "Success")
                
            } catch {
                completed(nil, "The data recieved from the server was invalid. Please try again")
            }
            
        }
        
        task.resume()
        
    }
    
}
