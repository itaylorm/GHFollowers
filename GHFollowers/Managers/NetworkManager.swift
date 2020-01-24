//
//  NetworkManager.swift
//  GHFollowers
//
//  Created by Taylor Maxwell on 1/6/20.
//  Copyright © 2020 Taylor Maxwell. All rights reserved.
//

import UIKit

class NetworkManager {
    static let shared = NetworkManager()
    
    private let baseUrl = "https://api.github.com/users/"
    
    let cache = NSCache<NSString, UIImage>()
    
    private init() {}
    
    func getFollowers(for username: String, page: Int, completed: @escaping(Result<[Follower], GFError>) -> Void) {
        let endpoint = baseUrl + "\(username)/followers?per_page=100&page=\(page)"
        
        guard let  url = URL(string: endpoint) else {
        
            completed(.failure(.invalidUserName))
            return
        }

        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        
            if error != nil {
                completed(.failure(.unableToComplete))
                return
            }
            
            // Check if repsonse is nil and status code is not success (200)
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }

            do {
                
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                
                completed(.success(followers))
                
            } catch let DecodingError.keyNotFound(type, context) {
                print("Type '\(type)' mismatch:", context.debugDescription)
                print("codingPath:", context.codingPath)
                completed(.failure(.keyNotFound))
            } catch let DecodingError.typeMismatch(type, context) {
                print("Type '\(type)' mismatch:", context.debugDescription)
                print("codingPath:", context.codingPath)
                completed(.failure(.typeMismatch))
            } catch let DecodingError.valueNotFound(type, context) {
                print("Type '\(type)' mismatch:", context.debugDescription)
                print("codingPath:", context.codingPath)
                completed(.failure(.valueNotFound))
            } catch let DecodingError.dataCorrupted(context) {
                print("codingPath:", context.codingPath)
                completed(.failure(.dataCorrupted))
            } catch let error as NSError {
                print(error.localizedDescription)
                completed(.failure(.invalidData))
            }
            
        }
        
        task.resume()
        
    }
    
    func getUserInfo(for username: String, completed: @escaping(Result<User, GFError>) -> Void) {
        let endpoint = baseUrl + "\(username)"
        
        guard let  url = URL(string: endpoint) else {
        
            completed(.failure(.invalidUserName))
            return
        }

        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        
            if error != nil {
                completed(.failure(.unableToComplete))
                return
            }
            
            // Check if repsonse is nil and status code is not success (200)
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }

            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                print(data)
                let user = try decoder.decode(User.self, from: data)
                
                completed(.success(user))
            } catch let DecodingError.keyNotFound(type, context) {
                print("Type '\(type)' mismatch:", context.debugDescription)
                print("codingPath:", context.codingPath)
                completed(.failure(.keyNotFound))
            } catch let DecodingError.typeMismatch(type, context) {
                print("Type '\(type)' mismatch:", context.debugDescription)
                print("codingPath:", context.codingPath)
                completed(.failure(.typeMismatch))
            } catch let DecodingError.valueNotFound(type, context) {
                print("Type '\(type)' mismatch:", context.debugDescription)
                print("codingPath:", context.codingPath)
                completed(.failure(.valueNotFound))
            } catch let DecodingError.dataCorrupted(context) {
                print("codingPath:", context.codingPath)
                completed(.failure(.dataCorrupted))
            } catch let error as NSError {
                print(error.localizedDescription)
                completed(.failure(.invalidData))
            }
            
        }
        
        task.resume()
        
    }
}
