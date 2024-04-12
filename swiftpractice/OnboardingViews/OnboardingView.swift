//
//  OnboardingView.swift
//  swiftpractice
//
//  Created by Vishal Sharma on 11/04/24.
//

import SwiftUI

struct OnboardingView: View {
    
    // Onboarding view
    /*
      0 - Welcome Screen
      1 - Add name
      2 - Add age
      3 - Add gender
      4 - Add preference
     */
    @State var onboardingState : Int = 0
    let transition : AnyTransition = .asymmetric(
        insertion: .move(edge: .trailing),
        removal: .move(edge: .leading))
    
    // onboarding inputs
    @State var name : String = ""
    @State var age : Double = 25
    @State var gender : String = ""
    @State var preference: String = "Straight"
    
    // for the alert
    @State var alertTitle : String = ""
    @State var showAlert : Bool = false
    
    // app storage
    @AppStorage("name") var currentUserName: String?
    @AppStorage("age") var currentUserAge: Int?
    @AppStorage("gender") var currentUserGender: String?
    @AppStorage("preference") var currentUserPreference: String?
    @AppStorage("signed_in") var currentUserSignedIn : Bool = false
    
    var body: some View {
        ZStack{
            // content
            ZStack{
                switch onboardingState {
                case 0 :
                    welcomeSection.transition(transition)
                case 1 :
                    addNameSection.transition(transition)
                case 2 :
                    addAgeSection.transition(transition)
                case 3 :
                    addGenderSection.transition(transition)
                case 4 :
                    addPreferenceSection.transition(transition)
                default :
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(.red)
                }
            }
            
            // button
            VStack{
                Spacer()
                bottomButton
            }
        }
        .alert(isPresented: $showAlert) {
            return Alert(title: Text("\(alertTitle)"))
        }
    }
}

#Preview {
    OnboardingView()
        .background(RadialGradient (
            gradient : Gradient(colors: [Color(#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)), Color(#colorLiteral(red: 0.1921568662, green: 0.007843137719, blue: 0.09019608051, alpha: 1))]),
            center: .topLeading,
            startRadius: 5,
            endRadius: UIScreen.main.bounds.height
        ))
}

// MARK: COMPONENTS
extension OnboardingView {
    
    private var bottomButton: some View {
        Text(onboardingState == 0 ? "SIGN UP" :
                onboardingState == 4 ? "FINISH" :
                "Next"
            )
              .font(.headline)
              .foregroundColor(Color(#colorLiteral(red: 0.1921568662, green: 0.007843137719, blue: 0.09019608051, alpha: 1)))
              .frame(height: 55)
              .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
              .background(Color.white)
              .cornerRadius(10)
              .padding(20)
              .animation(nil, value: UUID())
              .onTapGesture{
                  handlePageChange()
              }
        
      }
    
    private var welcomeSection: some View {
        VStack(spacing : 20) {
            Spacer()
            
            Image(systemName: "heart.text.square.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 175, height: 175)
                .foregroundColor(Color.white)
            
            Text("Find the Right ONE!!")
                .font(.title)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .overlay(
                    Capsule(style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                        .frame(height: 3)
                        .offset(y:20)
                        .foregroundColor(.white)
                )
            
            Text("This is the #1 app for finding your match online. In this tutorial we are practicing using AppStore and other SwiftUI techniques.")
                .fontWeight(.medium)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
            Spacer()
            Spacer()
        }
        .padding(30)
    }
    
    private var addNameSection : some View {
        VStack(spacing : 20) {
            Spacer()
            
            Text("What's your name?")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .padding(.bottom)
                .overlay(
                    Capsule(style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                        .frame(height: 3)
                        .offset(y:20)
                        .foregroundColor(.white)
                )
                
            TextField("Your name here..." , text: $name)
                .font(.headline)
                .frame(height: 55)
                .padding(.horizontal, 20)
                .background(Color.white)
                .cornerRadius(10)
            
            Spacer()
            Spacer()
        }
        .padding(30)
    }
    
    private var addAgeSection : some View {
        VStack(spacing : 20) {
            Spacer()
            
            Text("What's your age?")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                
            
            Text("\(String(format: "%0.f", age))")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .overlay(
                    Capsule(style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                        .frame(height: 3)
                        .offset(y:25)
                        .foregroundColor(.white)
                )
            
              
            Slider(value: $age, in: 18 ... 75, step: 1)
                .accentColor(.white)
            
            Spacer()
            Spacer()
        }
        .padding(30)
    }
    
    private var addGenderSection : some View {
        VStack(spacing : 20) {
            Spacer()
            
            Text("Select your gender")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .overlay(
                    Capsule(style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                        .frame(height: 3)
                        .offset(y:20)
                        .foregroundColor(.white)
                )
            
            Picker(selection: $gender, label: Text("Gender")) {
                Text("Swipe to select").tag("Swipe to select").font(.title2).foregroundColor(.white)
                Text("Male").tag("Male").font(.title2).foregroundColor(.white)
                Text("Female").tag("Female").font(.title2).foregroundColor(.white)
                Text("Keep it Secret").tag("Keep it Secret").font(.title2).foregroundColor(.white)
            }
            .pickerStyle(InlinePickerStyle())
            
            
            Text(gender)
                .font(.headline)
                .foregroundColor(.white)
                .fontWeight(.semibold)
                .frame(width: 100, height: 55)
                .background(Color.white.opacity(0.3))
                .cornerRadius(30)
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            
            Spacer()
            Spacer()
        }
        .padding(30)
    }
    
    private var addPreferenceSection : some View {
        VStack {
            Spacer()
            
            Text("What's your preference?")
                .font(.title)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .overlay(
                    Capsule(style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                        .frame(height: 3)
                        .offset(y:20)
                        .foregroundColor(.white)
                )
          
            Picker(selection: $preference, label: Text("Preference")) {
                Text("Straight").tag("Straight").font(.title2).foregroundColor(.white)
                           Text("BiSexual").tag("BiSexual").font(.title2).foregroundColor(.white)
                           Text("Any").tag("Any").font(.title2).foregroundColor(.white)
            }
            .pickerStyle(InlinePickerStyle())
                       
            
            Text(preference)
                .font(.headline)
                .foregroundColor(.white)
                .fontWeight(.semibold)
                .frame(width: 100, height: 55)
                .background(Color.white.opacity(0.3))
                .cornerRadius(30)
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)

           
            Spacer()
            Spacer()
        }

    }
}

// MARK: FUNCTIONS
extension OnboardingView {
    
    func handlePageChange() {
        
        // CHECK INPUTS
        switch onboardingState {
        case 1 :
            guard name.count >= 3 else {
                showAlert(title: "Your name must be least 3 characters long! 🥺")
                return
            }
//        case 3 :
//            guard (gender.count == 0 ||  gender != "Swipe to select") else {
//                showAlert(title: "Please select your gender 🤨")
//                return
//            }
        default:
            break
        }
        
        // GO TO NEXT SCREEN
        if(onboardingState == 4){
            signIN()
        } else {
            withAnimation(.spring) {
                onboardingState += 1
            }
        }
    }
    
    func signIN() {
        currentUserName = name
        currentUserAge = Int(age)
        currentUserGender = gender
        currentUserPreference = preference
        withAnimation(.spring()){
            currentUserSignedIn = true
        }
    }
    
    func showAlert(title : String){
        alertTitle = title
        showAlert.toggle()
    }
}
