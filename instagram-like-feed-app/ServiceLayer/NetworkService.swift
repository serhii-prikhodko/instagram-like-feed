//
//  NetworkService.swift
//  instagram-like-feed-app
//
//  Created by Serhiy Prikhodko on 21.06.2020.
//  Copyright © 2020 Serhiy Prikhodko. All rights reserved.
//

import Foundation
import UIKit

protocol NetworkServiceProtocol {
    func loadFeedData(complition: @escaping (Result<Posts?, Error>) -> Void)
    func fetchPostImage(post: Post, complition: @escaping (_ data: Data?) -> Void)
}

class NetworkService: NetworkServiceProtocol {
    func loadFeedData(complition: @escaping (Result<Posts?, Error>) -> Void) {
        if let path = Bundle.main.path(forResource: "response", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                do {
                    let obj = try JSONDecoder().decode(Posts.self, from: data)
                    complition(.success(obj))
                } catch {
                    complition(.failure(error))
                }
            } catch {
                print(error)
            }
        }
    }
    func fetchPostImage(post: Post, complition: @escaping (_ data: Data?) -> Void ) {
        if let url = URL(string: post.images?[0].url ?? "") {
            if UIApplication.shared.canOpenURL(url) { // check that image URL can be opened
                let session = URLSession.shared
                let dataTask = session.dataTask(with: url) { (data, response, error) in
                    if error != nil {
                        complition(nil)
                    } else {
                        complition(data)
                    }
                }
                dataTask.resume()
            }
        }
    }
}
