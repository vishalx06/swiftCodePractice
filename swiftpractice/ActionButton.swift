//
//  ActionButton.swift
//  swiftpractice
//
//  Created by Vishal Sharma on 02/09/24.
//

import SwiftUI

struct ActionButton: View {
    
    @State var showActionSheet: Bool = false
    
    @State var backgroundColor: Color = Color.gray
    
    var body: some View {
            VStack {
                HStack {
                    Circle()
                        .frame(width: 40, height: 30)
                    Text("@user.name")
                    Spacer()
                }
                .padding(.horizontal)
                
                Rectangle()
                    .aspectRatio(1.0, contentMode: .fit)
            }
            .confirmationDialog("This is the title", isPresented: $showActionSheet) {
                Button("Red") { backgroundColor = .red }
                Button("Green") { backgroundColor = .green }
                Button("Yellow") { backgroundColor = .yellow }
                Button("Remove color", role: .destructive) { backgroundColor = .clear }
                Button("Cancel", role: .cancel) { }
            }
         message: {
            Text("This is the message")
        }
    }
}

#Preview {
    ActionButton()
}
