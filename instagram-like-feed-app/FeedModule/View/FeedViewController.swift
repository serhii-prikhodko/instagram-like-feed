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
    var presenter: FeedViewPresenterProtocol!
    var cellID = "PostTableViewCellID"
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.edgesForExtendedLayout = []
        self.prepareNavigationButtons()
        self.prepareTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    func prepareTableView() {
        self.tableView = UITableView(frame: .zero)
        self.view.addSubview(tableView)
        self.tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        self.tableView.register(PostTableViewCell.self, forCellReuseIdentifier: cellID)
        //self.tableView.register(UINib(nibName: "PostTableViewCell", bundle: nil), forCellReuseIdentifier: cellID);
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.rowHeight = UITableView.automaticDimension
        //self.tableView.estimatedRowHeight = 600
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
        
        return self.presenter.posts?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! PostTableViewCell
        let post = self.presenter.posts?[indexPath.row]
        cell.update(with: post)
        
        return cell
    }
}

extension FeedViewController: UITableViewDelegate {
    
}

extension FeedViewController: FeedViewProtocol {
    func success() {
        tableView.reloadData()
    }
    
    func failure(error: Error) {
        print(error)
    }
}
