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
        self.setupMoreButton()
        self.setupPostLocation()
        self.setupPostImageBar()
        self.setupImageUIImageView()
        self.setupPostBottomBar()
        self.setupPostBottomBarItems()
        self.setupPostCommentsView()
    }
    func setupContainerView() {
        self.viewContainer.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().priority(999).labeled("viewContainerEdges")
            make.centerX.equalToSuperview().labeled("viewContainerCenterX")
            make.centerY.equalToSuperview().labeled("viewContainerCenterY")
            make.height.equalTo(437).labeled("viewContainerHeight")
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
    func setupMoreButton() {
        self.moreButton.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview().labeled("moreButtonCenterY")
            make.width.equalTo(13).labeled("moreButtonWidth")
            make.height.equalTo(3).labeled("moreButtonHeight")
            make.trailing.equalTo(-5).labeled("moreButtonTrailing")
        }
    }
    func setupPostImageBar() {
        self.postImageBarView.snp.makeConstraints { (make) in
            make.top.equalTo(self.postTopBarView.snp.bottom).labeled("postImageBarViewTop")
            make.trailing.leading.equalToSuperview().labeled("postImageBarViewTrailingAndLeading")
        }
    }
    func setupImageUIImageView() {
        self.postUIImageView.snp.makeConstraints { (make) in
            make.trailing.leading.equalToSuperview().labeled("postUIImageViewTrailingAndLeading")
            make.height.equalTo(320).labeled("postUIImageViewHeight")
        }
    }
    func setupPostBottomBar() {
        self.postBottomBarView.snp.makeConstraints { (make) in
            make.leading.trailing.equalTo(contentView.safeAreaLayoutGuide).labeled("postBottomBarViewTrailingAndLeading")
            make.bottom.equalTo(0).labeled("postBottomBarViewTop")
            make.height.equalTo(67).labeled("postBottomBarViewHeight")
        }
    }
    func setupPostBottomBarItems() {
        // Setup like button constraints
        self.likeButton.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(5).labeled("likeButtonTop")
            make.leading.equalTo(5).labeled("likeButtonLeading")
            make.width.height.equalTo(40).labeled("likeButtonWidthAndHeight")
        }
        
        // Setup comment button constraints
        self.commentButton.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(5).labeled("commentButtonTop")
            make.left.equalTo(self.likeButton.snp.right).labeled("commentButtonLeft")
            make.width.height.equalTo(40).labeled("commentButtonWidthAndHeight")
        }
        
        // Setup message button constraints
        self.sendMessageButton.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(5).labeled("sendMessageButtonTop")
            make.left.equalTo(self.commentButton.snp.right).labeled("sendMessageButtonLeft")
            make.width.height.equalTo(40).labeled("sendMessageButtonWidthAndHeight")
        }
        
        // Setup collect button constraints
        self.collectButton.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(5).labeled("collectButtonTop")
            make.right.equalTo(-5).labeled("collectButtonLeft")
            make.width.height.equalTo(40).labeled("collectButtonWidthAndHeight")
        }
        
        // Setup collect like counter label constraints
        self.likeCounterLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.likeButton.snp.bottom).offset(5).labeled("likeCounterLabelTop")
            make.left.equalTo(5).labeled("likeCounterLabelLeft")
        }
    }
    func setupPostCommentsView() {
        self.postCommentsView.snp.makeConstraints { (make) in
            make.top.equalTo(self.postBottomBarView.snp.bottom).labeled("postCommentsViewTop")
            make.left.right.equalToSuperview().labeled("postCommentsViewLeftAndRigth")
        }
    }
}
