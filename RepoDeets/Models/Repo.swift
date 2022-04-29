//
//  Repo.swift
//  RepoDeets
//
//  Created by Antonio Butigan on 22.04.2022..
//

import Foundation

struct Repo: Codable, Identifiable {
    let id: Int
    let name: String
    let description: String?
    let url: String
    let owner: RepoOwner
    let updated: Date
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case description = "description"
        case url = "url"
        case owner = "owner"
        case updated = "updated_at"
    }
}
