//
//  PostTableViewCell.swift
//  instagram-like-feed-app
//
//  Created by Serhiy Prikhodko on 18.06.2020.
//  Copyright © 2020 Serhiy Prikhodko. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    // MARK: Properties
    var presenter: PostCellPresenter!
    
    // MARK: Outlets
    lazy var userAvatarImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.layer.borderWidth = 1.0
        imageView.layer.borderColor = UIColor.gray.cgColor
        imageView.backgroundColor = .green
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        self.postTopBarView.addSubview(imageView)
        
        return imageView
    }()
    lazy var userNameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        self.postTopBarView.addSubview(label)
        
        return label
    }()
    lazy var postLocationLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        self.postTopBarView.addSubview(label)
        
        return label
    }()
    lazy var moreButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setImage(UIImage(named: "more_button"), for: .normal)
        self.postTopBarView.addSubview(button)
        
        return button
    }()
    lazy var viewContainer: UIView = {
        let uiView = UIView(frame: .zero)
        uiView.backgroundColor = .white
        contentView.addSubview(uiView)
        
        return uiView
    }()
    lazy var postTopBarView: UIView = {
        let uiView = UIView(frame: .zero)
        uiView.backgroundColor = .white
        self.viewContainer.addSubview(uiView)
        
        return uiView
    }()
    lazy var postBottomBarView: UIView = {
        let uiView = UIView(frame: .zero)
        uiView.backgroundColor = .white
        self.viewContainer.addSubview(uiView)
        
        return uiView
    }()
    lazy var postImageBarView: UIView = {
        let uiView = UIView(frame: .zero)
        uiView.backgroundColor = .blue
        contentView.addSubview(uiView)
        
        return uiView
    }()
    lazy var postUIImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.backgroundColor = .gray
        self.postImageBarView.addSubview(imageView)
        
        return imageView
        
    }()
    lazy var likeButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setImage(UIImage(named: "like_button_filled"), for: .normal)
        self.postBottomBarView.addSubview(button)
        
        return button
    }()
    lazy var commentButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setImage(UIImage(named: "comment_button"), for: .normal)
        self.postBottomBarView.addSubview(button)
        
        return button
    }()
    lazy var sendMessageButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setImage(UIImage(named: "send_message_button"), for: .normal)
        self.postBottomBarView.addSubview(button)
        
        return button
    }()
    lazy var collectButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setImage(UIImage(named: "collect_button"), for: .normal)
        self.postBottomBarView.addSubview(button)
        
        return button
    }()
    lazy var likeCounterLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        self.postBottomBarView.addSubview(label)
        
        return label
    }()
    lazy var postCommentsView: UIView = {
        let uiView = UIView(frame: .zero)
        uiView.backgroundColor = .white
        self.viewContainer.addSubview(uiView)
        
        return uiView
    }()
    
    // MARK: Functions
    func update(with post: Post?) {
        self.setupConstraints()
        if let post = post {
            self.userNameLabel.text = post.user?.userName
            self.postLocationLabel.text = post.location
            self.userAvatarImageView.image = UIImage(named: post.user?.profilePicture ?? "")
            self.postUIImageView.image = UIImage(named: post.images?[0].url ?? "")
            self.likeCounterLabel.text = "\(post.likesCounter ?? 0) Likes"
        }
    }
}

extension PostTableViewCell: PostCellProtocol {
    func getImage(post: Post?) {
        if let data = self.presenter.imageData {
            self.postUIImageView.image = UIImage(data: data)
        }
    }
}
