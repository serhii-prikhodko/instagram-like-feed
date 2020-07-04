//
//  PostCellPresenter.swift
//  instagram-like-feed-app
//
//  Created by Serhiy Prikhodko on 27.06.2020.
//  Copyright © 2020 Serhiy Prikhodko. All rights reserved.
//

import Foundation

protocol PostCellProtocol: class {
   
    func getImage(post: Post?)
}

protocol PostCellPresenterProtocol: class {
    
    init(view: PostCellProtocol, networkService: NetworkServiceProtocol, post: Post?)
    
    func getImage()
}

class PostCellPresenter: PostCellPresenterProtocol {
    
    weak var view: PostCellProtocol?
    private let networkService: NetworkServiceProtocol
    weak private var postCellDelegate: PostCellPresenterProtocol?
    var post: Post?
    var imageData: Data?
    
    required init(view: PostCellProtocol, networkService: NetworkServiceProtocol, post: Post?) {
        self.view = view
        self.networkService = networkService
        self.post = post
        self.getImage()
    }
    
    func getImage() {
        self.view?.getImage(post: self.post)
        if let post = post {
            self.networkService.fetchPostImage(post: post) { (data: Data?) in
                if let data = data {
                    DispatchQueue.main.async { [weak self] in
                        self?.imageData = data
                    }
                }
            }
        }
    }
}
