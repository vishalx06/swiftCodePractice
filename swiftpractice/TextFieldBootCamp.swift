//
//  TextFieldBootCamp.swift
//  swiftpractice
//
//  Created by Vishal Sharma on 07/09/24.
//

import SwiftUI

struct TextFieldBootCamp: View {
    @State var textField: String = ""
    @State var saveData: [String] = []
    
    var body: some View {
        NavigationView {
            VStack{
                TextField("Type Something here.....", text: $textField)
                    .padding()
                    .background(Color.gray.opacity(0.4).cornerRadius(10))
                    .foregroundColor(.primary)
                    .font(.headline)
                
                Button(action: {
                    saveText()
                }, label: {
                    Text("Save".uppercased())
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(validateText() ? Color.blue: Color.gray)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .font(.headline)
                })
                .disabled(!validateText())
                
                ForEach(saveData, id: \.self) { data in
                    Text(data)
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("TextField BootCamp!")
        }
    }
    
    func validateText() -> Bool {
        if( textField.count >= 3) {
            return true
        }
        return false
    }
    
    func saveText() {
        if(validateText()){
            saveData.append(textField)
            textField = ""
        }
        
    }
}

#Preview {
    TextFieldBootCamp()
}
