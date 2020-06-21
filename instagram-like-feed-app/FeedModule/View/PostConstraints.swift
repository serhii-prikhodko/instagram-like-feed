//
//  FeedView.swift
//  instagram-like-feed-app
//
//  Created by Serhiy Prikhodko on 11.06.2020.
//  Copyright © 2020 Serhiy Prikhodko. All rights reserved.
//

import Foundation
import SnapKit

extension PostTableViewCell {
    
    // MARK: Constraints functions
    func setupConstraints() {
        self.setupContainerView()
        self.setupPostTopBar()
        self.setupUserAvatar()
        self.setupUserName()
        self.setupPostLocation()
        self.setupPostImageBar()
    }
    func setupContainerView() {
        self.viewContainer.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        self.viewContainer.backgroundColor = .white
    }
    func setupPostTopBar() {
        self.postTopBarView.snp.makeConstraints { (make) in
            make.leading.trailing.equalTo(contentView.safeAreaLayoutGuide)
            make.top.equalTo(0)
            make.height.equalTo(50)
        }
        self.postTopBarView.backgroundColor = .white
        
        
    }
    func setupUserAvatar() {
        self.userAvatarImageView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalTo(5)
            make.height.width.equalTo(40)
        }
    }
    func setupUserName() {
        self.userNameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.userAvatarImageView)
            make.left.equalTo(self.userAvatarImageView.snp.right).offset(5)
        }
    }
    func setupPostLocation() {
        self.postLocationLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.userNameLabel.snp.bottom).offset(5)
            make.left.equalTo(self.userAvatarImageView.snp.right).offset(5)
        }
    }
    func setupPostImageBar() {
        self.postImageBarView.snp.makeConstraints { (make) in
            make.top.equalTo(self.postTopBarView.snp.bottom)
            make.trailing.leading.equalToSuperview()
            make.height.equalTo(40)
        }
    }
}
