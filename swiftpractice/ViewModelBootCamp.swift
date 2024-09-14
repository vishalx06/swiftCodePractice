//
//  ViewModelBootcamp.swift
//  swiftpractice
//
//  Created by Vishal Sharma on 11/04/24.
//

import SwiftUI

struct FruitModel : Identifiable {
    let id : String = UUID().uuidString
    let count : Int
    let fruitName : String
}

class FruitViewModel: ObservableObject {
    @Published var fruitArray: [FruitModel] = []
    @Published var isLoading: Bool = false
    
    func deleteFruit (index: IndexSet) {
        fruitArray.remove (atOffsets: index)
    }
    
    init() {
        getFruits()
    }
    
    func getFruits(){
        let fruit1 = FruitModel(count: 34, fruitName: "Pineapple 🍍")
        let fruit2 = FruitModel(count: 49, fruitName: "Orange 🍊")
        let fruit3 = FruitModel(count: 66, fruitName: "Kiwi 🥝")
        let fruit4 = FruitModel(count: 20, fruitName: "Apples 🍎")
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now()+3, execute: {
            self.fruitArray.append(fruit1)
            self.fruitArray.append(fruit2)
            self.fruitArray.append(fruit3)
            self.fruitArray.append(fruit4)
            self.isLoading = false
        })
        
    }
    
}

struct ViewModelBootcamp: View {
    @StateObject var fruitViewModel: FruitViewModel = FruitViewModel()
    var body: some View {
        NavigationView{
            List{
                if(fruitViewModel.isLoading){
                    ProgressView()
                } else {
                    ForEach(fruitViewModel.fruitArray) { fruit in
                        HStack{
                            Text("\(fruit.count)")
                                .font(.headline)
                                .foregroundColor(.green)
                            
                            Text(fruit.fruitName)
                                .font(.headline)
                        }
                        .padding()
                    }
                    .onDelete(perform: fruitViewModel.deleteFruit)
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("Fruits List")
            .navigationBarItems(trailing:
                                    NavigationLink(
                                        destination: RandomView(fruitViewModel: fruitViewModel),
                                        label: {
                                            Image(systemName: "arrow.right")
                                        }))
            //            .onAppear {
            //                fruitViewModel.getFruits()
            //            }
        }
    }
}

struct RandomView: View {
    
    @ObservedObject var fruitViewModel: FruitViewModel
    
    var body: some View {
        ZStack{
            Color.primary.opacity(0.5)
                .ignoresSafeArea(.all)
            NavigationView {
                VStack {
                    ForEach(fruitViewModel.fruitArray) { fruit in
                        HStack {
                            Text(fruit.fruitName)
                                .font(.headline)
                        }
                    }
                }
                .navigationBarItems(trailing:
                                        NavigationLink(
                                            destination: SecondScreen(fruitViewModel: fruitViewModel),
                                            label: {
                                                Image(systemName: "arrow.right")
                                            }))
            }
        }
    }
}

struct SecondScreen : View {
    
    @ObservedObject var fruitViewModel : FruitViewModel
    
    var body: some View {
        ZStack{
            Color.gray
                .ignoresSafeArea()
            
            VStack (spacing : 20){
                Text("Fruit Selected")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                
                ForEach(fruitViewModel.fruitArray) { fruit in
                    HStack{
                        Text(fruit.fruitName)
                            .font(.headline)
                            .foregroundColor(.white)
                    }
                }
            }
            .frame(width: 250, height: 300)
            .background(Color.primary)
            .cornerRadius(25)
            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
        }
    }
}


#Preview {
    ViewModelBootcamp()
}
