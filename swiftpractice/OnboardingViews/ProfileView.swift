//
//  ProfileView.swift
//  swiftpractice
//
//  Created by Vishal Sharma on 12/04/24.
//

import SwiftUI

struct ProfileView: View {
    
    // app storage
    @AppStorage("name") var currentUserName: String?
    @AppStorage("age") var currentUserAge: Int?
    @AppStorage("gender") var currentUserGender: String?
    @AppStorage("preference") var currentUserPreference: String?
    @AppStorage("signed_in") var currentUserSignedIn : Bool = false
    
    var body: some View {
        ZStack {
            RadialGradient (
                gradient : Gradient(colors: [Color(#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)), Color(#colorLiteral(red: 0.1921568662, green: 0.007843137719, blue: 0.09019608051, alpha: 1))]),
                center: .topLeading,
                startRadius: 5,
                endRadius: UIScreen.main.bounds.height)
            .ignoresSafeArea()
            
            VStack {
                VStack(spacing:5){
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                    Text(currentUserName ?? "Your name here")
                    Text("Age: \(currentUserAge ?? 0)")
                         Text("Gender: \(currentUserGender ?? "unknown")")
                    Text("Preference: \(currentUserPreference ?? "unknown")")
                        .padding(.bottom)
                    
                    Text("SIGN OUT")
                        .foregroundStyle(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        .background(Color(#colorLiteral(red: 0.1921568662, green: 0.007843137719, blue: 0.09019608051, alpha: 1)))
                        .cornerRadius(20)
                }
                .font(.title2)
                .foregroundColor(Color(#colorLiteral(red: 0.1921568662, green: 0.007843137719, blue: 0.09019608051, alpha: 1)))
                .padding(.horizontal, 40)
                .padding(.vertical, 40)
                .background(Color.white)
                .cornerRadius(20)
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                .onTapGesture {
                    signOut()
                }
            }.padding(.horizontal, 40)
        }
    }
    
    func signOut() {
        currentUserName = nil
        currentUserAge = nil
        currentUserGender = nil
        currentUserPreference = nil
        withAnimation(.spring) {
            currentUserSignedIn = false
        }
    }
}

#Preview {
    ProfileView()
}
