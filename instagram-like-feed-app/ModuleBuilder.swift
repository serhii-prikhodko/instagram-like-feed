//
//  ModuleBuilder.swift
//  instagram-like-feed-app
//
//  Created by Serhiy Prikhodko on 23.06.2020.
//  Copyright © 2020 Serhiy Prikhodko. All rights reserved.
//

import UIKit

protocol Builder {
    static func createFeedModule() -> UIViewController
    static func createPostCellModule(post: Post?) -> UITableViewCell
}

class ModuleBuilder: Builder {
    
    static func createFeedModule() -> UIViewController {
        let view = FeedViewController()
        let networkService = NetworkService()
        let presenter = FeedViewPresenter(view: view, networkService: networkService)
        view.presenter = presenter
        
        return view
    }
    
    static func createPostCellModule(post: Post?) -> UITableViewCell {
        let view = PostTableViewCell()
        let networkService = NetworkService()
        let presenter = PostCellPresenter(view: view, networkService: networkService, post: post)
        view.presenter = presenter
        
        return view
    }
}

