//
//  AppStorageBootcamp.swift
//  swiftpractice
//
//  Created by Vishal Sharma on 11/04/24.
//

import SwiftUI

struct AppStorageBootcamp: View {
    
    @AppStorage("name") var currentUserName : String?
    
    var body: some View {
        VStack{
            Text(currentUserName ?? "Add User Name")
            
            if let name = currentUserName {
                Text(name)
            }
            
            Button("Save".uppercased()){
                let name : String = "Vishal"
                currentUserName = name
            }
        }
    }
}

#Preview {
    AppStorageBootcamp()
}
