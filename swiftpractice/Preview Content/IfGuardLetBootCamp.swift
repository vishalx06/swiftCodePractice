//
//  IfGuardLetBootCamp.swift
//  swiftpractice
//
//  Created by Vishal Sharma on 10/04/24.
//

import SwiftUI

struct IfGuardLetBootCamp: View {
    
    @State var displayText: String? = nil
    @State var isLoaded : Bool = false
    @State var loggedInUser : String? = "test user"
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Here we are practicing safe ")
                if let text = displayText {
                    Text(text)
                        .font(.title)
                }
                
                if isLoaded {
                    ProgressView()
                }
                
                Spacer()
                    .navigationTitle("If & Guard")
                    .onAppear{
                        loadData2()
                    }
            }
        }
    }
    
    func loadData() {
        if let userId = loggedInUser {
            isLoaded = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                displayText = "This is the new data! \(userId)"
                isLoaded = false
            }
        } else {
            displayText = "Error There is no user ID!"
        }
    }
    
    func loadData2() {
        guard let userId = loggedInUser else {
            displayText = "Error There is no user ID!"
            return
        }
        isLoaded = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            displayText = "This is the new data! \(userId)"
            isLoaded = false
        }
    }
}

#Preview {
    IfGuardLetBootCamp()
}
