//
//  SignUpView.swift
//  FoodDelivery
//
//  Created by student on 20/01/25.
//

import SwiftUI

struct SignUpView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @StateObject var mainVM = MainViewModel.shared;
    
    var body: some View {
        ZStack{
            Image("bottom_bg")
                .resizable()
                .scaledToFit()
                .frame(width: .screenWidth,height: .screenHeight)
                .padding(.bottom,25)
            
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
                        .padding(.trailing,250)
                        .font(.customfont(.semibold, fontSize: 26))
                        .foregroundColor(.primaryText)
                        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/,maxWidth:.infinity,alignment: .leading)
                        .padding()
                    Text("Enter your credentials to continue")
                        .font(.customfont(.semibold, fontSize: 16))
                        .foregroundColor(.secondaryText)
                        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/,maxWidth: .infinity,alignment: .leading)
                        .padding(.bottom)
                        .padding(.leading)
                    
                    
                    LineTextField( title: "Username", placholder: "Enter your username", txt: $mainVM.txtUsername)
                        .padding()
                    
                    LineTextField( title: "Email", placholder: "Enter your email address", txt: $mainVM.txtEmail, keyboardType: .emailAddress)
                        .padding()
                    
                    LineSecureField( title: "Password", placholder: "Enter your password", txt: $mainVM.txtPassword, isShowPassword: $mainVM.isShowPassword)
                        .padding()
                    
                    VStack(alignment: .leading){
                        HStack{
                            Text("By continuing you agree to our")
                                .font(.customfont(.medium, fontSize: 14))
                                .foregroundColor(.secondaryText)
                            
                            Text("terms and conditions")
                                .font(.customfont(.medium, fontSize: 14))
                                .foregroundColor(.primaryApp)
                            
                        }  .padding(.top,-5)
                            .padding(.leading)
                        HStack{
                            Text("and")
                                .font(.customfont(.medium, fontSize: 14))
                                .foregroundColor(.secondaryText)
                            
                            Text("privacy policy")
                                .font(.customfont(.medium, fontSize: 14))
                                .foregroundColor(.primaryApp)
                            
                            
                        }
                        .padding(.top,-2)
                        .padding(.leading)
                        
                        Button{
                            mainVM.serviceCallLogin()
                        }label: {
                            Text("Sign Up")
                                .font(.customfont(.semibold, fontSize: 18))
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                                .frame( minWidth: 0, maxWidth: .infinity, minHeight: 60, maxHeight: 60 )
                        }
                        .background(Color.primaryApp)
                        .cornerRadius(20)
                        .padding()
                        HStack(alignment: .center){
                            Text("Already have an account?")
                                .font(.customfont(.semibold, fontSize: 16))
                                .foregroundColor(.primaryText)
                            
                            
                            NavigationLink {
                                //                                     LoginView()
                            } label: {
                                Text("Sign In")
                                    .font(.customfont(.semibold, fontSize: 16))
                                    .foregroundColor(.primaryApp)
                            }
                        }
                        .padding(.top,-15)
                        .padding(.leading,60)
                        
                        
                    }
                    .padding(.bottom,190)
                    
                    
                    
                    
                }
            
            }
        }
        // Alert
                .alert(isPresented: $mainVM.showError, content: {
                    Alert(title: Text(Globs.AppName), message: Text(mainVM.errorMessage) , dismissButton: .default(Text("Ok")))
                })
    }
    
    
}


#Preview {
    SignUpView()
}
