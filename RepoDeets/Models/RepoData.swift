//
//  RepoData.swift
//  RepoDeets
//
//  Created by Antonio Butigan on 22.04.2022..
//

import Foundation

struct RepoData: Codable {
    let count: Int?
    let repos: [Repo]?
    
    enum CodingKeys: String, CodingKey {
        case count = "total_count"
        case repos = "items"
    }
}


