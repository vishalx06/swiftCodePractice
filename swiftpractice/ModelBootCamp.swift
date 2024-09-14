//
//  ModelBootCamp.swift
//  swiftpractice
//
//  Created by Vishal Sharma on 08/09/24.
//

import SwiftUI

struct UserInfo: Identifiable {
    let id: String = UUID().uuidString
    let name: String
    let userId: String
    let followers: Int
}

struct ModelBootCamp: View {
    
    @State var userIds: [UserInfo] = [
    UserInfo(name: "Vishal", userId: "vishalx06", followers: 222),
    UserInfo(name: "Chanchal", userId: "chanchal123", followers: 221),
    UserInfo(name: "Vidit", userId: "vidit999", followers: 223),
    UserInfo(name: "Vicky", userId: "vickey07", followers: 225)
    ]
    
    @State var users: [String] = [
        "Vishal", "Chanchal", "Vidit", "Vicky"
    ]
    var body: some View {
        
        NavigationView {
            List{
                ForEach(userIds) { user in
                    HStack {
                        Circle()
                            .frame(width: 30, height: 30)
                        VStack {
                            Text(user.name)
                                .multilineTextAlignment(.leading)
                                .lineLimit(nil)
                                
                                
                                
                            Text("@\(user.userId)")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        
                        VStack{
                            Text("\(user.followers)")
                            Text("Followers")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                    }
                    .padding(.vertical, 10)
                    .navigationTitle("Users")
                }
//                ForEach(users, id: \.self){ user in
//                    HStack {
//                        Circle()
//                            .frame(width: 30, height: 30)
//                        Text(user)
//                    }
//                    .padding(.vertical, 10)
//                    .navigationTitle("Users")
//                }
            }
            
        }
    }
}

#Preview {
    ModelBootCamp()
}
