//
//  ModelBootcamp.swift
//  swiftpractice
//
//  Created by Vishal Sharma on 10/04/24.
//

import SwiftUI

struct Users: Identifiable {
    let id : String = UUID().uuidString
    let displayName : String
    let userName : String
    let followerCount : Int
    let verified : Bool
}

struct ModelBootcamp: View {
    
//    @State var users : [String] = [
//        "vishal", "vicky", "vidit", "chanchal"
//    ]

    @State var users : [Users] = [
        Users(displayName : "vishal", userName : "vishalx06", followerCount: 300, verified : false),
        Users(displayName : "vidit", userName : "vidit9603", followerCount: 400, verified : false),
        Users(displayName : "vicky", userName : "vishal007", followerCount: 500, verified : true),
        Users(displayName : "chanchal", userName : "swamichan93", followerCount: 600, verified : true)
    ]
    
    var body: some View {
        NavigationView {
            List{
                ForEach(users) { user in
                    HStack (spacing: 15) {
                        Circle()
                            .frame(width: 35, height: 35)
                        
                        VStack(alignment: .leading) {
                            VStack {
                                HStack {
                                    Text(user.displayName.capitalized)
                                    if(user.verified){
                                        Image(systemName: "checkmark.seal.fill")
                                            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                                    }
                                    
                                }
                            }
                            
                            Text("@\(user.userName)")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        
                        Spacer()
                        
                        VStack(alignment: .trailing) {
                            Text("\(user.followerCount)")
                            
                            Text("Followers")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                    }
                    .padding(.vertical, 10)
                }
            }
            .navigationTitle("Users")
        }
        
//        NavigationView {
//            List{
//                ForEach(users, id: \.self) { name in
//                    HStack (spacing: 15) {
//                        Circle()
//                            .frame(width: 35, height: 35)
//                        Text(name.capitalized)
//                    }
//                    .padding(.vertical, 10)
//                }
//            }
//            .navigationTitle("Users")
//        }
    }
}

#Preview {
    ModelBootcamp()
}
