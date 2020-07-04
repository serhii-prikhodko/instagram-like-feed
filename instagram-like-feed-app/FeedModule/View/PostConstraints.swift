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
        self.setupImageUIImageView()
    }
    func setupContainerView() {
        self.viewContainer.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().labeled("viewContainerEdges")
            make.centerX.equalToSuperview().labeled("viewContainerCenterX")
            make.centerY.equalToSuperview().labeled("viewContainerCenterY")
            make.height.equalTo(400).labeled("viewContainerHeight")
        }
        self.viewContainer.backgroundColor = .white
    }
    func setupPostTopBar() {
        self.postTopBarView.snp.makeConstraints { (make) in
            make.leading.trailing.equalTo(contentView.safeAreaLayoutGuide).labeled("postTopBarViewTrailing")
            make.top.equalTo(0).labeled("postTopBarViewTop")
            make.height.equalTo(50).labeled("postTopBarViewHeight")
        }
        self.postTopBarView.backgroundColor = .white
        
        
    }
    func setupUserAvatar() {
        self.userAvatarImageView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview().labeled("userAvatarImageViewCenterY")
            make.left.equalTo(5).labeled("userAvatarImageViewLeft")
            make.height.width.equalTo(40).labeled("userAvatarImageViewHeightAndWidth")
        }
    }
    func setupUserName() {
        self.userNameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.userAvatarImageView).labeled("userNameLabelTop")
            make.left.equalTo(self.userAvatarImageView.snp.right).offset(5).labeled("userNameLabelLeft")
        }
    }
    func setupPostLocation() {
        self.postLocationLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.userNameLabel.snp.bottom).offset(5).labeled("postLocationLabelTop")
            make.left.equalTo(self.userAvatarImageView.snp.right).offset(5).labeled("postLocationLabelLeft")
        }
    }
    func setupPostImageBar() {
        self.postImageBarView.snp.makeConstraints { (make) in
            make.top.equalTo(self.postTopBarView.snp.bottom).labeled("postImageBarViewTop")
            make.trailing.leading.equalToSuperview().labeled("postImageBarViewTrailingAndLeading")
            //make.height.equalTo(40)
        }
    }
    func setupImageUIImageView() {
        self.postUIImageView.snp.makeConstraints { (make) in
            make.trailing.leading.equalToSuperview().labeled("postUIImageViewTrailingAndLeading")
            make.height.equalTo(320).labeled("postUIImageViewHeight")
        }
    }
}
