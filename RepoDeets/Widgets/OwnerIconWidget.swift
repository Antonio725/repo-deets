//
//  OwnerIconWidget.swift
//  RepoDeets
//
//  Created by Antonio Butigan on 29.04.2022..
//  

import SwiftUI
import SDWebImageSwiftUI

struct OwnerIconWidget: View {
    
    @State var ownerIcon: String
    
    var body: some View {
        
        WebImage(url: URL(string: ownerIcon ))
            .resizable()
            .placeholder(Image(systemName: "photo"))
            .placeholder {
                ZStack{
                    Rectangle().foregroundColor(Color.white)
                    ProgressView().progressViewStyle(CircularProgressViewStyle(tint: Color.blue)).scaleEffect(3)
                }
            }
            .indicator(.activity)
            .transition(.fade(duration: 0.5))
            .scaledToFit()
            .frame(width: 120)
        
    }
}
