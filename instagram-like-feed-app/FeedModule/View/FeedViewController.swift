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
    
    //MARK: Properties
    var tableView: UITableView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.edgesForExtendedLayout = []
        self.prepareNavigationButtons()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "PostTableViewCell")
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

extension FeedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath)
        
        return cell
    }
}

extension FeedViewController: UITableViewDelegate {
    
}

