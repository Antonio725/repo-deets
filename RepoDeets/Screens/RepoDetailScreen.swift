//
//  RepoDetailScreen.swift
//  RepoDeets
//
//  Created by Antonio Butigan on 27.04.2022..
//

import SwiftUI

struct RepoDetailScreen: View {
    
    @State var repoName: String
    @State var lastUpdate: Date
    @State var ownerName: String
    @State var repoDescription: String
    @State var ownerIcon: String
    
    let row1: String = "Repo Name:"
    let row2: String = "Last Updated:"
    let row3: String = "Owner Name:"
    let row4: String = "Description:"
    
    var body: some View {
        
        VStack(spacing: 30){
            
            Spacer()
            OwnerIconWidget(ownerIcon: ownerIcon)
            Text(ownerName + " / " + repoName).font(Font.custom("Courier", size: 24)).multilineTextAlignment(.center).lineLimit(2)
            
            ZStack{
                
                RoundedRectangle(cornerRadius: 20).fill(Color.indigo)
                
                VStack{
                    
                    Spacer()
                    RepoDetailRowWidget(rowData1: row1, rowData2: repoName)
                    Divider().background(Color.black)
                    RepoDetailDateRowWidget(rowData1: row2, rowData2: lastUpdate)
                    Divider().background(Color.black)
                    RepoDetailRowWidget(rowData1: row3, rowData2: ownerName)
                    Divider().background(Color.black)
                    RepoDetailRowWidget(rowData1: row4, rowData2: repoDescription)
                    Spacer()
                    
                }
            }.frame(height: 200).padding()
            
            Spacer()
            
        }.padding()
        
    }
}
