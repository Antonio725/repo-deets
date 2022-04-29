//
//  RepoOwner.swift
//  RepoDeets
//
//  Created by Antonio Butigan on 23.04.2022..
//

import Foundation

struct RepoOwner: Codable{
    
    let name: String
    let icon: String
    
    enum CodingKeys: String, CodingKey {
        case name = "login"
        case icon = "avatar_url"
    }
    
}
