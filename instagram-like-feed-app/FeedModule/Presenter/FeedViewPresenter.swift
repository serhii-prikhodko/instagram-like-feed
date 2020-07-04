//
//  FeedViewPresenter.swift
//  instagram-like-feed-app
//
//  Created by Serhiy Prikhodko on 23.06.2020.
//  Copyright © 2020 Serhiy Prikhodko. All rights reserved.
//

import Foundation

protocol FeedViewProtocol:class {
    func success()
    func failure(error: Error)
}

protocol FeedViewPresenterProtocol: class {
    
    var posts: [Post]? {get set}
   
    init(view: FeedViewProtocol, networkService: NetworkServiceProtocol)
    
    func getPosts()
}

class FeedViewPresenter: FeedViewPresenterProtocol {
    
    weak var view: FeedViewProtocol?
    private let networkService: NetworkServiceProtocol
    weak private var feedViewDelegate: FeedViewPresenterProtocol?
    var posts: [Post]?
    
    required init(view: FeedViewProtocol, networkService: NetworkServiceProtocol) {
        self.view = view
        self.networkService = networkService
        self.getPosts()
    }
    
    func getPosts() {
        self.networkService.loadFeedData() { [weak self] result in
            guard let self = self else {return}
            DispatchQueue.main.async {
                switch result {
                case .success(let posts):
                    self.posts = posts?.data
                    self.view?.success()
                case .failure(let error):
                    self.view?.failure(error: error)
                }
            }
        }
    }
}
