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
    static let identifier = "PostTableViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "PostTableViewCell", bundle: nil)
    }
    
    // MARK: Outlets
    lazy var userAvatarImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.layer.borderWidth = 1.0
        imageView.layer.borderColor = UIColor.gray.cgColor
        imageView.backgroundColor = .green
        imageView.layer.masksToBounds = false
        imageView.layer.cornerRadius = 20
        self.postTopBarView.addSubview(imageView)
        
        return imageView
    }()
    lazy var userNameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .left
        label.text = "sergey_privet"
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        self.postTopBarView.addSubview(label)
        
        return label
    }()
    lazy var postLocationLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .left
        label.text = "Dnipro City Center"
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        //label.font = UIFont(name: "Chalkboard SE Regular 25.0", size: 12)
        self.postTopBarView.addSubview(label)
        
        return label
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
    lazy var postImageBarView: UIView = {
        let uiView = UIView(frame: .zero)
        uiView.backgroundColor = .blue
        contentView.addSubview(uiView)
        
        return uiView
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupConstraints()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
