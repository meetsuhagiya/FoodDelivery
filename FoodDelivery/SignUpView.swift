//
//  SignUpView.swift
//  FoodDelivery
//
//  Created by student on 20/01/25.
//

import SwiftUI

struct SignUpView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @StateObject var mainVM = MainViewModel.shared
    
    var body: some View {
        ZStack{
            Image("bottom_bg")
                .resizable()
                .scaledToFit()
                .frame(width: .screenWidth,height: .screenHeight)
            
            ScrollView{
                VStack{
                    Image("color_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50,height: 50)
                        .padding(.top,100)
                    Spacer()
                    
                    
                        .padding(.bottom,65)
                    Text("Sign up")
                }
            }
        }
      
    }
}

#Preview {
    SignUpView()
}
