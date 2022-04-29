//
//  AboutScreen.swift
//  RepoDeets
//
//  Created by Antonio Butigan on 26.04.2022..
//

import SwiftUI

struct AboutScreen: View {
    @Binding var isDarkMode: Bool
    
    var body: some View {
        VStack(){
            
            Spacer()
            Toggle("Dark Mode", isOn: $isDarkMode)
                .toggleStyle(SwitchToggleStyle(tint: .purple))
                .padding()
            
            Spacer()
            Text("Made by Antonio Butigan using the Github API. All images and icons belong to Unsplash & Icons8.").font(.footnote).italic().multilineTextAlignment(.center)
            
        }.padding()
    }
}

