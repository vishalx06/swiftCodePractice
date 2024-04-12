//
//  TabViewBootCamp.swift
//  swiftpractice
//
//  Created by Vishal Sharma on 09/04/24.
//

import SwiftUI

struct TabViewBootCamp: View {
    
    @State var selectedTab : Int = 2
    
    var body: some View {
        TabView(selection: $selectedTab){
            ExtractedView(selectedTab: $selectedTab)
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                .tag(0)
            Text("BROWSER TAB")
                .tabItem {
                    Image(systemName: "globe")
                    Text("Browser")
                }
                .tag(1)
            Text("PROFILE TAB")
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
                .tag(2)
        }
        .accentColor(.pink)
    }
}

#Preview {
    TabViewBootCamp()
}

struct ExtractedView: View {
    
    @Binding var selectedTab : Int
    
    var body: some View {
        ZStack{
            Color.red
                .opacity(0.4)
            .ignoresSafeArea()
            
            VStack {
                Text("Home Tab")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                
                Button(action: {
                    selectedTab = 1
                }, label: {
                    Text("Go To Browser")
                        .font(.headline)
                        .foregroundColor(.red)
                        .frame(width: 200, height: 100)
                        .background(Color.white)
                        .cornerRadius(35)
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                })
            }
        }
    }
}
