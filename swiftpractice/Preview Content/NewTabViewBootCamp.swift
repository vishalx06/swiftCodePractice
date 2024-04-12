//
//  NewTabViewBootCamp.swift
//  swiftpractice
//
//  Created by Vishal Sharma on 09/04/24.
//

import SwiftUI

struct NewTabViewBootCamp: View {
    
    let icons: [String] = [
        "heart.fill", "globe", "house.fill", "person.fill"
    ]
    
    var body: some View {
        TabView{
            ForEach(icons, id: \.self) { icons in
                Image(systemName: icons)
                    .resizable()
                    .scaledToFit()
                    .padding(20)
            }
            .foregroundColor(.white)
            .background(Color.pink)
//            RoundedRectangle(cornerRadius: 25.0)
//                .foregroundColor(.purple)
//            RoundedRectangle(cornerRadius: 25.0)
//                .foregroundColor(.primary)
//            RoundedRectangle(cornerRadius: 25.0)
//                .foregroundColor(.pink)
        }
        .frame(height: 300)
        .tabViewStyle(PageTabViewStyle())
    }
}

#Preview {
    NewTabViewBootCamp()
}
