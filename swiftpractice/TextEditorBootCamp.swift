//
//  TextEditorBootCamp.swift
//  swiftpractice
//
//  Created by Vishal Sharma on 07/09/24.
//

import SwiftUI

struct TextEditorBootCamp: View {
    @State var textEditorText: String = "This is the text editor field"
    @State var saveData: String = ""
    
    var body: some View {
        NavigationView {
            VStack{
                TextEditor(text: $textEditorText)
                    .padding()
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(10)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .frame(height: 400)
                
                Button(action: {
                    saveDataInArray()
                }, label: {
                    Text("Button")
                        .padding()
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .font(.headline)
                        .cornerRadius(10)
                })
                
                Text(saveData)
                
                Spacer()
            }
            .padding()
            .navigationTitle("TextEditor BootCamp!!")
        }
        
    }
        func saveDataInArray() {
          saveData = textEditorText
       }
    
}

#Preview {
    TextEditorBootCamp()
}
