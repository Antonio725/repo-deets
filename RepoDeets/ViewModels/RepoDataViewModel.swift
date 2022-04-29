//
//  RepoDataViewModel.swift
//  RepoDeets
//
//  Created by Antonio Butigan on 22.04.2022..
//

import Foundation
import Combine

class RepoDataViewModel : ObservableObject {
    
    @Published private(set) var repoData: RepoData? = nil
    
    private var cancellable: Set<AnyCancellable> = []
    
    func retrieveData(username: String, page: Int, perPage: Int, callback: () -> Void) {
        
        guard let url = URL(string: "https://api.github.com/search/repositories?q=\(username)&page=\(page)&per_page=\(perPage)") else {
            fatalError("Invalid URL")
        }
        
        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .iso8601
        
        URLSession.shared
            .dataTaskPublisher(for: url)
            .tryMap({$0.data})
            .decode(type: RepoData.self, decoder: jsonDecoder)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: {print($0)}, receiveValue: {self.repoData = $0})
            .store(in: &cancellable)
        
        callback()
    }
    
}
