//
//  RepoDetailRowWidget.swift
//  RepoDeets
//
//  Created by Antonio Butigan on 29.04.2022..
//

import SwiftUI

struct RepoDetailRowWidget: View {
    
    @State var rowData1: String
    @State var rowData2: String
    
    var body: some View {
    
        HStack(spacing: 10){
            
            Text(rowData1).italic()
            Spacer() 
            Text(rowData2).font(Font.custom("Courier", size: 14)).lineLimit(3)
            
        }.padding(.horizontal).frame(height: 50)
        
    }
}
