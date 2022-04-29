//
//  RepoDetailDateRowWidget.swift
//  RepoDeets
//
//  Created by Antonio Butigan on 29.04.2022..
//

import SwiftUI

struct RepoDetailDateRowWidget: View {
    
    @State var rowData1: String
    @State var rowData2: Date
    
    var body: some View {
        
        HStack(spacing: 10){
            
            Text(rowData1).italic()
            Spacer()
            VStack(spacing: 5){
                Text(rowData2, style: .date).font(Font.custom("Courier", size: 14)).lineLimit(1)
                Text(rowData2, style: .time).font(Font.custom("Courier", size: 14)).lineLimit(1)
            }
            
        }.padding(.horizontal).frame(height: 50)
        
    }
}
