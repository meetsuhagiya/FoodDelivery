import SwiftUI

struct LoginView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @StateObject var loginVM = MainViewModel.shared

    var body: some View {
        ZStack {
            Image("bottom_bg")
                .resizable()
                .scaledToFit()
                .frame(width: .screenWidth, height: .screenHeight)
            
            VStack {
                Image("color_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .padding(.top, 100)
                
                Spacer()
                
                Text("logIn")
                    .font(.customfont(.semibold, fontSize: 26))
                    .foregroundColor(.primaryText)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 30)
                
                Text("Enter your email and password")
                    .font(.customfont(.semibold, fontSize: 16))
                    .foregroundColor(.secondaryText)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 30)
                
                LineTextField(title: "Email", placholder: "Enter your email address", txt: $loginVM.txtEmail, keyboardType: .emailAddress)
                    .padding(.bottom, 30)
                
                LineSecureField(title: "Password", placholder: "Enter your password", txt: $loginVM.txtPassword, isShowPassword: $loginVM.isShowPassword)
                    .padding(.bottom, 10)
                
                Button {
                    // Handle forgot password action
                } label: {
                    Text("Forgot Password?")
                        .font(.customfont(.medium, fontSize: 14))
                        .foregroundColor(.primaryText)
                }
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                .padding(.bottom, 25)
                
                Button {
                    loginVM.serviceCallLogin()
                } label: {
                    Text("Get Started")
                        .font(.customfont(.semibold, fontSize: 18))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 60, maxHeight: 60)
                }
                .background(Color.primaryApp)
                .cornerRadius(20)
                .padding(.bottom, 10)
                
                HStack {
                    Text("Don't have an account?")
                        .font(.customfont(.semibold, fontSize: 16))
                        .foregroundColor(.primaryText)
                    
                    NavigationLink {
                        SignUpView()
                    } label: {
                        Text("SignUp")
                            .font(.customfont(.semibold, fontSize: 16))
                            .foregroundColor(.primaryApp)
                    }
                }
            }
            .padding(.bottom, 190)
            .padding(.horizontal, 20)
            .padding(.bottom, .bottomInsets)
            
            VStack {
                HStack {
                    NavigationLink {
                        SingInView()
                    } label: {
                        Image("back")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                    }
                    Spacer()
                }
                Spacer()
            }
            .padding(.top, 60)
            .padding(.horizontal, 20)
        }
        .alert(isPresented: $loginVM.showError) {
            Alert(title: Text(Globs.AppName), message: Text(loginVM.errorMessage), dismissButton: .default(Text("Ok")))
        }
        // Navigation modifiers should be inside the body
        .navigationTitle("") // Empty title to remove default title
        .navigationBarHidden(true) // Hides the navigation bar
        .navigationBarBackButtonHidden(true) // Hides the back button
        .ignoresSafeArea() // Ignoring safe area to cover the entire screen
    }
}

#Preview {
    LoginView()
}
