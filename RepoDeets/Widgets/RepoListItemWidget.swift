//
//  RepoListItemWidget.swift
//  RepoDeets
//
//  Created by Antonio Butigan on 23.04.2022..
//

import SwiftUI
import SDWebImageSwiftUI

struct RepoListItemWidget: View {
    
    @ObservedObject private var repoViewModel = RepoDataViewModel()
    
    @State var repoName: String = "Repo Name"
    @State var repoUpdate: Date = Date.now
    
    var body: some View {
        
        HStack{
            
            Text(repoName).font(Font.custom("Courier", size: 14))
            Spacer()
            Text(repoUpdate, style: .date)
                .font(.footnote)
                .fontWeight(.light).italic()
            
        }.lineLimit(1)
              
    }
}
