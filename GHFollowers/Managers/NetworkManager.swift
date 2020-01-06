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
    
    func getFollowers(for username: String, page: Int, completed: @escaping([Follower]?, ErrorMessage?) -> Void) {
        let endpoint = baseUrl + "\(username)/followers?per_page=100&page=\(page)"
        
        guard let  url = URL(string: endpoint) else {
        
            completed(nil, .invalidUserName)
            return
        }

        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        
            if let _ = error {
                completed(nil, .unableToComplete)
                return
            }
            
            // Check if repsonse is nil and status code is not success (200)
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(nil, .invalidResponse)
                return
            }
            
            guard let data = data else {
                completed(nil, .invalidData)
                return
            }

            do {
                
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                
                completed(followers, nil)
                
            } catch let DecodingError.keyNotFound(type, context) {
                print("Type '\(type)' mismatch:", context.debugDescription)
                print("codingPath:", context.codingPath)
                completed(nil, .keyNotFound)
            } catch let DecodingError.typeMismatch(type, context) {
                print("Type '\(type)' mismatch:", context.debugDescription)
                print("codingPath:", context.codingPath)
                completed(nil, .typeMismatch)
            }  catch {
                print(error.localizedDescription)
                completed(nil, .invalidData)
            }
            
        }
        
        task.resume()
        
    }
    
}
