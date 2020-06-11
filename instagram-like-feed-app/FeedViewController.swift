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

    override func viewDidLoad() {
        super.viewDidLoad()
        let subview = UIView()
        view.addSubview(subview)
        subview.snp.makeConstraints { (make) in
            make.top.equalTo(view)
            make.bottom.equalTo(view)
            make.left.equalTo(view)
            make.right.equalTo(view)
        }
        subview.backgroundColor = .white
    }
}

