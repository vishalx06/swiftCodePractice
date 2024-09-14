//
//  IfLetGuardBootCamp.swift
//  swiftpractice
//
//  Created by Vishal Sharma on 07/09/24.
//

import SwiftUI

struct IfLetGuardBootCamp: View {
    
    @State var title1: String? = "user2"
    @State var isLoading: Bool = false
    @State var currentUserId: String? = nil
    
    var body: some View {
        NavigationView {
            VStack{
                Text("This is the coding practice")
                if let display = title1 {
                    Text(display)
                        .font(.title)
                }
                if isLoading{
                    ProgressView()
                }
                
                Spacer()
            }
            .navigationTitle("Safe Coding!!")
            .onAppear{
                loadData()
            }
        }
    }
        func loadData() {
            if let userId = currentUserId {
                isLoading = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 3){
                    title1 = "This is the new data!!  \(userId)"
                    isLoading = false
                }
            } else {
                title1 = "Error this the not valid"
            }
    }
    
    func loadData2(){
        guard let userId = currentUserId else {
            title1 = "Error this the not valid"
            return
        }
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3){
            title1 = "This is the new data!!: \(userId) "
            isLoading = false
        }
    }
}

#Preview {
    IfLetGuardBootCamp()
}
