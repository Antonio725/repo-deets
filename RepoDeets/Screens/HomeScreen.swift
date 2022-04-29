//
//  HomeScreen.swift
//  RepoDeets
//
//  Created by Antonio Butigan on 22.04.2022..
//

import SwiftUI

struct HomeScreen: View {
    
    @ObservedObject private var repoViewModel = RepoDataViewModel()
    
    @Binding var isDarkMode: Bool
    
    @State private var showList: Bool = false
    @State private var userName: String = "Ingemark"
    @State private var page: Int = 1
    @State private var showGithub: Bool = true
    @State private var showPagination: Bool = false
    @State private var isLoading: Bool = false
    @State private var numberOfPages: Int = 0
    @State private var paginationDisabled: Bool = false
    @State private var showingAlert: Bool = false
    @State private var perPage: Int = 20
    private let quantity = [10, 20, 30]
    
    func increaseNum() {
        paginationDisabled = false
        page = page + 1
    }
    
    func decreaseNum() {
        paginationDisabled = false
        page = page - 1
    }
    
    var body: some View {
        
        NavigationView{
            
            VStack(spacing: 20) {
                
                if(showGithub){ Image("github")}
                
                if(showList){ Spacer()}
                
                // Although it would be a better practice to make the textfield, search button, list and pagination into their own separate widgets, I left it in the Home screen because I was playing with pagination way too much, as I had to calculate it and add a callback. I wanted all View Model communication to be within this screen.
                TextField("Type a Keyword...", text: $userName)
                    .multilineTextAlignment(.center)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.purple, lineWidth: 2)
                    )
                    .onSubmit {
                        guard userName.isEmpty == false else { return showingAlert = true}
                        guard (userName.count < 4) == false else { return showingAlert = true}
                        repoViewModel.retrieveData(username: userName, page: page, perPage: perPage, callback: {})
                        withAnimation{
                            showGithub = false
                            showList = true
                            showPagination = true
                        }
                    }.font(Font.custom("Courier", size: 16))
                
                
                Button("Search Repos") {
                    guard userName.isEmpty == false else { return showingAlert = true}
                    guard (userName.count < 4) == false else { return showingAlert = true}
                    
                    repoViewModel.retrieveData(username: userName, page: page, perPage: perPage, callback: {})
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        withAnimation{
                            showingAlert = false
                            showGithub = false
                            showList = true
                            showPagination = true
                        }
                    }
                }.alert("Please type more than 3 letters", isPresented: $showingAlert) {
                    Button("OK", role: .cancel) { }
                }
                
                if(showList){
                    // Allows the user to modify how many repo's should load at a time
                    Picker("Repo Quantity", selection: $perPage) {
                        ForEach(quantity, id: \.self) {
                            Text(String($0))
                        }
                    }
                    .pickerStyle(.menu).onChange(of: perPage, perform: { (value) in
                        repoViewModel.retrieveData(username: userName, page: page, perPage: perPage, callback: {})
                    })
                    
                    
                    List{
                        
                        Section{
                            
                            // Sorting the latest updated repos on top
                            ForEach(repoViewModel.repoData?.repos?.sorted(by: {
                                ($0.updated).compare($1.updated) == .orderedDescending
                            }) ?? []) { repo in
                                
                                // Sending data to detail screen ( if user chooses to go there)
                                NavigationLink(destination: RepoDetailScreen(repoName: repo.name, lastUpdate: repo.updated, ownerName: repo.owner.name, repoDescription: repo.description ?? "A Repository", ownerIcon: repo.owner.icon)) {
                                    
                                    // Displaying the list row widget
                                    RepoListItemWidget(repoName: repo.name, repoUpdate: repo.updated)
                                    
                                }
                            }.listRowSeparatorTint(Color.purple)
                        } header: {
                            HStack{
                                Text("Repo Names")
                                Spacer()
                                Text("Last Updated")
                            }
                        } footer: {
                            HStack{
                                Text("\(repoViewModel.repoData?.repos?.count ?? 0) repo's listed")
                                Spacer()
                                Text("\(repoViewModel.repoData?.count ?? 0) total repo's")
                            }
                        }
                        
                        
                    }.refreshable {
                        repoViewModel.retrieveData(username: userName, page: page, perPage: perPage, callback: {} )
                    }.listStyle(.insetGrouped).background(Color.white)
                }
                
                
                // Pagination Block (Sending a new request for the next or previous page of the data)
                if(showPagination){
                    Spacer()
                    HStack{
                        
                        Spacer()
                        
                        Button("Last Page") {
                            paginationDisabled = true
                            repoViewModel.retrieveData(username: userName, page: page - 1, perPage: perPage, callback: decreaseNum )
                            
                        }.disabled(page == 1 || paginationDisabled)
                        
                        Spacer()
                        
                        Text(String(page)).font(.title2)
                        
                        Spacer()
                        
                        Button("Next Page") {
                            paginationDisabled = true
                            repoViewModel.retrieveData(username: userName, page: page + 1, perPage: perPage, callback: increaseNum )
                            
                            
                        }.disabled(page >= ((repoViewModel.repoData?.count ?? 0) / perPage) + 1 || paginationDisabled)
                        
                        Spacer()
                    }
                }
                
            }.padding()
                .navigationBarTitle("Repo Deets")
                .navigationBarItems(trailing:
                                        NavigationLink(destination: AboutScreen(isDarkMode: $isDarkMode)) {
                    Image(systemName: "gearshape").tint(Color.purple)
                })
            
        }.preferredColorScheme(isDarkMode ? .dark : .light)
            .accentColor(.purple)
        
    }
    
}
