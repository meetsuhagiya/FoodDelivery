import SwiftUI
import CountryPicker

struct SingInView: View {
    
    @State var txtMobile: String = "" // Mobile input state
    @State var isShowPicker: Bool = false // Country picker state
    @State var countryObj: Country?  // Country object state
    
    var body: some View {
        ZStack {
            
            Image("bottom_bg")
                .resizable()
                .scaledToFit()
                .frame(width: .screenWidth,height: .screenHeight)
            
            
            VStack {
                // Top Image
                Image("sign_in_top")
                    .resizable()
                    .scaledToFit()
                    .frame(width: .screenWidth,height: .screenHeight)
                    .padding(.bottom,525)
                    
                
            }
                
                ScrollView {
                    VStack {
                        
                        // Heading
                        Text("Get your groceries\nwith nectar")
                            .padding(.top,480)
                            .font(.customfont(.semibold, fontSize: 30))
                            .multilineTextAlignment(.leading)
                            .padding(.top, 100)
                            .padding(.trailing, 130)
                            .padding(.bottom, 30)
                        
                        
                        HStack {
                           
                            Button {
                                isShowPicker = true // Show the country picker
                            } label: {
                                if let countryObj = countryObj {
                                    Text("\(countryObj.isoCode.getFlag())")
                                        .font(.customfont(.medium, fontSize: 35))
                                        .padding(.leading, 25)
                                    
                                    Text("+\(countryObj.phoneCode)")
                                        .font(.customfont(.medium, fontSize: 18))
                                        .foregroundColor(.primaryText)
                                }
                            }
                            
                            TextField("Enter Mobile", text: $txtMobile)
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .padding(.trailing, 188)  // Adjusted for country flag and code space
                        }
                        Divider()
                            .frame(width: 350)
                    }
                    .padding(.top,-40)
                    VStack {
                        
               
                        Text("Or login with social media")
                            .font(.customfont(.semibold, fontSize: 16))
                            .foregroundColor(.textTitle)
                            .multilineTextAlignment(.center)
                            .padding(.top, 30)
                            .padding(.bottom, 35)
                        
                        // Google Login Button
                        Button {
                            // Google login action
                        } label: {
                            HStack {
                                Image("google_logo")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20, height: 20)
                                    .padding(.trailing, 20)
                                
                                Text("Continue with Google")
                                    .font(.customfont(.semibold, fontSize: 18))
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.center)
                                    .padding(.trailing, 40)
                            }
                            
                        }
                
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 60, maxHeight: 60)
                        .background(Color(hex: "5383EC"))
                        .cornerRadius(20)
                        .padding(.horizontal, 20)
                        .padding(.bottom, 10)
                        
                        // Facebook Login Button
                        Button {
                            // Facebook login action
                        } label: {
                            HStack {
                                Image("fb_logo")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20, height: 20)
                                    .padding(.trailing, 20)
                                
                                Text("Continue with Facebook")
                                    .font(.customfont(.semibold, fontSize: 18))
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.center)
                                    .padding(.trailing, 21)
                            }
                        }
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 60, maxHeight: 60)
                        .background(Color(hex: "4A6680"))
                        .cornerRadius(20)
                        .padding(.horizontal, 20)
                    }
                }
            .padding(.top, 90)
        }
        .onAppear{
            self.countryObj = Country(phoneCode: "91", isoCode: "IN")
        } 
        .sheet(isPresented: $isShowPicker, content: {
            CountryPickerUI(country: $countryObj)
        })
        .navigationTitle("")
        .ignoresSafeArea()
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    SingInView()
}
