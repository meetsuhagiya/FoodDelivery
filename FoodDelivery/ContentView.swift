//
//  ContentView.swift
//  FoodDelivery
//
//  Created by student on 08/01/25.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        ZStack{
            Image("welcom_bg")
                .resizable()
                .scaledToFill()
                .frame(width: .screenWidth, height: .screenHeight)
            
            VStack{
                Spacer()
                
                Image("app_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60,height: 60)
                    .padding(.bottom,8)
                Text("Welcome\nto our Store")
                    .font(.customfont(.semibold, fontSize: 48))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                Text("Get your groceries fast")
                    .font(.customfont(.medium, fontSize: 16))
                    .foregroundColor(.white.opacity(0.7))
                    .multilineTextAlignment(.center)
                    .padding(.bottom,30)
                
                NavigationLink{
                    SingInView()
                    
                } label: {
                    RoundButton(title : "Get Started"){
                    }
                }
                Spacer()
                    .frame(height: 80)
            }
          .padding(.horizontal, 20)
            
        }
        .navigationTitle("")
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    
    }
}

#Preview {
    NavigationView{
        WelcomeView()
    }
}
