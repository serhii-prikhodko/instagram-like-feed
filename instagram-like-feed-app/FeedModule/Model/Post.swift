//
//  Post.swift
//  instagram-like-feed-app
//
//  Created by Serhiy Prikhodko on 21.06.2020.
//  Copyright © 2020 Serhiy Prikhodko. All rights reserved.
//

import Foundation

struct Posts: Codable {
    var data: [Post]?
}

struct Post: Codable {
    var comments: [Comment]?
    var tags: [String]?
    var location: String?
    var createdTime: Int?
    var images: [Image]?
    var userHasLiked: Bool?
    var id: String?
    var likesCounter: Int?
    var user: User?
    
    enum CodingKeys : String, CodingKey {
        case createdTime = "created_time"
        case userHasLiked = "user_has_liked"
        case likesCounter = "likes_counter"
    }
}

struct Comment: Codable{
    var userName: String?
    var profilePicture: String?
    var id: Int?
    var createdTime: Int?
    var text: String?
    
    enum CodingKeys : String, CodingKey {
        case userName = "username"
        case profilePicture = "profile_picture"
        case createdTime = "created_time"
    }
}

struct Image: Codable{
    var url: String?
    var width: Int?
    var height: Int?
}

struct User: Codable {
    var userName: String?
    var profilePicture: String?
    var id: Int?
    var createdTime: Int?
    var text: String?
    var fullName: String?
    
    enum CodingKeys : String, CodingKey {
        case userName = "username"
        case profilePicture = "profile_picture"
        case createdTime = "created_time"
        case fullName = "full_name"
    }
}
