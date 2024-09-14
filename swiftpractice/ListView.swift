//
//  ListView.swift
//  swiftpractice
//
//  Created by Vishal Sharma on 01/09/24.
//

import SwiftUI

struct ListView: View {
    @State var fruits: [String] = [
        "apples", "mango", "banana", "orange" ]
    
    @State var veggies: [String] = [
        "tomato", "potato", "carrots"
    ]
    
    @State var showAlert: Bool = false
    @State var backgroundColor = Color.red.opacity(0.4)
    @State var alertMessage: String = ""
    @State var alertTitle: String = ""
    
    
    
    var body: some View {
        NavigationView(content: {
            //            List {
            //                Section(
            //                    header: Text("Fruits")) {
            //                        ForEach( fruits, id: \.self)
            //                        {
            //                            fruits in Text(fruits.capitalized)
            //                        }
            //                        .onDelete(perform: delete)
            //                        .onMove(perform: { indices, newOffset in
            //                            move(indices: indices, newOffset: newOffset)
            //                        })
            //                    }
            //
            //                Section(
            //                    header: Text("Vegetables")) {
            //                        ForEach( veggies, id: \.self)
            //                        {
            //                            veggies in Text(veggies.capitalized)
            //                        }
            //                        .onDelete(perform: delete)
            //                        .onMove(perform: { indices, newOffset in
            //                            move(indices: indices, newOffset: newOffset)
            //                        })
            //                    }
            //            }
            //            .navigationTitle("Grovcery List")
            //            .navigationBarItems( leading: EditButton(), trailing: addButton)
            
            ZStack {
                backgroundColor.opacity(0.7).ignoresSafeArea(.all)
                
                VStack {
                    Button("Click here"){
                        alertTitle = "title for button 1"
                        alertMessage = "message for button 1"
                        showAlert.toggle()
                    }
                    
                    Button("Click here too"){
                        alertTitle = "title for button 2"
                        alertMessage = "message for button 2"
                        showAlert.toggle()
                    }
                    
                }
                .alert(isPresented: $showAlert) {
                    getAlert()
                }
            }
            //            .alert(isPresented: $showAlert, content: {
            //                Alert(title: Text("There's an error!"))
            //            })
        })
    }
    
    //    var addButton: some View {
    //            Button("Add", action: {
    //                add()
    //            })
    //    }
    //
    //    func delete(indexSet: IndexSet){
    //        fruits.remove(atOffsets: indexSet)
    //    }
    //
    //    func move(indices: IndexSet, newOffset: Int) {
    //        fruits.move(fromOffsets: indices, toOffset: newOffset)
    //    }
    //
    //    func add(){
    //        fruits.append("Coconut")
    //    }
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle),
                     message: Text(alertMessage),
                     primaryButton: .destructive(Text("Destructive Action"), action: {
            backgroundColor = Color.yellow.opacity(0.7)
        }),
                     //                          primaryButton: .destructive(Text("DELETE")),
                     secondaryButton: .cancel())
    }
    
}

#Preview {
    ListView()
}

