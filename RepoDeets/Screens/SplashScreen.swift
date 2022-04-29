//
//  SplashScreen.swift
//  RepoDeets
//
//  Created by Antonio Butigan on 28.04.2022..
//

import SwiftUI



struct SplashScreen: View {
    
    @State private var isActive: Bool = false
    @State private var isDarkMode: Bool = true
    
    struct Wallpaper: Identifiable {
        let id: Int
        let imageName: String
    }
    
    let wallpapers = [
        Wallpaper(id: 0, imageName: "wp0"),
        Wallpaper(id: 1, imageName: "wp1"),
        Wallpaper(id: 2, imageName: "wp2"),
        Wallpaper(id: 3, imageName: "wp3"),
        Wallpaper(id: 4, imageName: "wp4"),
    ]
    
    var body: some View {
        VStack {
            
            if self.isActive {
                HomeScreen(isDarkMode: $isDarkMode)
            } else {
                
                ZStack {
                    Image(wallpapers[Int.random(in: 0..<wallpapers.count)].imageName)
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                        .brightness(-0.1)
                    
                    VStack(spacing: 10){
                        Text("Welcome to").foregroundColor(Color.white).italic()
                        Image("github")
                        Text("Repo Deets").foregroundColor(Color.white).font(Font.custom("AmericanTypewriter", size: 40)).italic().bold()
                        
                    }
                    
                }
            }
        }.onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}
