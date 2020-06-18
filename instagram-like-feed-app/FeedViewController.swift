//
//  ViewController.swift
//  instagram-like-feed-app
//
//  Created by Serhiy Prikhodko on 11.06.2020.
//  Copyright © 2020 Serhiy Prikhodko. All rights reserved.
//

import UIKit
import SnapKit

class FeedViewController: UIViewController {
    
    // MARK: Properties
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
        view.addSubview(uiView)
        
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
        view.addSubview(uiView)
        
        return uiView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupConstraints()
        self.edgesForExtendedLayout = []
        self.prepareNavigationButtons()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    func prepareNavigationButtons() {
        // Set bar button items for navigation controller
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named:"camera_icon"), style: .plain, target: self, action: #selector(cameraButtonTapped))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named:"direct_icon"), style: .plain, target: self, action: #selector(directButtonTapped))
        
        //Set instagram logo as navigation bar title
        let logo = UIImage(named: "instagram_logo")
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView
    }
    @objc func cameraButtonTapped() {}
    @objc func directButtonTapped() {}
}

