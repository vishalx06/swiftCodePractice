//
//  EnviromentObjectBootcamp.swift
//  swiftpractice
//
//  Created by Vishal Sharma on 11/04/24.
//

import SwiftUI

class EnviromentViewModel : ObservableObject {
    @Published var dataArray : [String] = []
    
    init(){
        getData()
    }
    
    func getData(){
        self.dataArray.append(contentsOf: ["iPhone", "iPad", "macBook", "iWatch"])
    }
    
}


struct EnviromentObjectBootcamp: View {
    
    @StateObject var viewModel : EnviromentViewModel = EnviromentViewModel()

    var body: some View {
        NavigationView{
            List{
                ForEach(viewModel.dataArray, id: \.self) { item in
                    NavigationLink (destination: Destination(selectedItem: item)) {
                        Text(item)
                    }
                }
            }
            .navigationTitle("iStore")
        }
        .environmentObject(viewModel)
    }
}

struct Destination : View {
    
    let selectedItem : String
    
    var body: some View {
        ZStack{
            Color.pink
                .opacity(0.8)
                .ignoresSafeArea()
            NavigationLink (
                destination: NewDestination(),
                label: {
                    Text(selectedItem)
                        .font(.headline)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                        .foregroundStyle(Color.pink)
                        .background(Color.white)
                        .cornerRadius(35)
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                })
        }
    }
}

struct NewDestination : View {
    
    @EnvironmentObject var viewModel : EnviromentViewModel
    
    var body: some View {
        ZStack{
            LinearGradient(
                gradient: Gradient(colors: [Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)), Color(#colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1))]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing)
            .ignoresSafeArea()
        
            
            VStack (spacing: 10){
                ForEach(viewModel.dataArray, id: \.self){ item in
                    Text(item)
                }
            }
            .font(.largeTitle)
            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            .foregroundColor(.white)
            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
        }
    }
}

#Preview {
    EnviromentObjectBootcamp()
//    NewDestination()
}
